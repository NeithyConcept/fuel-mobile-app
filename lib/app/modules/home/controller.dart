import 'package:get/get.dart';
import 'package:vitemoncarburant/app/core/enums/fuel.dart';
import 'package:vitemoncarburant/app/data/models/fuels/fuels.dart';
import 'package:vitemoncarburant/app/data/repository/fuel_repository.dart';

class HomeController extends GetxController {

  FuelRepository fuelRepository;

  late Future<Fuels> fuels;
  RxList<FuelType> fuelsSelected = <FuelType>[].obs;

  HomeController({required this.fuelRepository});

  @override
  void onInit() {
    fuels = fuelRepository.apiProvider.getAll();
    super.onInit();
  }

  @override
  void onClose() async {
    await updateStorageFuelList();
    super.onClose();
  }

  toggleFuelsSelected(FuelType e) => !fuelsSelected.contains(e) ? fuelsSelected.add(e) : fuelsSelected.remove(e);

  updateStorageFuelList() {
    fuelRepository.setStorageFuels(fuelsSelected.value);
  }

}