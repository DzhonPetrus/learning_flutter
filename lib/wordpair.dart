import 'package:flutter/material.dart';

class WordPair extends StatefulWidget {
  const WordPair({Key? key}) : super(key: key);

  @override
  WordPairState createState() => WordPairState();
}

class WordPairState extends State<WordPair> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(title: const Text('WordPair')),
      body: Center(),
    );
  }
}