import 'package:asuka/asuka.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:job_timer/app/feature/home/home_router.dart';
import 'package:job_timer/app/feature/login/controllers/login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    required this.controller,
    required FirebaseAuth firebaseAuth,
    Key? key,
  })  : _firebaseAuth = firebaseAuth,
        super(key: key);

  final LoginController controller;
  final FirebaseAuth _firebaseAuth;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();

    widget._firebaseAuth.authStateChanges().listen(
      (user) {
        if (user != null) {
          Navigator.of(context)
              .pushNamedAndRemoveUntil(HomeRouter.router, (route) => false);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return BlocListener<LoginController, LoginState>(
      bloc: widget.controller,
      // listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        final errorMessage = state.errorMessage ?? 'Erro ao realizar login';

        if (state.status == LoginStatus.failure) {
          AsukaSnackbar.alert(errorMessage).show();
        }
      },
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/images/logo.svg'),
                SizedBox(
                  height: screenSize.height * 0.1,
                ),
                BlocSelector<LoginController, LoginState, bool>(
                  bloc: widget.controller,
                  selector: (state) => state.status == LoginStatus.loading,
                  builder: (context, showLoading) {
                    return ElevatedButton(
                      onPressed: () async {
                        await widget.controller.signIn();
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.grey[200]!),
                        fixedSize: MaterialStateProperty.all<Size>(
                          Size(
                            screenSize.width,
                            50,
                          ),
                        ),
                      ),
                      child: showLoading
                          ? _buildLoading()
                          : SvgPicture.asset('assets/images/google.svg'),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox _buildLoading() {
    return const SizedBox(
      height: 12,
      width: 12,
      child: CircularProgressIndicator(strokeWidth: 2),
    );
  }
}
