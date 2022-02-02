import 'package:flutter/material.dart';
import 'package:vitemoncarburant/app/core/enums/fuel.dart';
import 'package:vitemoncarburant/app/core/utils/global.dart';
import 'package:vitemoncarburant/app/core/values/colors.dart';

class StationPrices extends StatefulWidget {
  final Map<FuelType, double> fuels;

  StationPrices(this.fuels, {Key? key}) : super(key: key);

  @override
  _StationPricesState createState() => _StationPricesState();
}

class _StationPricesState extends State<StationPrices> {
  @override
  Widget build(BuildContext context) {
    List<MapEntry<String, double>> listPrices = widget.fuels.map((key, value) =>
        MapEntry("${key.name} ".substring(0, 4).toUpperCase(), Utils.toPrecision(value, 2))).entries.toList();

    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 150,
          childAspectRatio: 3 / 0.75,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
      itemCount: listPrices.length,
      itemBuilder: (BuildContext ctx, index) {
        return Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(6)
          ),
          child: Wrap(
            spacing: 3,
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.center,
            children: [
              Text(listPrices[index].key, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              Icon(Icons.arrow_forward_rounded, size: 12),
              Text("${listPrices[index].value} €", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            ],
          ),
        );
      }
    );
  }
}
