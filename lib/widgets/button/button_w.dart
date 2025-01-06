import 'package:assignment2/utils/color_const.dart';
import 'package:flutter/material.dart';

class ButtonW extends StatelessWidget {
  const ButtonW({
    super.key,
    required this.buttonTitle,
    required this.onPressed,
    this.buttonbgColor = ColorsConstants.secondaryColor,
    this.buttonwidth = double.infinity,
    this.buttontextcolour = Colors.white,
  });

  final String buttonTitle;
  final void Function() onPressed;
  final Color buttonbgColor;
  final double buttonwidth;
  final Color buttontextcolour;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: buttonwidth,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonbgColor,
        ),
        child: Text(
          buttonTitle,
          style: TextStyle(
            fontSize: 16,
            color: buttontextcolour,
          ),
        ),
      ),
    );
  }
}
