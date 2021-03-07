import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login_app/login/login.dart';
import 'package:login_app/common/common.dart';
import 'package:login_app/success/success_screen.dart';

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (_, current) {
        if (current is LoginStateSuccess) {
          Navigator.of(context)
              .pushAndRemoveUntil(SuccessScreen.route(), (route) => false);
        }
        if (current is LoginStateError) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text(current.message)),
            );
        }
      },
      builder: (BuildContext context, LoginState state) {
        return SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 64),
              Hero(
                tag: "appLoverLogo",
                child: SvgPicture.asset(
                  "assets/applover.svg",
                  width: _getLogoSize(state),
                  height: _getLogoSize(state),
                ),
              ),
              SizedBox(height: state is LoginStateLoading ? 56 : 24),
              state is LoginStateLoading || state is LoginStateSuccess
                  ? CustomProgressIndicator()
                  : InputFields(),
            ],
          ),
        );
      },
    );
  }

  double _getLogoSize(LoginState state) {
    return state is LoginStateLoading || state is LoginStateSuccess ? 150 : 100;
  }
}