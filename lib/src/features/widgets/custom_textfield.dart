import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final bool? obscureText;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final String? errorText;
  final Function(String?)? onChanged;
  final bool? prefixIconPadding, enabled;
  final int? maxLines;
  final double? hintTextFontSize;
  const CustomTextField(
      {super.key,
      required this.hint,
      this.prefixIcon,
      this.suffixIcon,
      this.controller,
      this.textInputType,
      this.textInputAction, this.obscureText,
      this.validator,
      this.errorText,
      this.onChanged,
      this.inputFormatters,
      this.prefixIconPadding,
      this.maxLines,
        this.enabled,
        this.hintTextFontSize,
      });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled ?? true,
      keyboardType: textInputType ?? TextInputType.text,
      textInputAction: textInputAction,
      controller: controller,
      validator: validator,
      onChanged: onChanged,
      inputFormatters: inputFormatters,
      style: const TextStyle(fontWeight: FontWeight.normal, color: Colors.black, fontSize: 18),
      // cursorHeight: 20,
      // maxLines: maxLines.toString().isEmpty? 1 : maxLines,
      decoration: InputDecoration(
        // isDense: false,
        hintText: hint,
        hintStyle:  TextStyle(
          // fontSize: 1.0,
          fontWeight: FontWeight.w300,
          fontSize: hintTextFontSize ?? 18,
        ),
        errorText: errorText,
        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
        border: InputBorder.none,
        prefixIcon: prefixIconPadding == false ? Text('') : prefixIcon,
        suffixIcon: suffixIcon,
        fillColor: Colors.white.withOpacity(0.7),
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(
            color: Colors.white,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(
            color: Colors.white,
            width: 1.0,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(
            color: Colors.black.withOpacity(0.2),
            width: 1.0,
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(
            width: 1,
            color: Colors.red,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: Colors.black.withOpacity(0.2)), // Change the color here
        ),
      ),
      obscureText: obscureText ?? false,
    );
  }
}
