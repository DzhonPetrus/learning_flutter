import 'package:flutter/material.dart';

class FooderlichPage extends StatefulWidget {
  const FooderlichPage({Key? key}) : super(key: key);

  @override
  _FooderlichPageState createState() => _FooderlichPageState();
}

class _FooderlichPageState extends State<FooderlichPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Fooderlich'),),
    );
  }
}