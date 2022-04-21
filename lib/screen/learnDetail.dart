import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ourhand_project/main.dart';

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
              child: Image.network(widget.learn.imageUrl),
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
                      fontWeight: FontWeight.w400,
                      wordSpacing: 3.0,
                      height: 1.5,
                      letterSpacing: 1.0,
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

class LearnInfo {
  String label;
  String imageUrl;

  List<Info> infos;

  LearnInfo(
      this.label,
      this.imageUrl,
      this.infos,
      );

  static List<LearnInfo> samples = [
    LearnInfo(
      'Hello',
      'https://firebasestorage.googleapis.com/v0/b/ourhand-4ace1.appspot.com/o/hello.png?alt=media&token=9fa5b368-ce47-4887-a4dd-11736a86d587',
      [
        Info('To greet someone with a hello, make the sign by extending your fingers and crossing your thumb in front of your palm. Now take the hand, starting with your hand in front of your ear, and extend it outward and away from your body.'
      'Finally, smile! Emotional signs like hello are learned as much from your body language as from the actual signs.',)
      ],
    ),
    LearnInfo(
      'Good bye',
      'https://firebasestorage.googleapis.com/v0/b/ourhand-4ace1.appspot.com/o/goodbye.jpg?alt=media&token=cf0c796e-e616-4e4e-97f5-f33b22d828d6',
      [
        Info('Goodbye is the same as the traditional gesture for the word. Open your palm, folding down your fingers, then open your palm again. An ASL alternative for goodbye or bye-bye is to wave your open hand sideways, like a leaf swaying in the wind.',)
      ],
    ),
    LearnInfo(
      'Please',
      'https://firebasestorage.googleapis.com/v0/b/ourhand-4ace1.appspot.com/o/please.jpg?alt=media&token=c0cf7582-769c-4199-84ca-201186a8f183',
      [
        Info('To sign please, take your dominant hand with fingers extended and held together, and thumb extended and sticking out. Take the hand with the palm facing in and rub it in a circle on your chest.',)
      ],
    ),
    LearnInfo(
      'Thank you',
      'https://firebasestorage.googleapis.com/v0/b/ourhand-4ace1.appspot.com/o/thankyou.jpg?alt=media&token=3c1e680d-8379-4c81-bc61-fcb8918764b3',
      [
        Info('To sign thank you, extend your fingers and thumb. Touch your fingers to your chin and bring your fingers forward. It is almost like you are blowing a kiss out, to thank the person - but the sign is a bit lower.',)
      ],
    ),
    LearnInfo(
      'Yes',
      'https://firebasestorage.googleapis.com/v0/b/ourhand-4ace1.appspot.com/o/yes.jpg?alt=media&token=1d020cd2-dab3-420d-b3c6-f375364060d5',
      [
        Info('The yes sign looks a head-nodding yes. You take your hand and make it into a fist, holding it at about shoulder height, then make your fist bob back and forth.',)
      ],
    ),
    LearnInfo(
      'No',
      'https://firebasestorage.googleapis.com/v0/b/ourhand-4ace1.appspot.com/o/no.jpg?alt=media&token=ff521779-32cc-42bc-9ea9-e17ef604def5',
      [
        Info('The sign for no is like that scolding teacher in high school that always says no to everything. The sign looks like a mouth saying no. Take your index finger together with your middle finger and tap them together with your thumb.',)
      ],
    ),
    LearnInfo(
      'You are welcome',
      'https://firebasestorage.googleapis.com/v0/b/ourhand-4ace1.appspot.com/o/yourewelcome.jpg?alt=media&token=ca91918d-1550-4045-a1a8-bcb3659dba5c',
      [
        Info('You’re welcome is signed the same way as Thank you. Take your flat, open, dominant hand, and starting from your chin, take your hand out as it arcs down and away from your face. It is as if you are acknowledging that your baby has thanked you, so you are mirroring the polite gesture back, like thanking them for thanking you!',)
      ],
    ),
    LearnInfo(
      'Sorry',
      'https://firebasestorage.googleapis.com/v0/b/ourhand-4ace1.appspot.com/o/sorry.jpg?alt=media&token=ca008fe1-63da-408d-885e-b3ef98fa974a',
      [
        Info('To sign sorry, make your hand into a fist and rub it in a circular motion across your chest. It is like you are rubbing around your heart because you are truly sorry.',)
      ],
    ),
    LearnInfo(
      'I love you',
      'https://firebasestorage.googleapis.com/v0/b/ourhand-4ace1.appspot.com/o/iloveyou.jpg?alt=media&token=2c7a62e7-b6a4-4d14-980b-6eb5bd5e36c7',
      [
        Info('To sign I love you, put up your thumb, index finger, and pinkie finger, while keeping your ring finger and your middle finger down. Hold the hand out, palm facing away from you ,and move it back and forth slightly.',)
      ],
    ),
  ];
}

class Info {
  String name;

  Info(
      this.name,);
}
