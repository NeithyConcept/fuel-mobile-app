import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:vitemoncarburant/app/core/values/colors.dart';

class ModalBottomSheetBuilder {

  final bool hapticFeedback;
  final Widget child;
  BuildContext context;

  ModalBottomSheetBuilder({required this.context, this.hapticFeedback = false, required this.child}) {
    build(context);
  }

  void build(BuildContext context) {

    if(hapticFeedback) HapticFeedback.vibrate();

    showModalBottomSheet(
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30)
          ),
        ),
        context: context,
        builder: (context) => Wrap(
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 7),
                width: 50, height: 5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: darkGrey,
                ),
              ),
            ),
            child
          ],
        )
    );
  }
}