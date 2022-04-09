import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ourhand_project/screen/loginscreen.dart';

import '../main.dart';



class RealUsingScreen extends StatefulWidget {

  const RealUsingScreen({Key? key}) : super(key: key);

  @override
  State<RealUsingScreen> createState() => _RealUsingScreenState();
}

class _RealUsingScreenState extends State<RealUsingScreen> {

  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [Text(auth.currentUser!.email!),
          ElevatedButton(
            child: Text("Sign out"),
            onPressed: (){
                auth.signOut().then((value){
                  Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context){
                    return MyApp();
                  }));
                });
            }

            )
          ],
        ),
      ),
    );
  }
}
