import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _heart = 0;

  void _buttonPress() {
    setState((){ _heart++; });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(padding: EdgeInsets.all(25)),
            const Text('Welcome to Dashboard!'),
            IconButton(onPressed: _buttonPress, icon: const Icon(
              Icons.favorite,
              color: Colors.pink,
              size: 24.0
            )),
            Text("You clicked heart icon '$_heart' times."),
          ],
        ),
      ),
    );
  }
}