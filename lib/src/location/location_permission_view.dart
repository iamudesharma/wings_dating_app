import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wings_dating_app/services/location_service.dart';
import 'package:wings_dating_app/routes/app_router.dart';

@RoutePage()
class LocationPermissionView extends ConsumerStatefulWidget {
  const LocationPermissionView({super.key});

  @override
  ConsumerState<LocationPermissionView> createState() => _LocationPermissionViewState();
}

class _LocationPermissionViewState extends ConsumerState<LocationPermissionView> {
  @override
  void initState() {
    super.initState();
    // Check location permission when the screen loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(locationServiceProvider.notifier).checkLocationPermission();
    });
  }

  @override
  Widget build(BuildContext context) {
    final locationState = ref.watch(locationServiceProvider);
    final locationService = ref.read(locationServiceProvider.notifier);

    // Listen for successful location setup and navigate to dashboard
    ref.listen(locationServiceProvider, (previous, current) {
      if (current.hasValidLocation && mounted) {
        AutoRouter.of(context).pushAndClearStack(const DashboardRoute());
      }
    });

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // App Logo or Icon
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(60),
                ),
                child: Icon(
                  Icons.location_on,
                  size: 60,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              const SizedBox(height: 32),
              
              // Title
              Text(
                'Location Required',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              
              // Description
              Text(
                'Location access is required to use Wings Dating App. This helps us show you nearby people and enhance your dating experience.',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.grey[600],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              
              // Why location is required
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Theme.of(context).primaryColor.withOpacity(0.3)),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.info_outline,
                          color: Theme.of(context).primaryColor,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Why we need location:',
                          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildFeatureItem(context, Icons.people, 'Find people near you'),
                        const SizedBox(height: 8),
                        _buildFeatureItem(context, Icons.location_on, 'Calculate distances accurately'),
                        const SizedBox(height: 8),
                        _buildFeatureItem(context, Icons.favorite, 'Improve match suggestions'),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              
              // Loading indicator
              if (locationState.isLoading)
                const Padding(
                  padding: EdgeInsets.only(bottom: 24),
                  child: CircularProgressIndicator(),
                ),
              
              // Error message
              if (locationState.error != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.red.withOpacity(0.3)),
                    ),
                    child: Text(
                      locationState.error!,
                      style: TextStyle(color: Colors.red[700]),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),

              // Status message for permanently denied permissions
              if (locationState.status == LocationPermissionStatus.deniedForever)
                Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.orange.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.orange.withOpacity(0.3)),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Location permission was permanently denied.',
                          style: TextStyle(color: Colors.orange[700], fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Please open app settings and enable location permission to continue using the app.',
                          style: TextStyle(color: Colors.orange[600]),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              
              // Enable Location Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: locationState.isLoading 
                      ? null 
                      : () => _handleEnableLocation(locationState, locationService),
                  icon: const Icon(Icons.location_on),
                  label: Text(_getLocationButtonText(locationState)),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Skip for now (optional, can be removed if location is mandatory)
              // TextButton(
              //   onPressed: () {
              //     // Allow user to skip and use app with limited functionality
              //     AutoRouter.of(context).pushAndClearStack(const DashboardRoute());
              //   },
              //   child: const Text('Skip for now'),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  String _getLocationButtonText(LocationState state) {
    switch (state.status) {
      case LocationPermissionStatus.denied:
        return 'Enable Location Permission';
      case LocationPermissionStatus.deniedForever:
        return 'Open App Settings';
      case LocationPermissionStatus.serviceDisabled:
        return 'Open Location Settings';
      case LocationPermissionStatus.granted:
        return 'Get Current Location';
      default:
        return 'Enable Location';
    }
  }

  void _handleEnableLocation(LocationState state, LocationService service) {
    switch (state.status) {
      case LocationPermissionStatus.denied:
      case LocationPermissionStatus.unableToDetermine:
        service.requestLocationPermission();
        break;
      case LocationPermissionStatus.deniedForever:
        service.openAppSettings();
        break;
      case LocationPermissionStatus.serviceDisabled:
        service.openLocationSettings();
        break;
      case LocationPermissionStatus.granted:
        service.getCurrentPosition();
        break;
    }
  }

  Widget _buildFeatureItem(BuildContext context, IconData icon, String text) {
    return Row(
      children: [
        Icon(
          icon,
          size: 16,
          color: Theme.of(context).primaryColor,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.grey[700],
            ),
          ),
        ),
      ],
    );
  }
}