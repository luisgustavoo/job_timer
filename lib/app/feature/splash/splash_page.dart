import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:job_timer/app/feature/home/home_router.dart';
import 'package:job_timer/app/feature/login/login_router.dart';
import 'package:job_timer/app/feature/splash/controllers/splash_controller.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({required this.controller, super.key});
  final SplashController controller;

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (widget.controller.state.isLogged) {
        context.goNamed(HomeRouter.router);
      } else {
        context.goNamed(LoginRouter.router);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
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
          child: SvgPicture.asset('assets/images/logo.svg'),
        ),
      ),
    );
  }
}
