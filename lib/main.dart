import 'package:flutter/material.dart';
import 'dart:convert' show jsonDecode;


void main() => runApp(new MaterialApp(
  home: new HomePage(),
  theme: new ThemeData(
    primarySwatch: Colors.teal,
  ),
));

class HomePage extends StatefulWidget{
  @override
  HomePageState createState() => new HomePageState();
}
class HomePageState extends State<HomePage>{
  List Data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Load Json App"),
      ),
      body: new Container(
        child: new Center(
          child: new FutureBuilder(
            future: DefaultAssetBundle
            .of(context)
            .loadString('load_json/person.json'),
            builder: (context, snapshot){
              //Decode the json
              var mydata = jsonDecode(snapshot.data.toString());
              return new ListView.builder(
                itemBuilder: (BuildContext context , int index){
                  return new Card(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        new Text("Name : "+mydata[index]['name']),
                        new Text("Age : "+mydata[index]['age']),
                        new Text("Height : "+mydata[index]['height']),
                        new Text("Hair Color : "+mydata[index]['hair_color']),
                        new Text("Gender : "+mydata[index]['gender']),
                      ],
                    ),
                  );
                },
                itemCount: mydata == null?0:mydata.length,
              );
            },
          ),
        ),
      ),
    );
  }
}