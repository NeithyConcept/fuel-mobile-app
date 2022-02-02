import 'package:flutter/material.dart';
import 'package:vitemoncarburant/app/core/values/colors.dart';

class DropdownBuilder extends StatefulWidget {

  final String? pattern;
  late final dynamic defaultValue;
  final void Function(dynamic)? onChanged;
  final List<dynamic> values;

  DropdownBuilder({this.pattern, required this.defaultValue, required this.values, required this.onChanged, Key? key}) : super(key: key);

  @override
  _DropdownBuilderState createState() => _DropdownBuilderState();
}

class _DropdownBuilderState extends State<DropdownBuilder> {

  @override
  Widget build(BuildContext context) {

    return DropdownButtonHideUnderline(
      child: DropdownButton<dynamic>(
        value: widget.defaultValue,
        icon: Icon(Icons.expand_more_rounded),
        iconSize: 24,
        elevation: 1,
        borderRadius: BorderRadius.circular(6),
        dropdownColor: grey,
        style: TextStyle(color: black, fontWeight: FontWeight.bold, fontSize: 18),
        onChanged: widget.onChanged,
        items: widget.values.map<DropdownMenuItem<dynamic>>((value) {
          return DropdownMenuItem<dynamic>(
            value: value,
            child: Text(widget.pattern != null ? widget.pattern!.replaceAll("VALUE", value.toString()) : value.toString()),
            alignment: Alignment.center,
          );
        }).toList(),
      ),
    );
  }
}
