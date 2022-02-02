import 'package:flutter/material.dart';
import 'package:vitemoncarburant/app/core/values/colors.dart';

enum AlertType {
  error, success, info, warning
}

class AlertBuilder extends StatelessWidget {

  final String text;
  final AlertType? type;
  final IconData? icon;

  AlertBuilder(this.text, {Key? key, this.type = AlertType.error, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    AlertSettings settings = this.settings();

    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      decoration: BoxDecoration(
          color: settings.background,
          borderRadius: BorderRadius.circular(3),
          border: Border.all(color: settings.border, width: 2)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(icon ?? settings.icon),
          SizedBox(width: 15),
          Flexible(child: Text(text,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), softWrap: true))
        ],
      ),
    );
  }

  AlertSettings settings() {

    switch (type) {
      case AlertType.success:
        return AlertSettings(green.withOpacity(0.3), darkGreen.withOpacity(0.2), Icons.check);
      case AlertType.info:
        return AlertSettings(blue.withOpacity(0.3), darkBlue.withOpacity(0.2), Icons.info);
      case AlertType.warning:
        return AlertSettings(orange.withOpacity(0.3), darkOrange.withOpacity(0.2), Icons.warning);
      default:
        return AlertSettings(red.withOpacity(0.3), darkRed.withOpacity(0.2), Icons.priority_high);
    }

  }
}

class AlertSettings {

  final Color background;
  final Color border;
  final IconData icon;

  AlertSettings(this.background, this.border, this.icon);

}
