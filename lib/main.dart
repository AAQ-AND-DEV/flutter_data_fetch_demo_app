import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() async {
  List _data = await getJson();
  List _imgs = ['https://i.stack.imgur.com/Dw6f7.png',
  'https://i.stack.imgur.com/XPOr3.png', 'https://i.stack.imgur.com/YN0m7.png',
'https://i.stack.imgur.com/wKzo8.png', 'https://i.stack.imgur.com/Qt4JP.png'];
  //print("data: $_data");
  print(_data[0]["title"]);
  for (int i = 0; i < _data.length; i++) {
    print("Data: ${_data[i]["title"]}");
  }
  runApp(new MaterialApp(
      home: new Scaffold(
    appBar: AppBar(
      title: Text("JsonParsing"),
      backgroundColor: Colors.orange,
    ),
    body: ListView.builder(
        itemCount: _data.length,
        itemBuilder: (BuildContext context, int pos) {
          return Column(
            children: <Widget>[
              Divider(
                height: 13.4,
                color: Colors.orangeAccent,
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      //"https://www.w3schools.com/w3css/img_lights.jpg",
                      "${_imgs[pos%5]}",
                      scale: .5),
                ),
                title: Text(
                  _data[pos]["title"],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.red,
                    decorationStyle: TextDecorationStyle.wavy,
                  ),
                ),
                subtitle: Text(_data[pos]["body"]),
                trailing: Icon(Icons.keyboard_arrow_right),
              )
            ],
          );
        }),
  )));
}

Future<List> getJson() async {
  String apiUrl = "https://jsonplaceholder.typicode.com/posts";

  http.Response response = await http.get(apiUrl);

  return json.decode(response.body);
}
