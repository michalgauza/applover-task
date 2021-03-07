import 'package:flutter/material.dart';

class CustomProgressIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Theme.of(context).buttonColor,width: 1),
          ),
          height: 16,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: LinearProgressIndicator(
            minHeight: 16,
            backgroundColor: Colors.transparent,
            valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).buttonColor),
          ),
        ),
      ],
    );
  }
}
