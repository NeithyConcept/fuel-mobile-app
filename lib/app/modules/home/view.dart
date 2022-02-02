import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vitemoncarburant/app/core/enums/fuel.dart';
import 'package:vitemoncarburant/app/core/values/colors.dart';
import 'package:vitemoncarburant/app/core/values/size.dart';
import 'package:vitemoncarburant/app/data/models/fuels/fuels.dart';
import 'package:vitemoncarburant/app/modules/home/controller.dart';
import 'package:vitemoncarburant/app/modules/location/binding.dart';
import 'package:vitemoncarburant/app/modules/location/view.dart';
import 'package:vitemoncarburant/app/widgets/button_builder.dart';

class HomeView extends GetView<HomeController> {

  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          margin: container,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Wrap(
                spacing: 10,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Text("Sélectionnez un carburant",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Icon(Icons.local_gas_station)
                ],
              ),
              SizedBox(height: 50),
              FutureBuilder(
                  future: controller.fuels,
                  builder: (context, snapshot) {
                    if(snapshot.hasData) {
                      return _buildLayoutGrid(snapshot);
                    } else if(snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }

                    return LinearProgressIndicator(
                        color: darkGrey,
                        backgroundColor: primaryColor,
                        minHeight: 3
                    );

                  }
              ),
              SizedBox(height: 50),
              ButtonBuilder("Suivant", onPressed: () async {
                controller.updateStorageFuelList();
                Get.to(() => LocationView(), binding: LocationBinding());
              })
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLayoutGrid(AsyncSnapshot<Object?> snapshot) {

    List<FuelType> listFuels = (snapshot.data as Fuels).fuels;

    return GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 225,
            childAspectRatio: 3 / 1.1,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10
        ),
        itemCount: listFuels.length,
        itemBuilder: (BuildContext ctx, index) => _gestureDetector(listFuels[index])
    );
  }

  Widget _gestureDetector(FuelType e) {
    return Obx(() => GestureDetector(
      onTap: () => controller.toggleFuelsSelected(e),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            color: controller.fuelsSelected.contains(e) ? primaryColor : grey,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: controller.fuelsSelected.contains(e) ? black : Colors.transparent, width: 3)
        ),
        child: Text(e.name, style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
      ),
    ));
  }
}