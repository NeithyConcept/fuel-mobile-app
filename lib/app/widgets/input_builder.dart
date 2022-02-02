import 'package:flutter/material.dart';
import 'package:vitemoncarburant/app/core/values/colors.dart';

class InputBuilder extends StatefulWidget {

  String text;
  String? value;
  bool password;

  Widget? suffixIcon;
  Widget? prefixIcon;

  bool readOnly;
  final TextInputAction? textInputAction;

  void Function(String)? onChanged;
  void Function(String)? onSubmitted;

  InputBuilder({Key? key,
    required this.text,
    this.value,
    this.password = false,
    this.suffixIcon,
    this.prefixIcon,
    this.onChanged,
    this.onSubmitted,
    this.readOnly = false,
    this.textInputAction
  }) : super(key: key);

  @override
  _InputBuilderState createState() => _InputBuilderState();
}

class _InputBuilderState extends State<InputBuilder> {

  bool visibility = false;

  @override
  Widget build(BuildContext context) {

    OutlineInputBorder borderRadius = OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: grey, width: 2),
    );

    return TextField(
      onChanged: widget.onChanged,
      onSubmitted: widget.onSubmitted,
      readOnly: widget.readOnly,
      controller: TextEditingController(text: widget.value),
      obscureText: widget.password ? !visibility : false,
      textInputAction: widget.textInputAction ?? TextInputAction.go,
      autofocus: false,
      style: TextStyle(
          fontWeight: FontWeight.w700,
          color: widget.readOnly ? darkGrey : black
      ),
      decoration: InputDecoration(
          hintText: widget.text,
          hintStyle: TextStyle(
              color: black.withOpacity(0.5)
          ),
          suffixIcon: widget.password ? GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => setState(() => visibility = !visibility),
            child: Padding(
              padding: EdgeInsets.only(right: 30),
              child: Icon(visibility ? Icons.visibility : Icons.visibility_off, color: black),
            ),
          ) : widget.suffixIcon,
          prefixIcon: widget.prefixIcon,
          contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          border: borderRadius,
          enabledBorder: borderRadius,
          focusedBorder: borderRadius,
      ),
    );
  }
}
