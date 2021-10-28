
import 'package:flutter/material.dart';

import 'recipe.dart';
import 'recipe_card.dart';
import 'recipe_detail.dart';

class RecipePage extends StatefulWidget {

  const RecipePage({
    Key? key,
  }) : super(key: key);

  @override
  State<RecipePage> createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[600],
        title: const Text('Recipe Calculator'),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: Recipe.samples.length,
          itemBuilder: (BuildContext context, int index) {
            var currentRecipe = Recipe.samples[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) { 
                  return RecipeDetail(recipe: currentRecipe);
                }));
              },
              child: buildRecipeCard(currentRecipe)
              );
          }

      ),)
    );
  }
}
