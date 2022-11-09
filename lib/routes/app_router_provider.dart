import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wings_dating_app/routes/app_router.dart';
part 'app_router_provider.g.dart';

@riverpod
AppRouter appRoute(AppRouteRef ref) {
  return AppRouter();
}
