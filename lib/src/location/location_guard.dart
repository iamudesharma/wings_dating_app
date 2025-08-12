import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wings_dating_app/services/location_service.dart';
import 'package:wings_dating_app/routes/app_router.dart';

class LocationGuard extends AutoRouteGuard {
  final Ref ref;
  
  LocationGuard({required this.ref});

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    final locationService = ref.read(locationServiceProvider.notifier);
    final locationState = ref.read(locationServiceProvider);
    
    // Check location permission status
    await locationService.checkLocationPermission();
    final updatedState = ref.read(locationServiceProvider);
    
    // Allow navigation if location is available (either GPS or manual)
    if (updatedState.hasValidLocation) {
      resolver.next(true);
    } else {
      // Redirect to location permission screen
      resolver.next(false);
      router.push(const LocationPermissionRoute());
    }
  }
}