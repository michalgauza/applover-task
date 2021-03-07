import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/login_cubit.dart';

class PasswordInputField extends StatefulWidget {
  final String hidePasswordPath = "assets/b-preview.svg";
  final String showPasswordPath = "assets/preview.svg";

  final InputDecoration inputDecoration;

  const PasswordInputField({@required this.inputDecoration})
      : assert(inputDecoration != null);

  @override
  _PasswordInputFieldState createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: context.read<LoginCubit>().passwordController,
      cursorColor: Colors.white,
      style: Theme.of(context).textTheme.bodyText1,
      obscureText: isObscure,
      decoration: widget.inputDecoration.copyWith(
        suffixIcon: _buildEyeIcon(),
      ),
      textInputAction: TextInputAction.done,
      onSubmitted: (_) => context.read<LoginCubit>().login(),
    );
  }

  Widget _buildEyeIcon() {
    return SizedBox(
      height: 24,
      width: 24,
      child: InkWell(
        onTap: _showOrHideText,
        child: Center(
          child: SvgPicture.asset(
            isObscure ? widget.hidePasswordPath : widget.showPasswordPath,
          ),
        ),
      ),
    );
  }

  _showOrHideText() {
    setState(() {
      isObscure = !isObscure;
    });
  }
}
