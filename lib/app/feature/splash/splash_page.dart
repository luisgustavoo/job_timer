import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:job_timer/app/feature/home/home_router.dart';
import 'package:job_timer/app/feature/login/login_router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({required FirebaseAuth firebaseAuth, Key? key})
      : _firebaseAuth = firebaseAuth,
        super(key: key);
  final FirebaseAuth _firebaseAuth;

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    widget._firebaseAuth.authStateChanges().listen(
      (user) {
        if (user == null) {
          Navigator.of(context)
              .pushNamedAndRemoveUntil(LoginRouter.router, (route) => false);
        } else {
          Navigator.of(context)
              .pushNamedAndRemoveUntil(HomeRouter.router, (route) => false);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[
              Color(0XFF0092B9),
              Color(0XFF0167B2),
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Center(
          child: Image.asset('assets/images/logo.png'),
        ),
      ),
    );
  }
}
