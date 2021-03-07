import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_app/login/login.dart';

class LoginScreen extends StatelessWidget {
  static route() => MaterialPageRoute(builder: (_) => LoginScreen());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: BlocProvider<LoginCubit>(
          create: (BuildContext context) => LoginCubit(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 56),
            child: LoginForm(),
          ),
        ),
      ),
    );
  }
}
