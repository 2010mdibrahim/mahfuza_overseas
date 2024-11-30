import 'package:flutter/material.dart';

import '../../core/utilities/theme_config.dart';


class CustomMultilineText extends StatelessWidget {
  final String text;
  final FontWeight? fontWeight;
  final Color? color;
  final double? fontSize;
  final FontStyle? fontStyle;
  final TextAlign? alignment;
  final int? maxLine;
  const CustomMultilineText(
      {super.key,
      required this.text,
      this.fontWeight,
      this.color,
      this.fontSize,
      this.fontStyle,
      this.alignment,
      this.maxLine});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: alignment ?? TextAlign.justify,
      maxLines: maxLine,
      overflow: TextOverflow.ellipsis,
      textDirection: TextDirection.ltr,
      style: TextStyle(
          color: color ?? Theme.of(context).textTheme.bodyLarge?.color,
          fontWeight:
              fontWeight ?? Theme.of(context).textTheme.bodyLarge?.fontWeight,
          fontSize: fontSize ?? Theme.of(context).textTheme.bodyLarge?.fontSize,
          fontStyle:
              fontStyle ?? Theme.of(context).textTheme.bodyLarge?.fontStyle),
    );
  }
}

class CustomSimpleText extends StatelessWidget {
  final String text;
  final FontWeight? fontWeight;
  final Color? color;
  final double? fontSize;
  final FontStyle? fontStyle;
  final TextAlign? alignment;
  final TextDecoration? textDecoration;
  final TextOverflow? textOverFlow;

  const CustomSimpleText({
    super.key,
    required this.text,
    this.fontWeight,
    this.color,
    this.fontSize,
    this.fontStyle,
    this.alignment,
    this.textDecoration,
    this.textOverFlow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 2,
      textAlign: alignment ?? TextAlign.center,
      overflow: textOverFlow ?? TextOverflow.ellipsis,
      style: TextStyle(
        color: color ?? Theme.of(context).textTheme.bodyLarge?.color,
        fontWeight:
            fontWeight ?? Theme.of(context).textTheme.bodyLarge?.fontWeight,
        fontSize: fontSize ?? 20,
        fontStyle:
            fontStyle ?? Theme.of(context).textTheme.bodyLarge?.fontStyle,

        decoration: textDecoration,
      ),
    );
  }
}

class FieldTitleText extends StatelessWidget {
  final String text;
  final FontWeight? fontWeight;
  final Color? color;
  final double? fontSize;
  final FontStyle? fontStyle;
  final TextAlign? alignment;
  const FieldTitleText(
      {super.key,
      required this.text,
      this.fontWeight,
      this.color,
      this.fontSize,
      this.fontStyle,
      this.alignment});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: alignment ?? TextAlign.start,
      style: TextStyle(
          color: color.toString().isEmpty
              ? ThemeConfig.white
              : color,
          fontWeight:
              fontWeight ?? Theme.of(context).textTheme.bodyLarge?.fontWeight,
          fontSize: fontSize ?? 18,
          fontStyle:
              fontStyle ?? Theme.of(context).textTheme.bodyLarge?.fontStyle),
    );
  }
}


class CustomRichText extends StatelessWidget {
  final String? title, text;
  final MaterialColor? titleColor;
  final Color? textColor;
  const CustomRichText({super.key, this.title, this.text,  this.titleColor,  this.textColor});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: title,
        style: DefaultTextStyle.of(context).style.copyWith(fontWeight: FontWeight.bold, fontSize: 13, color: titleColor ?? Colors.black),
        children:  <TextSpan>[
          TextSpan(
              text: text,
              style:  TextStyle(fontWeight: FontWeight.normal, fontSize: 12, color: textColor ?? Colors.black)),

        ],
      ),
    );
  }
}
