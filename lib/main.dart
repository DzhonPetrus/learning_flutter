import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'counter.dart';
import 'dashboard.dart';
import 'form.dart';
import 'jokes.dart';
import 'login.dart';
import 'utils/constants.dart';
import 'wordpair.dart';

Future main() async {
  await dotenv.load(fileName: '.env');
  WidgetsFlutterBinding.ensureInitialized();
  Constants.prefs = await SharedPreferences.getInstance();

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Juan Teknolohiya First Flutter App',
      theme: ThemeData(primarySwatch: Colors.amber),
      home: Constants.prefs.getBool("loggedIn") == true ? const Dashboard() : const LoginPage(),
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