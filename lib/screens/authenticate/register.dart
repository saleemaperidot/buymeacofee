import 'package:firebaseproject/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Register extends StatefulWidget {
  Register({super.key, required this.tv});

  final Function tv;

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  AuthSerrvices authSerrvices = AuthSerrvices();
  final formkey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  String error = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        title: Text("Register to drink cofee"),
        backgroundColor: Colors.brown[400],
        elevation: 0,
        actions: [
          TextButton(
              onPressed: () {
                widget.tv();
              },
              child: Text("sign In"))
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
                  decoration: InputDecoration(
                    hintText: "Enter Email",
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 227, 139, 139),
                        width: 2.0,
                      ),
                    ),
                  ),
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
                  decoration: InputDecoration(
                    hintText: "Enter Email",
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 227, 139, 139),
                        width: 2.0,
                      ),
                    ),
                  ),
                  validator: (value) {
                    return value!.length < 6 ? "Enter charector upto 6" : null;
                  },
                  obscureText: true,
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
                      dynamic result =
                          await authSerrvices.RegisterwithEmailPassword(
                              email: email, password: password);
                      if (result == null) {
                        setState(() {
                          error = "plase supply va;id email";
                        });
                      } else {
                        // AuthSerrvices auth = AuthSerrvices();
                        // auth.signout()
                      }

                      print(email);
                      print(password);
                    }
                  },
                  child: Text("register"),
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
