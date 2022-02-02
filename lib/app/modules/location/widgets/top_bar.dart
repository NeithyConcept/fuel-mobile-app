import 'package:flutter/material.dart';
import 'package:vitemoncarburant/app/core/values/colors.dart';
import 'package:vitemoncarburant/app/widgets/dropdown_builder.dart';

class TopBar extends StatefulWidget {

  final DropdownBuilder dropdown;

  final bool showDistances;

  TopBar({Key? key, required this.dropdown, this.showDistances = false}) : super(key: key);

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.only(top: 25),
      height: 50,
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  decoration: BoxDecoration(
                      color: grey,
                      borderRadius: BorderRadius.circular(6)
                  ),
                  child: Icon(Icons.navigate_before_rounded, size:  32),
                )
            ),
          ),
          if(widget.showDistances) Align(
              alignment: Alignment.bottomRight,
              child: widget.dropdown
          ),
        ],
      ),
    );

  }
}
