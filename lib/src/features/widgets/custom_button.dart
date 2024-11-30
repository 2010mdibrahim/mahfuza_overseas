import 'package:flutter/material.dart';
import '../../core/utilities/theme_config.dart';
import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Color? textColor;
  final Color? backgroundColor;
  final VoidCallback? onPress;
  final double? borderRadius,
      fontSize,
      letterSpacing,
      minimumHeight,
      minimumWidth;
  final bool? isNeedBorder;

  const CustomButton({
    super.key,
    required this.title,
    this.textColor,
    this.backgroundColor,
    this.onPress,
    this.borderRadius,
    this.letterSpacing,
    this.fontSize,
    this.minimumHeight,
    this.minimumWidth,
    this.isNeedBorder,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        foregroundColor:
            MaterialStateProperty.all<Color>(textColor ?? ThemeConfig.white),
        backgroundColor: MaterialStateProperty.all<Color>(
            backgroundColor ?? Theme.of(context).primaryColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 18.0),
              side: isNeedBorder == false
                  ? const BorderSide(color: Colors.transparent, width: 0)
                  : BorderSide(color: ThemeConfig.grey.withOpacity(0.3), width: 1)),
        ),
        minimumSize: MaterialStateProperty.all(
            Size(minimumWidth ?? 0.0, minimumHeight ?? 0.0)),
        // maximumSize: MaterialStateProperty.all(Size(maximumHeight ?? 0.0, maximumWidth ?? 0.0))
      ),
      onPressed: onPress,
      child: Text(
        title,
        style:
            TextStyle(fontSize: fontSize ?? 16, letterSpacing: letterSpacing),
      ),
    );
  }
}

class CustomRoundButton extends StatelessWidget {
  final String title;
  final Color? textColor;
  final Color? backgroundColor;
  final VoidCallback? onPress;
  final bool? isCalender, clockIcon;
  final double? borderRadius;

  const CustomRoundButton(
      {super.key,
      required this.title,
      this.textColor,
      this.backgroundColor,
      this.onPress,
      this.isCalender,
      this.borderRadius,
      this.clockIcon});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 50,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Colors.grey.withOpacity(0.3),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius ?? 5),
                ),
                side: BorderSide(
                  color: Colors.grey.withOpacity(0.0),
                ),
              ),
              onPressed: onPress,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 10,
                    child: Center(
                      child: CustomSimpleText(
                        text: title,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Icon(
                      (isCalender ?? false)
                          ? Icons.calendar_month
                          : clockIcon == true
                              ? Icons.access_time_filled
                              : Icons.file_present_rounded,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomTextButton extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Function onPressed;
  final Color? color;
  final FontStyle? fontStyle;
  final TextAlign? alignment;

  const CustomTextButton(
      {Key? key,
      required this.text,
      required this.fontSize,
      required this.onPressed,
      this.color = Colors.black,
      this.fontStyle,
      this.fontWeight,
      this.alignment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: TextButton(
        onPressed: () => onPressed(),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: color ?? Theme.of(context).textTheme.bodyLarge?.color,
              fontWeight: fontWeight ??
                  Theme.of(context).textTheme.bodyLarge?.fontWeight,
              fontSize:
                  fontSize ?? Theme.of(context).textTheme.bodyLarge?.fontSize,
              fontStyle: fontStyle ??
                  Theme.of(context).textTheme.bodyLarge?.fontStyle),
        ),
      ),
    );
  }
}
