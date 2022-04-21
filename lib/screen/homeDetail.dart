import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ourhand_project/main.dart';

class HomeDetail extends StatefulWidget {
  final HomeInfo home;

  const HomeDetail({
    Key? key,
    required this.home,
  }) : super(key: key);

  @override
  _HomeDetailState createState() {
    return _HomeDetailState();
  }
}

class _HomeDetailState extends State<HomeDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.home.label),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(widget.home.imageUrl),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              widget.home.label,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeInfo {
  String label;
  String imageUrl;

  HomeInfo(
      this.label,
      this.imageUrl,
      );

  static List<HomeInfo> samples = [
    HomeInfo(
      'Learning',
      'https://firebasestorage.googleapis.com/v0/b/ourhand-4ace1.appspot.com/o/learn.jpg?alt=media&token=ded5ba58-0400-4ea7-900d-615ac1270f74',
    ),
    HomeInfo(
      'Quiz',
      'https://firebasestorage.googleapis.com/v0/b/ourhand-4ace1.appspot.com/o/quiz.jpg?alt=media&token=55242e7c-a75c-4c33-94f3-3343c3112256',
    ),
  ];
}

class Info {
  String name;

  Info(
      this.name,);
}
