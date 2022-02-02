import 'package:vitemoncarburant/app/core/enums/fuel.dart';
import 'package:vitemoncarburant/app/data/models/search/records/point.dart';

class SearchRecords {
  Point? point;
  String city;
  String? brand;
  String? name;
  String address;
  String cp;
  String lastUpdate;
  double distance;

  Map<FuelType, double> fuels;

  SearchRecords(this.point, this.city, this.brand, this.name, this.address, this.cp, this.lastUpdate, this.fuels, this.distance);

  factory SearchRecords.fromJson(Map<String, dynamic> json) {
    Map<FuelType, double> prices = Map<FuelType, double>
        .from((json["fuels"] as Map<String, dynamic>)
        .map((key, value) => MapEntry(FuelTypeExtension.valueOf(key), value as double) ));
    return SearchRecords(Point.fromJson(json["point"]), json["city"], json["brand"], json["name"], json["address"], json["cp"], json["lastUpdate"], prices, -1);
  }
}