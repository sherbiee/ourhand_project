import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../main.dart';

import 'quiz.dart';
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
    return Scaffold(
      backgroundColor: Palette.colour.shade50,
      body: SafeArea(
        child: ListView.builder(
          itemCount: HomeInfo.samples.length,
          itemBuilder: (BuildContext context, int index) {
            if (index==0){
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
              child: buildHomeCard(HomeInfo.samples[index]),
            );
            }
            else{
              return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Quiz();
                    },
                  ),
                );
              },
              child: buildHomeCard(HomeInfo.samples[index]),
            );
            }
          },
        ),
      ),
    );
  }

  Widget buildHomeCard(HomeInfo home) {
    return Card(
      color: Palette.colour,
      elevation: 2.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Image.network(home.imageUrl),
            const SizedBox(
              height: 6.0,
            ),
            Text(
              home.label,
              style: const TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        ),
      ),
    );
  }
}