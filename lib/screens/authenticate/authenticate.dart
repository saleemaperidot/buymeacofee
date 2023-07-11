import 'package:firebaseproject/screens/authenticate/register.dart';
import 'package:firebaseproject/screens/authenticate/signin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool signinIndicator = true;
  void toggleView() {
    setState(() {
      signinIndicator = !signinIndicator;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (signinIndicator) {
      return SignIn(tv: toggleView);
    } else {
      return Register(tv: toggleView);
    }
  }
}
