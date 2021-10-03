import 'package:flutter/material.dart';

import 'login.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'First Flutter App',
      theme: ThemeData(primarySwatch: Colors.amber),
      home: const LoginPage()

    )
  );
}