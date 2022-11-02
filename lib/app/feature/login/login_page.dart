import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:job_timer/app/feature/login/controllers/login_controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({required this.controller, Key? key}) : super(key: key);

  final LoginController controller;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
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
                selector: (state) {
                  return state.status == LoginStatus.loading;
                },
                builder: (context, showLoading) {
                  return ElevatedButton(
                    onPressed: () async {
                      await controller.signIn();
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
    );
  }

  SizedBox _buildLoading() {
    return const SizedBox(
      height: 15,
      child: CircularProgressIndicator(),
    );
  }
}
