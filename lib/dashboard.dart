import 'package:flutter/material.dart';

import 'Fooderlich/fooderlich_page.dart';
import 'RecipeCalculator/recipe_page.dart';
import 'counter.dart';
import 'location.dart';
import 'wordpair.dart';
import 'jokes.dart';
import 'form.dart';
import 'components/drawer.dart';

class Dashboard extends StatefulWidget {
  static const String routeName = "/dashboard";
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

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
                          builder: (context) => const JokesPage(),
                        )
                      );
                    },
                    child: const Text('Jokes'),
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
                          builder: (context) => const FormPage(),
                        )
                      );
                    },
                    child: const Text('Form'),
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
                          builder: (context) => const LocationPage(),
                        )
                      );
                    },
                    child: const Text('Location'),
                  ),
                ),

                Container(
                  width: MediaQuery.of(context).size.width / 2.2,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.grey[300],
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(
                          builder: (context) => const RecipePage(),
                        )
                      );
                    },
                    child: const Text('Recipe Calculator'),
                  ),
                ),

                Container(
                  width: MediaQuery.of(context).size.width / 2.2,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.grey[300],
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(
                          builder: (context) => const FooderlichPage(),
                        )
                      );
                    },
                    child: const Text('Fooderlich'),
                  ),
                ),

              ],
            ),

            
          ],
        ),
      ),
      drawer:  const MyUserDrawer(),
    );
  }
}