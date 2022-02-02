import 'package:vitemoncarburant/app/data/providers/fuel/storage_provider.dart';
import 'package:vitemoncarburant/app/data/providers/search/api_provider.dart';
import 'package:vitemoncarburant/app/data/services/geolocation_service.dart';

class SearchRepository {

  FuelStorageProvider storageProvider;
  SearchApiProvider apiProvider;
  GeolocationService geolocationService;

  SearchRepository({
    required this.storageProvider,
    required this.apiProvider,
    required this.geolocationService
  });
}