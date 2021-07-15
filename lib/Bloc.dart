import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'API.dart';

class Bloc extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BlocState();
  }
}

class BlocState extends State<Bloc> {
  getUserData() async {
    var response = await http.get('https://itunes.apple.com/us/rss/topaudiobooks/limit=25/json');
    var jsonData = jsonDecode(response.body);
    List<User> users = [];
    for(var u in jsonData){
      User user = User(u['name'], u['uri'], u['entry']);
      users.add(user);
    }
    print(users.length);
    // return users;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('halo'),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.grey,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.watch),
        onPressed: () => getUserData(),

      ),
    );
  }
}



