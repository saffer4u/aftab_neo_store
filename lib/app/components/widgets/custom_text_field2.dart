import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/fonts.dart';

class CustomTextformField2 extends StatelessWidget {
  final bool obscureText;
  final String? labelText;
  final String? hintText;
  final int? maxLines;
  final TextCapitalization textCapitalization;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final void Function()? onTap;
  final AutovalidateMode? autoValid;
  final int? maxLength;
  final int? errorMaxLines;

  CustomTextformField2({
    this.errorMaxLines = 1,
    this.obscureText = false,
    this.maxLines = 1,
    this.suffixIcon,
    this.prefixIcon,
    this.maxLength,
    this.autoValid,
    this.textCapitalization = TextCapitalization.sentences,
    this.keyboardType,
    this.validator,
    this.labelText,
    this.hintText,
    this.controller,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          labelText == null
              ? SizedBox.shrink()
              : Text(
                  labelText!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: Font.GothamBold,
                    fontSize: 13,
                  ),
                ),
          Visibility(
            visible: labelText == null ? false : true,
            child: SizedBox(
              height: 15,
            ),
          ),
          TextFormField(
            obscureText: obscureText,
            maxLines: maxLines,
            textCapitalization: textCapitalization,
            onTap: onTap,
            maxLength: maxLength,
            autovalidateMode: autoValid,
            keyboardType: keyboardType,
            validator: validator,
            controller: controller,
            cursorRadius: const Radius.circular(10),
            cursorHeight: 17,
            cursorColor: BLACK_COLOR,
            style: TextStyle(
              fontFamily: Font.Gotham,
              fontSize: 14,
              color: BLACK_COLOR,
            ),
            decoration: InputDecoration(
              errorMaxLines: errorMaxLines,
              suffixIcon: suffixIcon,
              prefixIcon: prefixIcon,

              prefixIconColor: BLACK_COLOR,
              filled: true,
              counterText: "",
              contentPadding: const EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 20,
              ),
              border: OutlineInputBorder(
                // borderRadius: BorderRadius.circular(7.0),
                borderSide: BorderSide(
                  color: RED_COLOR700.withOpacity(0.8),
                  width: 1,
                ),
              ),
              // isDense: true,
              hintText: hintText,
              labelStyle: TextStyle(
                fontSize: 14,
                color: const Color(0xff28407D).withOpacity(0.6),
              ),
              fillColor: GREY_COLOR.withOpacity(0.1),
              focusedBorder: OutlineInputBorder(
                // borderRadius: BorderRadius.circular(7.0),
                borderSide: const BorderSide(
                  color: RED_COLOR700,
                  width: 2,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                // borderRadius: BorderRadius.circular(7.0),
                borderSide: BorderSide(
                  color: Colors.black87,
                  width: 1.0,
                ),
              ),
              errorBorder: OutlineInputBorder(
                // borderRadius: BorderRadius.circular(7.0),
                borderSide: const BorderSide(
                  color: Color.fromARGB(195, 255, 21, 21),
                  width: 2,
                ),
              ),
              errorStyle: TextStyle(
                  fontSize: 10, color: Colors.black.withOpacity(0.75)),
            ),
          ),
        ],
      ),
    );
  }
}
