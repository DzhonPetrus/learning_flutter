import 'package:flutter/material.dart';

import 'utils/constants.dart';

class Counter extends StatefulWidget {
  static const String routeName = "/counter";
  const Counter({Key? key}) : super(key: key);

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  late int _heart;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _heart = Constants.prefs.getInt("counter") ?? 0 ;
    Constants.prefs.setInt("counter", _heart);
    Constants.prefs.remove("savedWordPairs");
    print(Constants.prefs.get("savedWordPairs"));
  }

  void _buttonPress() {
    setState((){ 
      Constants.prefs.setInt("counter", ++_heart);
     });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter App')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(padding: EdgeInsets.all(35)),
            IconButton(onPressed: _buttonPress, icon: const Icon(
              Icons.favorite,
              color: Colors.pink,
              size: 40.0
            )),
            Text("You clicked heart icon '$_heart' times."),
          ],
        ),

      ),

    );
  }
}