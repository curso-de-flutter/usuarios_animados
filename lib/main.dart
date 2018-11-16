import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new FutureBuilder(
          future: http.get('https://reqres.in/api/users?per_page=12'),
          builder: (context, snapshot){
            if(snapshot.connectionState == ConnectionState.done){

              Map<String, dynamic> dataResponse = json.decode(snapshot.data.body);

              return Container(
                padding: EdgeInsets.all(16.0),
                child: ListView(
                  children: dataResponse['data'].map<Widget>(
              (item){
                return Container(
                  child: GestureDetector(
                    onTap: () {

                    },
                    child: Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Image.network(item['avatar']),
                          Text('${item['first_name']} ${item['last_name']}'),
                        ],
                      ),
                    ),
                  ),
                );
              }
                  ).toList(),
                ),
              );
            }else{
              return Container(
                child: Center(child: CircularProgressIndicator()),
              );
            }
          }
      ),
    );
  }
}

class ImageViewer extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(),
      body: Container(
        child: Center(
          child: Text('Nueva Pantalla'),
        ),
      ),
    );
  }
}