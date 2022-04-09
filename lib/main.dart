

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import '/screen/loginscreen.dart';
import 'screen/formscreen.dart';
//import 'model/student.dart';
//import 'firebase_options.dart';

void main() async {
  //initilization of Firebase app
  // other Firebase service initialization
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),

    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();

  //@override
  //State<RealUsingScreen> createState() => _RealUsingScreenState(); // 
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          body: TabBarView(
            children: [
              FormScreen(), //หน้าแรกกกกกกกกกกก Register
              LoginScreen() //ตอนนี้คิดว่า หน้านี้เป็น Login แล้วก็ทำไฟล์ข้างในให้คล้ายๆ Register นั่นแหละ แค่มันต้องมีการ ดึงข้อมูลจาก DB ออกมา Authen
            ],
          ),
          backgroundColor: Colors.green,
          bottomNavigationBar: TabBar(
            tabs: [
              Tab(
                text: "Register",
              ),
              Tab(
                text: "Login",
              )
            ],
          )),
    );
  }
}
