import 'package:assignment2/utils/color_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputTextW extends StatelessWidget {
  const InputTextW({super.key,
    required this.hintText,
    required this.textEditingController,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.redonly = false,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.inputFormatters,
    this.maxLines = 1,
  });

  final String hintText;
  final TextEditingController textEditingController;
  final TextInputType keyboardType;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final bool? redonly;
  final List<TextInputFormatter>? inputFormatters;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        maxLines: maxLines,
        controller: textEditingController,
        keyboardType: keyboardType,
        obscureText: obscureText,
        readOnly: redonly ?? false,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
          filled: true,
          fillColor: ColorsConstants.inputTextfillColor,
          hintText: hintText,
          prefixIcon: prefixIcon ?? Image.asset('assets/Search.png'),
          suffixIcon: suffixIcon ?? Image.asset('assets/Mic.png'),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Colors.purpleAccent,
              width: 2,
            ),
          ),
        ),
        validator: validator,
      ),
    );
  }
}
