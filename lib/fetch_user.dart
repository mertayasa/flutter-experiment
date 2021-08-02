import 'package:experiment/update_user_list.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:provider/provider.dart';

class UserList extends StatelessWidget {
  final String apiUrl = "https://randomuser.me/api/?results=10";
  List user_data = [];

  Future<List<dynamic>> fetchUsers() async {
    var result = await http.get(Uri.parse(apiUrl));
    user_data = json.decode(result.body)['results'];

    return user_data;
  }

  String _name(dynamic user) {
    return user['name']['title'] +
        " " +
        user['name']['first'] +
        " " +
        user['name']['last'];
  }

  String _location(dynamic user) {
    return user['location']['country'];
  }

  String _age(Map<dynamic, dynamic> user) {
    return "Age: " + user['dob']['age'].toString();
  }

  @override
  Widget build(BuildContext context) {
    
    return ChangeNotifierProvider<UpdateUserList>(
        create: (context) => UpdateUserList(),
        child: Consumer<UpdateUserList>(
            builder: (contex, updateUser, _) => Scaffold(
                  appBar: AppBar(title: Text('User List')),
                  body: SafeArea(
                    child: 
                    Visibility(
                      visible: updateUser.isListRefresh == true,
                      child: FutureBuilder<List<dynamic>>(
                      future: fetchUsers(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return ListView.builder(
                              padding: EdgeInsets.all(8),
                              itemCount: snapshot.data.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Card(
                                  child: Column(
                                    children: <Widget>[
                                      ListTile(
                                        leading: CircleAvatar(
                                            radius: 30,
                                            backgroundImage: NetworkImage(
                                                snapshot.data[index]['picture']
                                                    ['large'])),
                                        title:
                                            Text(_name(snapshot.data[index])),
                                        subtitle: Text(
                                            _location(snapshot.data[index])),
                                        trailing:
                                            Text(_age(snapshot.data[index])),
                                      )
                                    ],
                                  ),
                                );
                              });
                        } else {
                          return Center(child: CircularProgressIndicator());
                        }
                      },
                    ),
                    )
                  ),
                  floatingActionButton: 
                  Consumer<UpdateUserList>( 
                    builder: (contex, updateUser, _) => FloatingActionButton(
                    onPressed: () {
                      updateUser.isListRefresh = true;
                    },
                    child: Icon(Icons.refresh),
                  )),
                )));
  }
}
