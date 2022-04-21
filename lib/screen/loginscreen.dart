import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:ourhand_project/model/student.dart';
import 'package:ourhand_project/screen/homepage.dart';
import '../main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<
      FormState>(); // for checking the status of the form e.g. reset form/ save form
  Student myUser = Student();
  final Future<FirebaseApp> firebase =
      Firebase.initializeApp(); // prepare firebase, it's an Obj. firebase

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        // check whether the project can successfully connect to firebase or not
        future: firebase,
        builder: (context, snapshot) {
          // snapshot = result from calling firebase
          if (snapshot.hasError) {
            // can't connect to firebase
            return Scaffold(
              appBar: AppBar(
                title: Text("Error"),
              ),
              body: Center(
                child: Text("${snapshot.error}"), // show error info.
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            // can connect to firebase
            return Scaffold(
              backgroundColor: Palette.colour.shade50,
              appBar: AppBar(
                  title: Text(
                "Login",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                ),
              )),
              body: Container(
                padding: EdgeInsets.all(20),
                child: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "E-mail",
                          style: TextStyle(fontSize: 20),
                        ),
                        TextFormField(
                          validator: MultiValidator([
                            // for using many validators
                            EmailValidator(
                                errorText:
                                    "Please enter the correct email form!!!"),
                            RequiredValidator(
                                errorText: "Please enter the email")
                          ]),
                          onSaved: (String? email) {
                            myUser.email = email;
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Password",
                          style: TextStyle(fontSize: 20),
                        ),
                        TextFormField(
                          obscureText: true,
                          validator: RequiredValidator(
                              errorText: "Please enter information!!!!"),
                          onSaved: (String? password) {
                            myUser.password = password;
                          },
                        ),

                        //button
                        SizedBox(
                          child: Row(
                            children: [
                              ElevatedButton(
                                  child: Icon(Icons.arrow_circle_left_rounded),
                                  onPressed: () {
                                    Navigator.pushReplacement(context,
                                        MaterialPageRoute(builder: (context) {
                                      return MyApp();
                                    }));
                                  }),
                                  
                              Padding(padding: EdgeInsets.only(left: 200, top:60)),
                              
                              ElevatedButton(
                                child: Text(
                                  "login",
                                  style: TextStyle(fontSize: 18),
                                ),
                                onPressed: () async {
                                  if (formKey.currentState!
                                      .validate()) // use all validation before saving
                                  {
                                    formKey.currentState
                                        ?.save(); // use all onSaved function which are located in textformfield
                                    print(
                                        "Name = ${myUser.username}"); // print to check the data
                                    print("E-mail = ${myUser.email}");
                                    print("Password = ${myUser.password}");

                                    // below this line is to create an account
                                    try {
                                      await FirebaseAuth.instance
                                          .signInWithEmailAndPassword(
                                              email: myUser.email!,
                                              password: myUser.password!)
                                          .then((value) {
                                        // if user login successful then do this
                                        formKey.currentState
                                            ?.reset(); // login successful so clear form
                                        Navigator.pushReplacement(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return Homepage();
                                        }));
                                      });
                                    } on FirebaseAuthException catch (e) {
                                      print(e
                                          .code); // show error info. topic to dev.
                                      print(e
                                          .message); // show how to do with error todev.
                                      Fluttertoast.showToast(
                                          // show error box to user
                                          msg: e.message!,
                                          gravity: ToastGravity.CENTER);
                                    }
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
          return Scaffold(
            // no error occur
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}
