import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:vitemoncarburant/app/core/enums/fuel.dart';
import 'package:vitemoncarburant/app/data/models/search/search.dart';
import 'package:vitemoncarburant/app/data/repository/search_repository.dart';

class LocationController extends GetxController {

  SearchRepository searchRepository;

  final RxList<FuelType> fuelsList = <FuelType>[].obs;
  late Future<Search> resultSearch;

  final distances = <int>[5, 10, 20, 50, 70];
  RxInt distanceSelected = 5.obs;

  RxString inputSearch = "Muret".obs;
  RxBool locationActivated = false.obs;

  LocationController({required this.searchRepository});

  @override
  void onInit() {
    fuelsList.value = searchRepository.storageProvider.readFuels();
    resultSearch = searchRepository.apiProvider.searchByCity(inputSearch.value);
    super.onInit();
  }

  List<FuelType> getFuelsList() => fuelsList.value;

  fetchStationCity(String? val) async {
    if(val != null) inputSearch.value = val;
    resultSearch = searchRepository.apiProvider.searchByCity(inputSearch.value);
    EasyLoading.showSuccess("Recherche lancé.", duration: Duration(seconds: 2), dismissOnTap: true);
  }

  fetchStationCoord() async {
    Position? position = await searchRepository.geolocationService.determinePosition();

    if(position != null) {
      resultSearch = searchRepository.apiProvider.searchByCoord(position.latitude, position.longitude, distanceSelected.value*1000);
      EasyLoading.showSuccess("Recherche lancée", duration: Duration(seconds: 2), dismissOnTap: true);
    } else {
      EasyLoading.showError("Impossible de récupérer\nvotre localisation", duration: Duration(seconds: 2), dismissOnTap: true);
    }
  }

  changeRadius(int distance) async {
    distanceSelected.value = distance;
    await fetchStationCoord();
  }

  fetchDependingOnLocation() async {
    if(locationActivated.value) {
      await fetchStationCoord();
    } else {
      await fetchStationCity(null);
    }
  }

  toggleLocation() {
    locationActivated.value = !locationActivated.value;
  }

}