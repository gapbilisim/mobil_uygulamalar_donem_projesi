import 'package:flutter/material.dart';
import 'package:recipes/recipe.dart';
import 'package:recipes/recipe_detail.dart';

void main() {
  runApp(const RecipeApp());
}

class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recipe Calculator',
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 68, 53, 53),
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 2, 2, 22)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5.0,
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: Recipe.samples.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => RecipeDetail(recipe: Recipe.samples[index],)));
              },
              child: buildRecipeCard(Recipe.samples[index]),
            );
          },
        ),
      ),
    );
  }

  Widget buildRecipeCard(Recipe recipe) {
// 1
    return Card(
      margin: EdgeInsets.all(10),
      elevation: 2.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
// 2
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          // 3
          children: <Widget>[
            // 4
            Image(image: AssetImage(recipe.imageURL)),
            // 5
            const SizedBox(
              height: 14.0,
            ),
            // 5
            Text(
              recipe.label,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}
