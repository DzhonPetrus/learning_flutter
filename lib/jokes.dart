import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class JokesPage extends StatefulWidget {
  static const String routeName = "/jokes";
  const JokesPage({Key? key}) : super(key: key);

  @override
  _JokesPageState createState() => _JokesPageState();
}

class _JokesPageState extends State<JokesPage> {

  final _url = Uri.http('v2.jokeapi.dev', '/joke/Programming', {'amount' : '5', 'type' : 'twopart'});
  var _data;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  _fetchData() async {
    var res = await http.get(_url);
    _data = jsonDecode(res.body)["jokes"];

    setState(() { }); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        title: const Text('Jokes'),
      ),
      body: _data != null 
        ? ListView.builder(
          itemBuilder: (context, index){
            return ListTile(
              title: Text(_data[index]["setup"]),
              subtitle: Text(_data[index]["delivery"]),
            );
          },
          itemCount: _data.length
          )
        : const Center(child: CircularProgressIndicator())
    );
  }
}