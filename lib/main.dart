import 'package:flutter/material.dart';

import 'counter.dart';
import 'dashboard.dart';
import 'form.dart';
import 'jokes.dart';
import 'login.dart';
import 'wordpair.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'First Flutter App',
      theme: ThemeData(primarySwatch: Colors.amber),
      home: const LoginPage(),
      routes: {
        LoginPage.routeName: (context) => const LoginPage(),
        FormPage.routeName: (context) => const FormPage(),
        JokesPage.routeName: (context) => const JokesPage(),
        WordPairPage.routeName: (context) => const WordPairPage(),
        Dashboard.routeName: (context) => const Dashboard(),
        Counter.routeName: (context) => const Counter(),
      }

    )
  );
}