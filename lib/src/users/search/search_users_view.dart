// // import 'package:auto_route/auto_route.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_animate/flutter_animate.dart';
// // import 'package:flutter_riverpod/flutter_riverpod.dart';
// // import 'package:location_picker_flutter_map/location_picker_flutter_map.dart';
// // import 'package:responsive_builder/responsive_builder.dart';
// // import 'package:wings_dating_app/repo/profile_repo.dart' show profileRepoProvider;
// // import 'package:wings_dating_app/src/users/widget/user_grid_item.dart';

// // import '../../model/user_models.dart';

// // final userListProvider = FutureProvider.autoDispose<List<UserModel?>?>((ref) {
// //   final pickedData = ref.watch(pickedDataProvider);
// //   if (pickedData == null) return Future.value(null);

// //   GeoPoint geoPoint = GeoPoint(
// //     pickedData.latLong.latitude,
// //     pickedData.latLong.longitude,
// //   );
// //   return ref.read(profileRepoProvider).getUserListBySearch(geoPoint: geoPoint);
// // });

// // final pickedDataProvider = StateProvider<PickedData?>((ref) => null);

// // @RoutePage()
// // class SearchUsersView extends ConsumerWidget {
// //   const SearchUsersView({super.key});

// //   @override
// //   Widget build(BuildContext context, WidgetRef ref) {
// //     final pickedData = ref.watch(pickedDataProvider);

// //     return Scaffold(
// //       body: Column(
// //         children: [
// //           Expanded(
// //             child: FlutterLocationPicker(
// //               initZoom: 11,
// //               minZoomLevel: 5,
// //               maxZoomLevel: 16,
// //               trackMyPosition: true,
// //               onPicked: (picked) {
// //                 ref.read(pickedDataProvider.notifier).state = picked;
// //                 print(picked.address);
// //               },
// //             ),
// //           ),
// //           if (pickedData != null) const Expanded(child: SearchUserListWidget()),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // class SearchUserListWidget extends ConsumerWidget {
// //   const SearchUserListWidget({super.key});

// //   @override
// //   Widget build(BuildContext context, WidgetRef ref) {
// //     final userListAsync = ref.watch(userListProvider);

// //     return userListAsync.when(
// //       data: (users) {
// //         if (users == null || users.isEmpty) {
// //           return const Center(child: Text('No users found.'));
// //         }
// //         return ResponsiveBuilder(builder: (context, sizingInformation) {
// //           return SizedBox(
// //             height: sizingInformation.screenSize.height,
// //             width: sizingInformation.screenSize.width,
// //             child: GridView.builder(
// //               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// //                 crossAxisCount: sizingInformation.isMobile
// //                     ? 3
// //                     : sizingInformation.isTablet
// //                         ? 4
// //                         : 5,
// //                 mainAxisSpacing: 10,
// //                 crossAxisSpacing: 10,
// //               ),
// //               itemBuilder: (context, index) {
// //                 final user = users[index];

// //                 // final users = user[index];

// //                 return UserGridItem(
// //                   onTapEditProfile: () async {
// //                     AutoTabsRouter.of(context).setActiveIndex(4);
// //                   },
// //                   isCurrentUser: false,
// //                   users: user!,
// //                 ).animate().shake();
// //               },
// //               itemCount: users.length,
// //             ),
// //           );
// //         });
// //       },
// //       loading: () => const Center(child: CircularProgressIndicator()),
// //       error: (e, st) => Center(child: Text('Error: $e')),
// //     );
// //   }
// // }

// import 'package:auto_route/auto_route.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_animate/flutter_animate.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:location_picker_flutter_map/location_picker_flutter_map.dart';
// import 'package:responsive_builder/responsive_builder.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';
// import 'package:wings_dating_app/repo/profile_repo.dart';
// import 'package:wings_dating_app/src/users/widget/user_grid_item.dart';

// import '../../model/user_models.dart';
// part 'search_users_view.g.dart';

// // ------------------- RIVERPOD PROVIDERS -------------------

// @riverpod
// class SearchUser extends _$SearchUser {
//   PickedData? _pickedData;

//   // Called automatically when the provider is initialized or refreshed
//   @override
//   FutureOr<List<UserModel?>?> build() async {
//     if (_pickedData == null) return null;

//     final geoPoint = GeoPoint(
//       _pickedData!.latLong.latitude,
//       _pickedData!.latLong.longitude,
//     );

//     return ref.read(profileRepoProvider).getUserListBySearch(geoPoint: geoPoint);
//   }

//   void setPickedData(PickedData? data) {
//     _pickedData = data;
//     // Triggers the provider to rebuild using the new picked data
//     ref.invalidateSelf(); // Equivalent to notifyListeners()
//   }
// }

