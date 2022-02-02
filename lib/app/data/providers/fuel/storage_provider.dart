import 'dart:convert';

import 'package:get/get.dart';
import 'package:vitemoncarburant/app/core/enums/fuel.dart';
import 'package:vitemoncarburant/app/core/values/keys.dart';
import 'package:vitemoncarburant/app/data/services/storage_service.dart';

class FuelStorageProvider {

  final StorageServices _storage = Get.find<StorageServices>();

  List<FuelType> readFuels() {
    var result = <FuelType>[];
    jsonDecode(_storage.read(fuelKey).toString()).forEach((e) =>
        result.add(FuelType.values.where((t) => t.name == e).first));
    return result;
  }

  void writeFuels(List<String> values) => _storage.write(fuelKey, jsonEncode(values));

}