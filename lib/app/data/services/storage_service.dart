import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vitemoncarburant/app/core/values/keys.dart';

class StorageServices extends GetxService {
  late GetStorage _box;

  Future<StorageServices> init() async {
    _box = GetStorage();
    await _box.write(fuelKey, []);
    return this;
  }

  T read<T>(String key) {
    return _box.read(key);
  }

  void write(String key, dynamic value) async {
    await _box.write(key, value);
  }
}