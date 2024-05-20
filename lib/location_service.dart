import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class LocationService {
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Verifica si los servicios de ubicación están habilitados
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Los servicios de ubicación están deshabilitados.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Los permisos de ubicación están denegados.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Los permisos de ubicación están permanentemente denegados, no podemos solicitar permisos.');
    }

    // Obtiene la ubicación actual del dispositivo
    return await Geolocator.getCurrentPosition();
  }

  Future<String> getAddressFromLatLng() async {
    try {
      Position position = await _determinePosition();
      List<Placemark> placemarks = await placemarkFromCoordinates(
          position.latitude, position.longitude);

      Placemark place = placemarks[0];
      return "${place.locality}, ${place.administrativeArea}, ${place.country}";
    } catch (e) {
      return "No se pudo obtener la dirección: $e";
    }
  }
}

