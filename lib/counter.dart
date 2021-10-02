import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _heart = 0;

  void _buttonPress() {
    setState((){ _heart++; });
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