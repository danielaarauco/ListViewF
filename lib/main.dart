import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() => runApp(MiApp());

class MiApp extends StatelessWidget {
  const MiApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Mi App",
      home: Inicio(),
    );
  }
}

class Inicio extends StatefulWidget {
  Inicio({Key key}) : super(key: key);

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  /*List Name;
  Future<String> getData() async {
    var response = await http.get(
        Uri.parse("https://jsonplaceholder.typicode.com/comments"),
        headers: {"Accept": "Application/json"});
    name = json.decode(response.body);
    print(name);
    return "satisfactorio";
  }*/
  Future<List<Name>> getData() async {
    var response = await http.get(
        Uri.parse("https://jsonplaceholder.typicode.com/comments"),
        headers: {"Accept": "Application/json"});
    var data = json.decode(response.body);
    print(data);
    List<Name> comments = [];
    for (var p in data) {
      Name data = Name(p["name"], p["email"]);
      comments.add(data);
    }
    print(comments.length);
    return comments;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Daniela Foto"),
        ),
        body: Column(
          children: <Widget>[
            Center(
              child: Text("Nombre:"),
            ),
            Text("Daniela Arauco"),
            Image.network(
                "https://z-p3-scontent.fsrz1-2.fna.fbcdn.net/v/t1.6435-9/56387494_1609741255822999_731329370257358848_n.jpg?_nc_cat=110&ccb=1-3&_nc_sid=730e14&_nc_ohc=MGANOaOjGI4AX_24IHC&_nc_ht=z-p3-scontent.fsrz1-2.fna&oh=5e5bb3db2d7749a2364236182695c20d&oe=60D2BE1C"),
            RaisedButton(child: new Text("nombre y email"), onPressed: getData)
          ],
        ));
  }
}

class Name {
  Name(p, p2);
}
