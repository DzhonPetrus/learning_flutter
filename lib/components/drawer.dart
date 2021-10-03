import 'package:flutter/material.dart';

class MyUserDrawer extends StatefulWidget {
  const MyUserDrawer({Key? key}) : super(key: key);

  @override
  State<MyUserDrawer> createState() => _MyUserDrawerState();
}

class _MyUserDrawerState extends State<MyUserDrawer> {

  void _logout() {
    Navigator.pop(context);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("John Peter Narzoles"),
              accountEmail: Text("dzhonpetrus@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/developer.jpg')
              )
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Juan Pedro"),
              subtitle: Text("Developer"),
              // trailing: Icon(Icons.edit)

            ),
            ListTile(
              leading: Icon(Icons.email),
              title: Text("Email"),
              subtitle: Text("dzhonpetrus@gmail.com"),
              // trailing: Icon(Icons.edit)

            ),
            ListTile(),
            ListTile(),
            ListTile(),
            ListTile(),
            ListTile(),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Logout"),
              onTap: _logout
            ),
          ],
        )
      );
  }
}