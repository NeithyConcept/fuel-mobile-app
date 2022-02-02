import 'package:flutter/material.dart';
import 'package:vitemoncarburant/app/core/values/colors.dart';

class ButtonBuilder extends StatelessWidget {

  final String text;
  final BorderRadiusGeometry? borderRadius;
  final BorderSide? border;
  final double? width;
  final double? paddingVertical;
  final TextStyle? style;
  final Color? backgroundColor;
  final Color? color;
  final Function()? onPressed;
  final IconData? icon;

  ButtonBuilder(this.text, {Key? key,
    this.borderRadius,
    this.border,
    this.width,
    this.paddingVertical,
    this.style,
    this.backgroundColor,
    this.color,
    this.icon,
    this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double widthQuery = MediaQuery.of(context).size.width;

    return TextButton(
      onPressed: onPressed ?? () {},
      child: Container(
        padding: EdgeInsets.symmetric(vertical: paddingVertical ?? 16),
        width: width ?? widthQuery,
        child: Wrap(
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 15,
          children: [
            Text(text,
                textAlign: TextAlign.center,
                style: style ?? TextStyle(fontSize: 18, fontWeight: FontWeight.w700)
            ),
            if(icon != null) Icon(icon, size: 22),
          ],
        )
      ),
      style: TextButton.styleFrom(
        backgroundColor: backgroundColor ?? black,
        primary: color ?? white,
        side: border,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(16),
        )
      ),
    );
  }
}