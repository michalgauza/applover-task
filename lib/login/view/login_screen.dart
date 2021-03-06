import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_app/login/view/view.dart';
import 'package:login_app/common/common.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 56),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 64),
              SvgPicture.asset(
                "assets/applover.svg",
              ),
              const SizedBox(height: 24),
              Text(
                "Login",
                style: Theme.of(context).textTheme.headline5,
              ),
              const SizedBox(height: 40),
              TextField(
                cursorColor: Colors.white,
                keyboardType: TextInputType.emailAddress,
                decoration: _getInputDecoration("Email address"),
              ),
              const SizedBox(height: 16),
              PasswordInputField(
                inputDecoration: _getInputDecoration("Password"),
              ),
              const SizedBox(height: 16),
              RoundedTextButton(
                text: "Login",
                onPressed: () {},
                width: double.infinity,
                height: 52,
              ),
            ],
          ),
        ),
      ),
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
