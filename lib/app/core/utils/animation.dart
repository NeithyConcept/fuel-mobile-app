import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';

class AnimationUtils {

  static AnimatedBuilder refreshAnimation(IndicatorController controller, Widget child) {
    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, _) {
        return Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[

            if (!controller.isIdle && !controller.isLoading && !controller.isArmed)
              Positioned(top: 35.0 * controller.value, child: Icon(Icons.arrow_downward_rounded)),

            if (controller.isLoading || controller.isArmed)
              Positioned(top: 35.0 * controller.value,
                child: Text("Une actualisation s'impose 🙂", style: TextStyle(fontWeight: FontWeight.bold)),),

            Transform.translate(offset: Offset(0, 100.0 * controller.value), child: child,),
          ],
        );
      },
    );
  }

}