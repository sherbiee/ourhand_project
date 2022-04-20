import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ourhand_project/main.dart';
import 'learnInfo.dart';

class LearnDetail extends StatefulWidget {
  final LearnInfo learn;

  const LearnDetail({
    Key? key,
    required this.learn,
  }) : super(key: key);

  @override
  _LearnDetailState createState() {
    return _LearnDetailState();
  }
}

class _LearnDetailState extends State<LearnDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.colour.shade50,
      appBar: AppBar(
        title: Text(
          widget.learn.label,
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 300,
              width: double.infinity,
              child: //Image.network('https://firebasestorage.googleapis.com/v0/b/ourhand-4ace1.appspot.com/o/hello.jpg?alt=media&token=858772bf-71a9-48f2-9d5d-bd2ff51f2d50'),
                 Image(
                image: AssetImage(widget.learn.imageUrl),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              widget.learn.label,
              style: const TextStyle(
                fontSize: 25,
                height: 0.5,
                fontWeight: FontWeight.w500,
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(9.0),
                itemCount: widget.learn.infos.length,
                itemBuilder: (BuildContext context, int index) {
                  final info = widget.learn.infos[index];
                  return Text(
                    (' ${info.name}'),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
