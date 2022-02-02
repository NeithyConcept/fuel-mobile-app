import 'dart:convert';

import 'package:vitemoncarburant/app/core/enums/fuel.dart';

class Fuels {

  final List<FuelType> fuels;

  Fuels(this.fuels);

  factory Fuels.fromJson(String raw) {
    return Fuels(List<FuelType>.from((jsonDecode(raw) as List<dynamic>).map((e) => FuelTypeExtension.valueOf(e))));
  }

}