// @RoutePage()
// class SearchUsersView extends ConsumerWidget {
//   const SearchUsersView({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     // final pickedData = ref.watch(pickedDataProvider);

//     return Scaffold(
//       body: Column(
//         children: [
//           Expanded(
//             child: FlutterLocationPicker(
//               initZoom: 11,
//               minZoomLevel: 5,
//               maxZoomLevel: 16,
//               trackMyPosition: true,
//               onPicked: (picked) {
//                 ref.read(searchUserProvider.notifier).setPickedData(picked);
//                 print(picked.address);
//               },
//             ),
//           ),
//           if (ref.read(searchUserProvider.notifier)._pickedData != null) const Expanded(child: SearchUserListWidget()),
//         ],
//       ),
//     );
//   }
// }

// class SearchUserListWidget extends ConsumerWidget {
//   const SearchUserListWidget({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final userListAsync = ref.watch(searchUserProvider);

//     return userListAsync.when(
//       data: (users) {
//         if (users == null || users.isEmpty) {
//           return const Center(child: Text('No users found.'));
//         }
//         return ResponsiveBuilder(
//           builder: (context, sizingInformation) {
//             return SizedBox(
//               height: sizingInformation.screenSize.height,
//               width: sizingInformation.screenSize.width,
//               child: GridView.builder(
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: sizingInformation.isMobile
//                       ? 3
//                       : sizingInformation.isTablet
//                           ? 4
//                           : 5,
//                   mainAxisSpacing: 10,
//                   crossAxisSpacing: 10,
//                 ),
//                 itemCount: users.length,
//                 itemBuilder: (context, index) {
//                   final user = users[index];
//                   return UserGridItem(
//                     onTapEditProfile: () {
//                       AutoTabsRouter.of(context).setActiveIndex(4);
//                     },
//                     isCurrentUser: false,
//                     users: user!,
//                   ).animate().shake();
//                 },
//               ),
//             );
//           },
//         );
//       },
//       loading: () => const Center(child: CircularProgressIndicator()),
//       error: (e, _) => Center(child: Text('Error: $e')),
//     );
//   }
// }

import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:location_picker_flutter_map/location_picker_flutter_map.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wings_dating_app/repo/profile_repo.dart';
import 'package:wings_dating_app/src/users/widget/user_grid_item.dart';

import '../../model/user_models.dart';
part 'search_users_view.g.dart';

// ------------------- RIVERPOD PROVIDERS -------------------

@riverpod
class SearchUser extends _$SearchUser {
  PickedData? _pickedData;

  // Called automatically when the provider is initialized or refreshed
  @override
  FutureOr<List<UserModel?>?> build() async {
    // We can expose the picked data directly through a getter for widgets to watch
    // or keep it internal and let the build method handle the logic.
    // For this scenario, exposing a getter makes the conditional rendering easier.
    if (_pickedData == null) return null;

    final geoPoint = GeoPoint(
      _pickedData!.latLong.latitude,
      _pickedData!.latLong.longitude,
    );

    return ref.read(profileRepoProvider).getUserListBySearch(geoPoint: geoPoint);
  }

  // Expose a getter to allow widgets to watch the picked data state
  // ignore: avoid_public_notifier_properties
  PickedData? get pickedData => _pickedData;

  void setPickedData(PickedData? data) {
    _pickedData = data;
    // Triggers the provider to rebuild using the new picked data
    ref.invalidateSelf(); // Equivalent to notifyListeners()
  }
}

@RoutePage()
class SearchUsersView extends ConsumerWidget {
  const SearchUsersView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the pickedData getter from the SearchUser provider
    final pickedData = ref.watch(searchUserProvider.notifier).pickedData;

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
                ref.read(searchUserProvider.notifier).setPickedData(picked);
                print("Picked address: ${picked.address}"); // Enhanced print
              },
            ),
          ),
          // Conditionally render based on the watched pickedData
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
    final userListAsync = ref.watch(searchUserProvider);

    return userListAsync.when(
      data: (users) {
        if (users == null || users.isEmpty) {
          return const Center(child: Text('No users found.'));
        }
        return ResponsiveBuilder(
          builder: (context, sizingInformation) {
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
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  return UserGridItem(
                    userCoordinates: GeoPoint(
                      ref.read(searchUserProvider.notifier).pickedData!.latLong.latitude,
                      ref.read(searchUserProvider.notifier).pickedData!.latLong.longitude,
                    ),
                    onTapEditProfile: () {
                      AutoTabsRouter.of(context).setActiveIndex(4);
                    },
                    isCurrentUser: false,
                    users: user!,
                  ).animate().shake();
                },
              ),
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Error: $e')),
    );
  }
}
