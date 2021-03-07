import 'package:flutter/material.dart';
import 'package:login_app/login/login.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_app/common/common.dart';
import 'package:google_fonts/google_fonts.dart';

class InputFields extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Login",
          style: Theme.of(context).textTheme.headline5,
        ),
        const SizedBox(height: 40),
        TextField(
          controller: context.read<LoginCubit>().loginController,
          cursorColor: Colors.white,
          style: Theme.of(context).textTheme.bodyText1,
          keyboardType: TextInputType.emailAddress,
          decoration: _getInputDecoration("Email address"),
          textInputAction: TextInputAction.next,
        ),
        const SizedBox(height: 16),
        PasswordInputField(
          inputDecoration: _getInputDecoration("Password"),
        ),
        const SizedBox(height: 16),
        RoundedTextButton(
          text: "Login",
          onPressed: context.read<LoginCubit>().login,
          width: double.infinity,
          height: 52,
        ),
      ],
    );
  }

  InputDecoration _getInputDecoration(String hint) {
    assert(hint != null);
    return InputDecoration(
      hintStyle: GoogleFonts.roboto(color: Colors.white),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.white,
          width: 1.0,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.white,
          width: 1.0,
        ),
      ),
      hintText: hint,
    );
  }
}
