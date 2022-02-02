import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vitemoncarburant/app/core/utils/animation.dart';
import 'package:vitemoncarburant/app/core/values/colors.dart';
import 'package:vitemoncarburant/app/core/values/size.dart';
import 'package:vitemoncarburant/app/data/models/search/search.dart';
import 'package:vitemoncarburant/app/modules/location/controller.dart';
import 'package:vitemoncarburant/app/modules/location/widgets/station_list.dart';
import 'package:vitemoncarburant/app/modules/location/widgets/top_bar.dart';
import 'package:vitemoncarburant/app/widgets/alert_builder.dart';
import 'package:vitemoncarburant/app/widgets/dropdown_builder.dart';
import 'package:vitemoncarburant/app/widgets/input_builder.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';

class LocationView extends GetView<LocationController> {

  const LocationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Container(
            width: MediaQuery.of(context).size.width,
            margin: container,
            child: Column(
              children: [
                Obx(() => TopBar(
                    showDistances: controller.locationActivated.value,
                    dropdown: DropdownBuilder(
                      pattern: "VALUE km",
                      values: controller.distances,
                      defaultValue: controller.distanceSelected.value,
                      onChanged: (newRadius) async => await controller.changeRadius(newRadius),
                    )
                )),
                SizedBox(height: 25),
                Obx(() => Stack(
                  alignment: Alignment.center,
                  children: [
                    InputBuilder(
                      text: "Ville",
                      value: controller.inputSearch.value,
                      readOnly: controller.locationActivated.value,
                      textInputAction: TextInputAction.search,
                      onSubmitted: (String val) async => await controller.fetchStationCity(val),
                    ),
                    Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          child: Container(
                            padding: EdgeInsets.all(15),
                            child: GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: () async {
                                controller.toggleLocation();
                                return await controller.fetchDependingOnLocation();
                              },
                              child: Icon(Icons.my_location, color: controller.locationActivated.value ? blue : black),
                            ),
                          ),
                        )
                    )
                  ],
                )),
                SizedBox(height: 25),
                Expanded(
                  child: CustomRefreshIndicator(
                    onRefresh: () async => await controller.fetchDependingOnLocation(),
                    builder: (BuildContext context, Widget child, IndicatorController controller) {
                      return AnimationUtils.refreshAnimation(controller, child);
                    },
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: FutureBuilder(
                        future: controller.resultSearch,
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return AlertBuilder("${snapshot.error}");
                          } else if (!snapshot.hasData || snapshot.connectionState == ConnectionState.waiting) {
                            return LinearProgressIndicator(
                                color: darkGrey,
                                backgroundColor: grey,
                                minHeight: 3
                            );
                          } else {
                            return StationList(snapshot.data as Search);
                          }
                        }),
                      ),
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}