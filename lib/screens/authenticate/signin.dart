import 'package:firebase_core/firebase_core.dart';
import 'package:firebaseproject/constants/const.dart';
import 'package:firebaseproject/constants/loading.dart';
import 'package:firebaseproject/screens/authenticate/authenticate.dart';
import 'package:firebaseproject/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  SignIn({super.key, required this.tv});
  final Function tv;
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  AuthSerrvices authSerrvices = AuthSerrvices();
  final formkey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  String error = "";
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.brown[100],
            appBar: AppBar(
              title: Text("Sign in"),
              backgroundColor: Colors.brown[400],
              elevation: 0,
              actions: [
                TextButton(
                    onPressed: (() {
                      widget.tv();
                    }),
                    child: Text("register"))
              ],
            ),
            body: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Form(
                  key: formkey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: textformfielddeco.copyWith(
                            hintText: "example@gmail.com"),
                        validator: (value) {
                          return value!.isEmpty ? "Enter Email" : null;
                        },
                        onChanged: (value) {
                          setState(() {
                            email = value;
                          });
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration:
                            textformfielddeco.copyWith(hintText: "email"),
                        obscureText: true,
                        validator: (value) {
                          return value!.length < 6
                              ? "Enter charector upto 6"
                              : null;
                        },
                        onChanged: (value) {
                          setState(() {
                            password = value;
                          });
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.brown[600]),
                        onPressed: () async {
                          if (formkey.currentState!.validate()) {
                            setState(() {
                              loading = true;
                            });

                            dynamic result =
                                await authSerrvices.SignInwithEmailPassword(
                                    email: email, password: password);
                            if (result == null) {
                              setState(() {
                                loading = false;
                              });

                              setState(() {
                                error =
                                    "could not sign in with those credentials";
                              });
                            }

                            print(email);
                            print(password);
                          }
                        },
                        child: Text("Sign in"),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        error,
                        style: TextStyle(color: Colors.red),
                      )
                    ],
                  )),
            ),
          );
  }
}
