import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import '/screen/loginscreen.dart';
import 'screen/register.dart';
//import 'model/student.dart';
//import 'firebase_options.dart';

void main() async {
  //initilization of Firebase app
  // other Firebase service initialization
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

//palette.dart
class Palette {
  static const MaterialColor pink = const MaterialColor(
    0xFFF8BBD0, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    const <int, Color>{
      50: Color(0xFFFCE4EC),
      100: Color(0xFFF8BBD0),
      200: Color(0xFFF48FB1),
      300: Color(0xFFF06292),
      400: Color(0xFFEFCDD2),
      500: Color(0xFFCE93D8),
      600: Color(0xFFD81B60),
      700: Color(0xFFC2185B),
      800: Color(0xFFAD1457),
      900: Color(0xFF880E4F),
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Palette.pink,
      ),
      home: const MainPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          new Image.asset(
            'image/icon2.png',
            width: 300.0,
            height: 300.0,
            fit: BoxFit.cover,
          ),
          ElevatedButton(
              child: Text("Register", style: TextStyle(fontSize: 20)),
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return RegisterScreen();
                }));
              }),
          ElevatedButton(
              child: Text("Login", style: TextStyle(fontSize: 20)),
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return LoginScreen();
                }));
              })
        ],
      )),
    );
  }
}
