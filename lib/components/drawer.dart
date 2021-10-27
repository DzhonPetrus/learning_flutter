import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../login.dart';

class MyUserDrawer extends StatefulWidget {
  const MyUserDrawer({Key? key}) : super(key: key);

  @override
  State<MyUserDrawer> createState() => _MyUserDrawerState();
}

class _MyUserDrawerState extends State<MyUserDrawer> {

  void _logout() {
    Constants.prefs.setBool("loggedIn", false);
    Navigator.pushReplacementNamed(context, LoginPage.routeName);
    // Navigator.popUntil(context, ModalRoute.withName('/login'));
    // Navigator.pop(context);
    // Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text("John Peter Narzoles"),
              accountEmail: Text("dzhonpetrus@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/developer.jpg')
              )
            ),
            const ListTile(
              leading: Icon(Icons.person),
              title: Text("Juan Pedro"),
              subtitle: Text("Developer"),
              // trailing: Icon(Icons.edit)

            ),
            const ListTile(
              leading: Icon(Icons.email),
              title: Text("Email"),
              subtitle: Text("dzhonpetrus@gmail.com"),
              // trailing: Icon(Icons.edit)

            ),
            const ListTile(),
            const ListTile(),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Logout"),
              onTap: _logout
            ),
          ],
        )
      );
  }
}