import 'package:experiment/app_color.dart';
import 'package:experiment/fetch_user.dart';
import 'package:experiment/red_image.dart';
import 'package:experiment/waifu_pics.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppColor>(
        create: (context) => AppColor(),
        child: Consumer<AppColor>(
          builder: (contex, appColor, _) => MaterialApp(
            theme: ThemeData(
              primarySwatch: Colors.blue,
              appBarTheme: AppBarTheme(color: appColor.appColor),
            ),
            home: Scaffold(
              appBar: appbar(),
              // body: UserList(),
              body: HomeScreen(),
            ),
          ),
        ));
  }

  AppBar appbar() {
    return AppBar(
      title: Text('Experiment Dude'),
    );
  }

  // Widget body(context) {

  // }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ChangeNotifierProvider<RedImage>(
            create: (context) => RedImage(),
            child: Consumer<RedImage>(
                builder: (context, redImage, _) => Column(
                      children: [
                        Visibility(
                            visible: redImage.isImageVisible,
                            child: Image.asset(
                              "Images/44.jpg",
                              height: 150,
                            )),
                        Consumer<RedImage>(
                            builder: (context, redImage, _) => Switch(
                                value: redImage.isImageVisible,
                                onChanged: (newValue) {
                                  redImage.isImageVisible = newValue;
                                  // appColor.isLightBLue = newValue;
                                })),
                      ],
                    )),
          ),
          Consumer<AppColor>(
            builder: (context, appColor, _) => AnimatedContainer(
              duration: Duration(microseconds: 500),
              width: 100,
              height: 100,
              color: appColor.appColor,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('PDI'),
              Consumer<AppColor>(
                  builder: (contextColor, appColor, _) => Switch(
                      value: appColor.isLightBlue,
                      onChanged: (newValue) {
                        appColor.isLightBLue = newValue;
                        // appColor.isLightBLue = newValue;
                      })),
              Text('PAN')
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Consumer<AppColor>(
                  builder: (context, appColor, _) => 
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: TextButton(
                      child: Icon(Icons.people),
                      style: TextButton.styleFrom(
                          backgroundColor: appColor.appColor,
                          primary: Colors.white),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => UserList()),
                        );
                      })
                  )
                  ),
              Consumer<AppColor>(
                  builder: (context, appColor, _) => Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: TextButton(
                          child: Icon(Icons.star),
                          style: TextButton.styleFrom(
                            backgroundColor: appColor.appColor,
                            primary: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => WaifuPics()),
                            );
                          })
                )
              )
            ],
          )
        ],
      ),
    );
  }
}
