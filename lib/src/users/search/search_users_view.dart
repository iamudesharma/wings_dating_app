import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:location_picker_flutter_map/location_picker_flutter_map.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:wings_dating_app/repo/profile_repo.dart' show profileRepoProvider;
import 'package:wings_dating_app/src/users/widget/user_grid_item.dart';

import '../../model/user_models.dart';

final userListProvider = FutureProvider.autoDispose<List<UserModel?>?>((ref) {
  final pickedData = ref.watch(pickedDataProvider);
  if (pickedData == null) return Future.value(null);

  GeoPoint geoPoint = GeoPoint(
    pickedData.latLong.latitude,
    pickedData.latLong.longitude,
  );
  return ref.read(profileRepoProvider).getUserListBySearch(geoPoint: geoPoint);
});

final pickedDataProvider = StateProvider<PickedData?>((ref) => null);

@RoutePage()
class SearchUsersView extends ConsumerWidget {
  const SearchUsersView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pickedData = ref.watch(pickedDataProvider);

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: FlutterLocationPicker(
              initZoom: 11,
              minZoomLevel: 5,
              maxZoomLevel: 16,
              trackMyPosition: true,
              onPicked: (picked) {
                ref.read(pickedDataProvider.notifier).state = picked;
                print(picked.address);
              },
            ),
          ),
          if (pickedData != null) const Expanded(child: SearchUserListWidget()),
        ],
      ),
    );
  }
}

class SearchUserListWidget extends ConsumerWidget {
  const SearchUserListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userListAsync = ref.watch(userListProvider);

    return userListAsync.when(
      data: (users) {
        if (users == null || users.isEmpty) {
          return const Center(child: Text('No users found.'));
        }
        return ResponsiveBuilder(builder: (context, sizingInformation) {
          return SizedBox(
            height: sizingInformation.screenSize.height,
            width: sizingInformation.screenSize.width,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: sizingInformation.isMobile
                    ? 3
                    : sizingInformation.isTablet
                        ? 4
                        : 5,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                final user = users[index];

                // final users = user[index];

                return UserGridItem(
                  onTapEditProfile: () async {
                    AutoTabsRouter.of(context).setActiveIndex(4);
                  },
                  isCurrentUser: false,
                  users: user!,
                ).animate().shake();
              },
              itemCount: users.length,
            ),
          );
        });
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, st) => Center(child: Text('Error: $e')),
    );
  }
}
