import 'package:flutter/material.dart';
import 'homeInfo.dart';

class HomeDetail extends StatefulWidget {
  final HomeInfo recipe;

  const HomeDetail({
    Key? key,
    required this.recipe,
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
        title: Text(widget.recipe.label),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image(
                image: AssetImage(widget.recipe.imageUrl),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              widget.recipe.label,
              style: const TextStyle(fontSize: 18),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(7.0),
                itemCount: widget.recipe.infos.length,
                itemBuilder: (BuildContext context, int index) {
                  final info = widget.recipe.infos[index];
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