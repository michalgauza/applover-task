import 'package:flutter/material.dart';

class RoundedTextButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final double width;
  final double height;

  const RoundedTextButton(
      {@required this.text, @required this.onPressed, this.width, this.height})
      : assert(text != null),
        assert(onPressed != null);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: MaterialButton(
        color: Theme.of(context).buttonColor,
        onPressed: onPressed,
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}