import 'package:flutter/material.dart';
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
      appBar: AppBar(
        title: Text(widget.learn.label),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image(
                image: AssetImage(widget.learn.imageUrl),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              widget.learn.label,
              style: const TextStyle(fontSize: 18),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(7.0),
                itemCount: widget.learn.infos.length,
                itemBuilder: (BuildContext context, int index) {
                  final info = widget.learn.infos[index];
                  return Text(
                      ' ${info.name}');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}