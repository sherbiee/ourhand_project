import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:ourhand_project/model/student.dart';


class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final formKey = GlobalKey<
      FormState>(); // for checking the status of the form e.g. reset form/ save form
  Student myUser = Student();
  final Future<FirebaseApp> firebase =
      Firebase.initializeApp(); // prepare firebase, it's an Obj. firebase

  CollectionReference _userCollection =
      FirebaseFirestore.instance.collection("users"); // create user collection

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
              appBar: AppBar(
                title: Text("Register to OurHand application"),
              ),
              body: Container(
                padding: EdgeInsets.all(20),
                child: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Username",
                          style: TextStyle(fontSize: 20),
                        ),
                        TextFormField(
                          validator: RequiredValidator(
                              errorText: "Please enter information!!!!"),
                          onSaved: (String? username) {
                            myUser.username = username;
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
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
                        SizedBox(
                          child: ElevatedButton(
                            child: Text(
                              "Register now",
                              style: TextStyle(fontSize: 20),
                            ),
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                // use validation before saving
                                formKey.currentState
                                    ?.save(); // use all onSaved function which are located in textformfield
                                print(
                                    "Name = ${myUser.username}"); // print to check the data
                                print("E-mail = ${myUser.email}");
                                print("Password = ${myUser.password}");
                                // below this line is to add data into firestore
                                await _userCollection.add({
                                  "username": myUser.username,
                                  "email": myUser.email,
                                  "password": myUser.password
                                });
                                // below this line is to create an account
                                try {
                                  await FirebaseAuth.instance
                                      .createUserWithEmailAndPassword(
                                          email: myUser.email!,
                                          password: myUser.password!
                                  ).then((value)           // if user successfully create account do this
                                    {
                                      formKey.currentState?.reset();  // regist successful so clear form
                                      Fluttertoast.showToast(         // show error box to user
                                        msg: "Successful !",
                                        gravity: ToastGravity.CENTER
                                      );                                          
                                    }
                                  ); 
                                } on FirebaseAuthException catch (e) {
                                  print(e.code);                    // show error info. topic to dev.
                                  print(e.message);                 // show how to do with error todev.
                                  Fluttertoast.showToast(            // show error box to user
                                    msg: e.message!,
                                    gravity: ToastGravity.CENTER
                                  );
                                }
                              }
                            },
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