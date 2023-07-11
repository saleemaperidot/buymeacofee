import 'package:firebase_core/firebase_core.dart';
import 'package:firebaseproject/model/user.dart';
import 'package:firebaseproject/screens/wrapper.dart';
import 'package:firebaseproject/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserModel?>.value(
        value: AuthSerrvices().user,
        initialData: null,
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(),
          // This is the theme of your application.
          //

          home: Wrapper(),
        ));
  }
}
