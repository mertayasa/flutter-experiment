import 'package:experiment/update_user_list.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:provider/provider.dart';

class WaifuPics extends StatelessWidget {
  // const WaifuPics({Key? key}) : super(key: key);
  final String apiUrl = "https://api.waifu.pics/sfw/waifu";

  Future getWaifuImage() async {
    var result = await http.get(Uri.parse(apiUrl));
    return json.decode(result.body);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UpdateUserList>(
        create: (context) => UpdateUserList(),
        child: Consumer<UpdateUserList>(
            builder: (contex, updateUser, _) => Scaffold(
                appBar: AppBar(title: Text('Pics')),
                floatingActionButton: Consumer<UpdateUserList>(
                    builder: (contex, updateUser, _) => FloatingActionButton(
                          onPressed: () {
                            updateUser.isListRefresh = true;
                          },
                          child: Icon(Icons.refresh),
                        )),
                body: FutureBuilder(
                  future: getWaifuImage(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                   if (snapshot.connectionState == ConnectionState.done) {
                          return Center(
                            child: Image.network(snapshot.data['url']),
                          );
                        } else {
                          return Center(child: CircularProgressIndicator());
                        }
                  },
                )
          )
        )
      );
  }
}
