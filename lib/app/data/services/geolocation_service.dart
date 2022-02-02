import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:geolocator/geolocator.dart';

class GeolocationService {

  Future<bool> isEnabled({bool toast = true}) async {
    if (!await Geolocator.isLocationServiceEnabled()) {
      if(toast) EasyLoading.showError('Votre localisation est désactivé.', duration: Duration(seconds: 2), dismissOnTap: true);
      return false;
    }

    return true;
  }

  Future<Position?> determinePosition({bool toast = true}) async {

    LocationPermission permission;

    if(toast) EasyLoading.show(status: 'Chargement ...', maskType: EasyLoadingMaskType.black);

    if(!await isEnabled(toast: toast)) return null;

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        if(toast) EasyLoading.showError('Permission manquante.', duration: Duration(seconds: 2), dismissOnTap: true);
        return null;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      if(toast) EasyLoading.showError('Permission manquante.', duration: Duration(seconds: 2), dismissOnTap: true);
      return null;
    }

    return await Geolocator.getCurrentPosition(timeLimit: Duration(seconds: 3));
  }

  Future<double?> distanceFromCurrent(double latitude, double longitude) async {

    if(await isEnabled(toast: false)) {
      Position? current = await determinePosition(toast: false);

      if(current != null) return Geolocator.distanceBetween(current.latitude, current.longitude, latitude, longitude);
    }

    return null;
  }

}