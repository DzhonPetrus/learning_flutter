import 'package:flutter/material.dart';

import 'dashboard.dart';
import 'utils/constants.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = "/login";
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    var _username = _usernameController.text;
    var _password = _passwordController.text;


    if(_username == 'admin' && _password == 'password') {
      // Navigator.push(
      //   context, 
      //   MaterialPageRoute(
      //     builder: (context) => const Dashboard(),
      //   )
      // );
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Logged In Success!"),
        backgroundColor: Colors.green,
        ));
      Constants.prefs.setBool("loggedIn", true);
      Navigator.pushReplacementNamed(context, Dashboard.routeName);
    }else{
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Invalid Username or Password!"),
        backgroundColor: Colors.red,
        ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('First Flutter App')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width:200,
              height:200,
              child: Image.asset('assets/JUAN_TEKNOLOHIYA.png')
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 70,
                right: 70,
                bottom: 10,
              ),
              child: TextFormField(
                controller: _usernameController,
                style: const TextStyle(
                  color:Colors.black,
                  fontSize: 16,
                ),
                cursorColor: Colors.black,
                decoration: const InputDecoration(
                  hintText: 'Input Username',
                  labelText: "Username",
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 70,
                right: 70,
                bottom: 10,
              ),
              child: TextFormField(
                controller: _passwordController,
                obscureText: true,
                style: const TextStyle(
                  color:Colors.black,
                  fontSize: 16,
                ),
                cursorColor: Colors.black,
                decoration: const InputDecoration(
                  hintText: 'Input Password',
                  labelText: "Password",
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.3,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35.0),
                color: Colors.amber,
              ),
              child: MaterialButton(
                onPressed: _login,
                child: const Text('Login'),
              ),
            ),
            

          ],
        ),
      ),
    );
  }
}