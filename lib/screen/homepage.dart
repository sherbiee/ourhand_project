import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ourhand_project/screen/loginscreen.dart';
import '../main.dart';

import 'homeInfo.dart';
import 'homeDetail.dart';
import 'learn.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    /*
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            new Image.asset(
              'image/1.jpeg',
              width: 200.0,
              height: 200.0,
              fit: BoxFit.cover,
            ),
            Text("Learning"),
            new Image.asset(
              'image/2.jpeg',
              width: 200.0,
              height: 200.0,
              fit: BoxFit.cover,
            ),
            Text("Quiz"),
            Text(auth.currentUser!.email!),
            ElevatedButton(
                child: Text("Sign out"),
                onPressed: () {
                  auth.signOut().then((value) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return MyApp();
                    }));
                  });
                })
          ],
        ),
      ),
    );
    */

    return Scaffold(
      backgroundColor: Palette.colour.shade50,
      body: SafeArea(
        child: ListView.builder(
          itemCount: HomeInfo.samples.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Learn();
                    },
                  ),
                );
              },
              child: buildRecipeCard(HomeInfo.samples[index]),
            );
            return buildRecipeCard(HomeInfo.samples[index]);
          },
        ),
      ),
    );
  }

  Widget buildRecipeCard(HomeInfo recipe) {
    return Card(
      color: Palette.colour,
      elevation: 2.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Image(image: AssetImage(recipe.imageUrl)),
            const SizedBox(
              height: 14.0,
            ),
            Text(
              recipe.label,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        ),
      ),
    );
  }
}
