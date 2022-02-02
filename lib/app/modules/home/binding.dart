import 'package:get/get.dart';
import 'package:vitemoncarburant/app/data/providers/fuel/api_provider.dart';
import 'package:vitemoncarburant/app/data/providers/fuel/storage_provider.dart';
import 'package:vitemoncarburant/app/data/repository/fuel_repository.dart';
import 'package:vitemoncarburant/app/modules/home/controller.dart';
import 'package:http/http.dart' as http;

class HomeBinding implements Bindings {

  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController(
      fuelRepository: FuelRepository(
        storageProvider: FuelStorageProvider(),
        apiProvider: FuelApiProvider(httpClient: http.Client())
      )
    ), fenix: true);
  }

}