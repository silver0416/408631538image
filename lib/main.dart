import 'package:flutter/material.dart';
import 'app_body.dart';

void main() => runApp(App());

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}
class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter midterm'),
        ),
        body: AppBody(),
      ),
    );
  }
}
