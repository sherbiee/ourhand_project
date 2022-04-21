import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import '/screen/loginscreen.dart';
import 'screen/register.dart';

void main() async {
  //initilization of Firebase app
  // other Firebase service initialization
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

//palette.dart
class Palette {
  static const MaterialColor colour = const MaterialColor(
    0xFFF8BBD0,
    const <int, Color>{
      50: Color(0xFFFFFDE7),
      100: Color(0xFFF8BBD0),
      200: Color(0xFFF48FB1),
      300: Color(0xFFB2EBF2),
      400: Color(0xFFEFCDD2),
      500: Color(0xFFB39DDB),
      600: Color(0xFFD32F2F),
      700: Color(0xFFC62828),
      800: Color(0xFFB71C1C),
      900: Color(0xFFFFFFFF),
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Palette.colour,
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
      backgroundColor: Palette.colour.shade50,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'image/icon2.png',
            width: 300.0,
            height: 300.0,
            fit: BoxFit.cover,
          ),
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    child: Text("Register", style: TextStyle(fontSize: 20)),
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return RegisterScreen();
                      }));
                    }),
                    
                Padding(padding: EdgeInsets.all(10.0)),

                ElevatedButton(
                    child: Text("Login", style: TextStyle(fontSize: 20)),
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return LoginScreen();
                      }));
                    })
              ],
            ),
          ),
        ],
      )),
    );
  }
}
