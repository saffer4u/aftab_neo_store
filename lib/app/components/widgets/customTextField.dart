import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/fonts.dart';

class CustomTextField extends StatelessWidget {
  final bool readOnly;
  final bool obscureText;
  final Widget? prefixIcon;
  final String? labelText;
  final int? maxLines;
  final TextCapitalization textCapitalization;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final void Function()? onTap;
  final AutovalidateMode? autoValid;
  final int? maxLength;
  CustomTextField({
    this.readOnly = false,
    this.obscureText = false,
    this.prefixIcon,
    this.maxLines = 1,
    this.suffixIcon,
    this.maxLength,
    this.autoValid,
    this.textCapitalization = TextCapitalization.sentences,
    this.keyboardType,
    this.validator,
    this.labelText,
    this.controller,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 6.0,
        bottom: 6.0,
      ),
      child: TextFormField(
        readOnly: readOnly,
        obscureText: obscureText,
        maxLines: maxLines,
        textCapitalization: textCapitalization,
        onTap: onTap,
        maxLength: maxLength,
        autovalidateMode: autoValid,
        keyboardType: keyboardType,
        validator: validator,
        controller: controller,
        cursorHeight: 17,
        cursorColor: WHITE_COLOR,
        style: TextStyle(
          fontFamily: Font.Gotham,
          color: WHITE_COLOR,
          fontSize: 14,
        ),
        decoration: InputDecoration(
          
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          filled: true,
          counterText: "",
          contentPadding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 20,
          ),
          border: const OutlineInputBorder(
            // borderRadius: BorderRadius.circular(7.0),
            borderSide: BorderSide(
              color: WHITE_COLOR,
              width: 2,
            ),
          ),
          isDense: true,
          labelText: labelText,
          labelStyle: const TextStyle(
            fontFamily: Font.Gotham,
            color: WHITE_COLOR,
            fontSize: 14,
          ),
          fillColor: Colors.transparent,
          focusedBorder: const OutlineInputBorder(
            // borderRadius: BorderRadius.circular(7.0),
            borderSide: BorderSide(
              color: WHITE_COLOR70,
              width: 1.5,
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            // borderRadius: BorderRadius.circular(7.0),
            borderSide: BorderSide(
              color: WHITE_COLOR70,
              width: 1.5,
            ),
          ),
          errorStyle: TextStyle(color: WHITE_COLOR, fontSize: 10),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromRGBO(255, 241, 241, 0.842),
              width: 2,
            ),
          ),
          // errorStyle: GoogleFonts.montserrat(
          //     fontSize: 10, color: Colors.white.withOpacity(0.75)),
        ),
      ),
    );
  }
}
