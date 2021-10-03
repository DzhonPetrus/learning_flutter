import 'package:flutter/material.dart';

import 'counter.dart';
import 'wordpair.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  void _logout() {
    Navigator.pop(context);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(padding: EdgeInsets.all(15)),
            const Text('Select App'),
            const Padding(padding: EdgeInsets.all(15)),
            Wrap(
              spacing: 10.0,
              runSpacing: 15.0,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 2.2,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.amber,
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(
                          builder: (context) => const Counter(),
                        )
                      );
                    },
                    child: const Text('Counter'),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2.2,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.amber,
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(
                          builder: (context) => const WordPairPage(),
                        )
                      );
                    },
                    child: const Text('WordPair'),
                  ),
                ),

              ],

            ),

            
          ],
        ),
      ),
      drawer: Drawer(
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
      ),
    );
  }
}