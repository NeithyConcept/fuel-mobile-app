import 'package:vitemoncarburant/app/core/enums/fuel.dart';
import 'package:vitemoncarburant/app/data/providers/fuel/api_provider.dart';
import 'package:vitemoncarburant/app/data/providers/fuel/storage_provider.dart';

class FuelRepository {

  FuelStorageProvider storageProvider;
  FuelApiProvider apiProvider;

  FuelRepository({required this.storageProvider, required this.apiProvider});

  void setStorageFuels(List<FuelType> fuels) => storageProvider.writeFuels(fuels.map((e) => e.name).toList());
}