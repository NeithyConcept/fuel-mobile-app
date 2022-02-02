import 'package:get/get.dart';
import 'package:vitemoncarburant/app/data/providers/fuel/storage_provider.dart';
import 'package:vitemoncarburant/app/data/providers/search/api_provider.dart';
import 'package:vitemoncarburant/app/data/repository/search_repository.dart';
import 'package:vitemoncarburant/app/data/services/geolocation_service.dart';
import 'package:vitemoncarburant/app/modules/location/controller.dart';
import 'package:http/http.dart' as http;

class LocationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocationController>(() => LocationController(
      searchRepository: SearchRepository(
        apiProvider: SearchApiProvider(httpClient: http.Client()),
        storageProvider: FuelStorageProvider(),
        geolocationService: GeolocationService()
      )
    ));
  }
}