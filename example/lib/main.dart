import 'package:flutter/material.dart';
import 'package:tiledjsonreader/tiledjsonreader.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String json = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title ?? ''),
      ),
      body: SingleChildScrollView(
        child: Text(json),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _loadMap,
        tooltip: 'Load',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _loadMap() {
    TiledJsonReader tiled = TiledJsonReader('assets/tiled8/mapa.tmj');
    tiled.read().then((value) {
      setState(() {
        json = value.toJson().toString();
      });
    });
  }
}
