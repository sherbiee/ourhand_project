import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../main.dart';

import 'learnDetail.dart';


class Learn extends StatefulWidget {
  const Learn({Key? key}) : super(key: key);
  @override
  State<Learn> createState() => _LearnState();
}

class _LearnState extends State<Learn> {
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Learning Part"),
        backgroundColor: Palette.colour.shade50,
      ),
      backgroundColor: Palette.colour.shade50,
      body: SafeArea(
        child: ListView.builder(
          itemCount: LearnInfo.samples.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LearnDetail(learn: LearnInfo.samples[index]);
                    },
                  ),
                );
              },
              child: buildLearnCard(LearnInfo.samples[index]),
            );
          },
        ),
      ),
    );
  }

  Widget buildLearnCard(LearnInfo learn) {
    return Card(
      color: Palette.colour,
      elevation: 2.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 14.0,
            ),
            Text(
              learn.label,
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
