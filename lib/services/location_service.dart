import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:wings_dating_app/src/model/geo_point_data.dart';

enum LocationPermissionStatus {
  granted,
  denied,
  deniedForever,
  serviceDisabled,
  unableToDetermine,
}

class LocationState {
  final LocationPermissionStatus status;
  final Position? position;
  final bool isLoading;
  final String? error;

  const LocationState({
    required this.status,
    this.position,
    this.isLoading = false,
    this.error,
  });

  LocationState copyWith({
    LocationPermissionStatus? status,
    Position? position,
    bool? isLoading,
    String? error,
  }) {
    return LocationState(
      status: status ?? this.status,
      position: position ?? this.position,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }

  bool get hasValidLocation => position != null;
  
  GeoPointData? get currentLocation {
    if (position != null) {
      return GeoPointData(
        geopoint: [position!.longitude, position!.latitude],
        geohash: '', // You can implement geohash generation if needed
      );
    }
    return null;
  }
}

final locationServiceProvider = StateNotifierProvider<LocationService, LocationState>((ref) {
  return LocationService();
});

class LocationService extends StateNotifier<LocationState> {
  LocationService() : super(const LocationState(status: LocationPermissionStatus.unableToDetermine));

  Future<void> checkLocationPermission() async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        state = state.copyWith(
          status: LocationPermissionStatus.serviceDisabled,
          isLoading: false,
        );
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      LocationPermissionStatus status = _mapPermissionToStatus(permission);

      state = state.copyWith(
        status: status,
        isLoading: false,
      );

      // If permission is granted, try to get current position
      if (status == LocationPermissionStatus.granted) {
        await getCurrentPosition();
      }
    } catch (e) {
      state = state.copyWith(
        error: e.toString(),
        isLoading: false,
      );
    }
  }

  Future<void> requestLocationPermission() async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      LocationPermission permission = await Geolocator.requestPermission();
      LocationPermissionStatus status = _mapPermissionToStatus(permission);

      state = state.copyWith(
        status: status,
        isLoading: false,
      );

      // If permission is granted, try to get current position
      if (status == LocationPermissionStatus.granted) {
        await getCurrentPosition();
      }
    } catch (e) {
      state = state.copyWith(
        error: e.toString(),
        isLoading: false,
      );
    }
  }

  Future<void> getCurrentPosition() async {
    if (state.status != LocationPermissionStatus.granted) return;

    state = state.copyWith(isLoading: true, error: null);

    try {
      Position position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
          distanceFilter: 100,
        ),
      );

      state = state.copyWith(
        position: position,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        error: e.toString(),
        isLoading: false,
      );
    }
  }

  void openLocationSettings() {
    Geolocator.openLocationSettings();
  }

  void openAppSettings() {
    Geolocator.openAppSettings();
  }

  LocationPermissionStatus _mapPermissionToStatus(LocationPermission permission) {
    switch (permission) {
      case LocationPermission.always:
      case LocationPermission.whileInUse:
        return LocationPermissionStatus.granted;
      case LocationPermission.denied:
        return LocationPermissionStatus.denied;
      case LocationPermission.deniedForever:
        return LocationPermissionStatus.deniedForever;
      case LocationPermission.unableToDetermine:
        return LocationPermissionStatus.unableToDetermine;
    }
  }
}