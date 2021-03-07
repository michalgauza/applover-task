import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login_app/login/login.dart' show LoginScreen;

class SuccessScreen extends StatelessWidget {
  static route() => MaterialPageRoute(builder: (_) => SuccessScreen());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onWillPop(context),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 64),
                Hero(
                  tag: "appLoverLogo",
                  child: SvgPicture.asset(
                    "assets/applover.svg",
                    width: 150,
                    height: 150,
                  ),
                ),
                SizedBox(height: 24),
                Text(
                  "Success!",
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _onWillPop(BuildContext context) async {
    Navigator.of(context).pushAndRemoveUntil(LoginScreen.route(), (route) => false);
    return true;
  }
}
