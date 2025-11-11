// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:velocity_x/velocity_x.dart';
import 'package:wings_dating_app/helpers/send_notification.dart';
import 'package:wings_dating_app/src/model/geo_point_data.dart';

import 'package:wings_dating_app/src/profile/controller/profile_controller.dart';
import 'package:wings_dating_app/src/profile/edit_profile_view.dart';

import '../../dependency/dependencies.dart';
import '../../helpers/extra_data.dart';
import '../../helpers/logger.dart';

final weightProvider = StateProvider.autoDispose<String>((ref) {
  return "Do not show";
});

final heightProvider = StateProvider.autoDispose<String>((ref) {
  return "Do not show";
});

final albumListProvider = StateProvider.autoDispose<List<String>?>((ref) {
  return [];
});

@RoutePage()
class AddAdditionalInformationView extends ConsumerStatefulWidget {
  const AddAdditionalInformationView({super.key});

  @override
  ConsumerState<AddAdditionalInformationView> createState() => _AddAdditionalInformationViewState();
}

class _AddAdditionalInformationViewState extends ConsumerState<AddAdditionalInformationView> {
  @override
  Widget build(
    BuildContext context,
  ) {
    ref.watch(Dependency.profileProvider);
    final profiledata = ref.read(ProfileController.userControllerProvider).userModel;

    // Safely watch providers with null checks
    Role role;
    BodyType bodyType;
    RelationshipStatus relationshipStatus;
    Ethnicity ethnicity;
    LookingFor lookingFor;
    WhereToMeet whereTomeet;
    String weight;
    String height;

    try {
      role = ref.watch(roleProvider);
      bodyType = ref.watch(bodyTypeProvider);
      relationshipStatus = ref.watch(relationshipStatusProvider);
      ethnicity = ref.watch(ethnicityProvider);
      lookingFor = ref.watch(lookingForProvider);
      whereTomeet = ref.watch(whereToMeetProvider);
      weight = ref.watch(weightProvider);
      height = ref.watch(heightProvider);
      ref.watch(albumListProvider);
    } catch (e) {
      logger.e("Error accessing providers: $e");
      // Set default values if providers can't be accessed
      role = Role.doNotShow;
      bodyType = BodyType.doNotShow;
      relationshipStatus = RelationshipStatus.doNotShow;
      ethnicity = Ethnicity.doNotShow;
      lookingFor = LookingFor.doNotShow;
      whereTomeet = WhereToMeet.doNotShow;
      weight = "Do not show";
      height = "Do not show";
    }

    if (profiledata != null) {
      logger.i(profiledata.role.index);
    }
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.medium(title: const Text("Additional Information"), floating: false),
          // SliverToBoxAdapter(
          //   child: StaggeredGrid.count(
          //     crossAxisCount: 4,
          //     mainAxisSpacing: 4,
          //     crossAxisSpacing: 4,
          //     children: [
          //       StaggeredGridTile.count(
          //         crossAxisCellCount: 2,
          //         mainAxisCellCount: 2,
          //         child: AlbumWidgetPicker(
          //           index: 0,
          //           path: albumList?[0],
          //         ),
          //       ),
          //       StaggeredGridTile.count(
          //         crossAxisCellCount: 2,
          //         mainAxisCellCount: 1,
          //         child: AlbumWidgetPicker(
          //           index: 1,
          //           path: albumList?[1] ?? "",
          //           // path: ,
          //         ),
          //       ),
          //       StaggeredGridTile.count(
          //         crossAxisCellCount: 1,
          //         mainAxisCellCount: 1,
          //         child: AlbumWidgetPicker(
          //           index: 2,
          //           path: albumList?[2],
          //         ),
          //       ),
          //       StaggeredGridTile.count(
          //         crossAxisCellCount: 1,
          //         mainAxisCellCount: 1,
          //         child: AlbumWidgetPicker(
          //           index: 3,
          //           path: albumList?[3],
          //         ),
          //       ),
          //       // StaggeredGridTile.count(
          //       //   crossAxisCellCount: 4,
          //       //   mainAxisCellCount: 2,
          //       //   child: Text("hello"),
          //       // ),
          //     ],
          //   ),
          // ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  const Divider(),
                  ListTile(
                    selected: true,
                    style: ListTileStyle.list,
                    onTap: () {
                      _showRole(context);
                    },
                    title: const Text("Role"),
                    subtitle: Text(role.value),
                    enabled: true,
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                  const Divider(),
                  ListTile(
                    selected: true,
                    style: ListTileStyle.list,
                    onTap: () {
                      _showBodyType(context);
                    },
                    title: const Text("Body Type"),
                    subtitle: Text(bodyType.value),
                    enabled: true,
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                  const Divider(),
                  ListTile(
                    selected: true,
                    style: ListTileStyle.list,
                    onTap: () {
                      _showRelationshipStatus(context);
                    },
                    title: const Text("RelationShip Status"),
                    subtitle: Text(relationshipStatus.value),
                    enabled: true,
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                  const Divider(),
                  ListTile(
                    selected: true,
                    style: ListTileStyle.list,
                    onTap: () {
                      _showEthnicityStatus(context);
                    },
                    title: const Text("Ethnicity"),
                    subtitle: Text(ethnicity.value),
                    enabled: true,
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                  const Divider(),
                  ListTile(
                    selected: true,
                    style: ListTileStyle.list,
                    onTap: () {
                      _showLookingForStatus(context);
                    },
                    title: const Text("Looking For"),
                    subtitle: Text(lookingFor.value),
                    enabled: true,
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                  const Divider(),
                  ListTile(
                    selected: true,
                    style: ListTileStyle.list,
                    onTap: () {
                      _showWhereToMeetStatus(context);
                    },
                    title: const Text("Where To Meet"),
                    subtitle: Text(whereTomeet.value),
                    enabled: true,
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                  const Divider(),
                  ListTile(
                    selected: true,
                    style: ListTileStyle.list,
                    onTap: () {
                      _showHeight(context);
                    },
                    title: const Text("Height"),
                    subtitle: Text(height),
                    enabled: true,
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                  const Divider(),
                  ListTile(
                    selected: true,
                    style: ListTileStyle.list,
                    onTap: () {
                      _showWeight(context);
                    },
                    title: const Text("Weight"),
                    subtitle: Text(weight),
                    enabled: true,
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                  const Divider(),
                  // 20.heightBox,
                  SizedBox(height: 20),

                  ElevatedButton(
                    onPressed: () async {
                      final data = profiledata?.copyWith(
                        bodyType: bodyType,
                        lookingFor: lookingFor,
                        ethnicity: ethnicity,
                        relationshipStatus: relationshipStatus,
                        whereToMeet: whereTomeet,
                        role: role,
                        height: height,
                        weight: weight,
                      );

                      logger.i(data?.toJson());
                      await ref.read(ProfileController.userControllerProvider).updateUserData(data!);
                      AutoRouter.of(context).pop();

                      // router.replace(const DashboardRoute());
                    },
                    style: ElevatedButton.styleFrom(fixedSize: Size(MediaQuery.of(context).size.width, 35)),
                    child: const Text("Save"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showRole(context) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        builder: (BuildContext bc) {
          return StatefulBuilder(builder: (context, setState) {
            return Consumer(builder: (context, ref, child) {
              final profiledata = ref.read(ProfileController.userControllerProvider).userModel;

              final role = ref.watch(roleProvider);
              return SizedBox(
                  height: 200,
                  child: AdditionalDataWidget<Role>(
                    selected: role,
                    onChanged: (value) async {
                      logger.i(value);
                      ref.read(roleProvider.notifier).update(value!);
                      // context.router.back();
                      final data = profiledata?.copyWith(
                        role: value,
                      );
                      await ref.read(ProfileController.userControllerProvider).updateUserData(data!);
                    },
                    value: Role.values,
                  ));
            });
          });
        });
  }

  void _showBodyType(context) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        builder: (BuildContext bc) {
          return StatefulBuilder(builder: (context, setState) {
            return Consumer(builder: (context, ref, child) {
              final profiledata = ref.read(ProfileController.userControllerProvider).userModel;

              final bodyType = ref.watch(bodyTypeProvider);
              return SizedBox(
                  height: 200,
                  child: AdditionalDataWidget<BodyType>(
                    selected: bodyType,
                    onChanged: (value) async {
                      logger.i(value);
                      ref.read(bodyTypeProvider.notifier).update(value!);
                      // context.router.back();
                      final data = profiledata?.copyWith(
                        bodyType: value,
                        position: GeoPointData(
                          type: "Point",
                          geopoint: profiledata.position?.geopoint ?? [0, 0],
                        ),
                      );
                      await ref.read(ProfileController.userControllerProvider).updateUserData(data!);
                    },
                    value: BodyType.values,
                  ));
            });
          });
        });
  }

  void _showWeight(context) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        builder: (BuildContext bc) {
          return StatefulBuilder(builder: (context, setState) {
            final profiledata = ref.read(ProfileController.userControllerProvider).userModel;

            return Consumer(builder: (context, ref, child) {
              final weight = ref.watch(weightProvider);
              return SizedBox(
                  height: 200,
                  child: AdditionalDataWidget<String>(
                    isString: true,
                    selected: weight,
                    onChanged: <String>(value) async {
                      logger.i(value);
                      ref.read(weightProvider.notifier).update((sate) => value);

                      final data = profiledata?.copyWith(
                        weight: weight,
                      );
                      await ref.read(ProfileController.userControllerProvider).updateUserData(data!);
                    },
                    value: weightList,
                  ));
            });
          });
        });
  }

  void _showHeight(context) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        builder: (BuildContext bc) {
          return StatefulBuilder(builder: (context, setState) {
            return Consumer(builder: (context, ref, child) {
              final profiledata = ref.read(ProfileController.userControllerProvider).userModel;

              final height = ref.watch(heightProvider);
              return SizedBox(
                  height: 200,
                  child: AdditionalDataWidget<String>(
                    isString: true,
                    selected: height,
                    onChanged: <String>(value) async {
                      logger.i(value);
                      ref.read(heightProvider.notifier).update((sate) => value);
                      // context.router.back();
                      final data = profiledata?.copyWith(
                        height: height,
                      );
                      await ref.read(ProfileController.userControllerProvider).updateUserData(data!);
                    },
                    value: heightList,
                  ));
            });
          });
        });
  }

  void _showRelationshipStatus(context) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        builder: (BuildContext bc) {
          return StatefulBuilder(builder: (context, setState) {
            return Consumer(builder: (context, ref, child) {
              final profiledata = ref.read(ProfileController.userControllerProvider).userModel;

              final relationShip = ref.watch(relationshipStatusProvider);
              return SizedBox(
                  height: 200,
                  child: AdditionalDataWidget<RelationshipStatus>(
                    selected: relationShip,
                    onChanged: (value) async {
                      logger.i(value);
                      ref.read(relationshipStatusProvider.notifier).update(value!);

                      setState(() {});
                      final data = profiledata?.copyWith(
                        relationshipStatus: value,
                      );
                      await ref.read(ProfileController.userControllerProvider).updateUserData(data!);

                      // context.router.back();
                    },
                    value: RelationshipStatus.values,
                  ));
            });
          });
        });
  }

  void _showEthnicityStatus(context) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        builder: (BuildContext bc) {
          return StatefulBuilder(builder: (context, setState) {
            return Consumer(builder: (context, ref, child) {
              final profiledata = ref.read(ProfileController.userControllerProvider).userModel;

              final ethnicity = ref.watch(ethnicityProvider);
              return SizedBox(
                  height: 200,
                  child: AdditionalDataWidget<Ethnicity>(
                    selected: ethnicity,
                    onChanged: (value) async {
                      logger.i(value);
                      ref.read(ethnicityProvider.notifier).update(value!);

                      // context.router.back();
                      final data = profiledata?.copyWith(
                        ethnicity: value,
                      );
                      await ref.read(ProfileController.userControllerProvider).updateUserData(data!);
                    },
                    value: Ethnicity.values,
                  ));
            });
          });
        });
  }

  void _showLookingForStatus(context) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        builder: (BuildContext bc) {
          return StatefulBuilder(builder: (context, setState) {
            return Consumer(builder: (context, ref, child) {
              final lookingFor = ref.watch(lookingForProvider);
              final profiledata = ref.read(ProfileController.userControllerProvider).userModel;

              return SizedBox(
                  height: 200,
                  child: AdditionalDataWidget<LookingFor>(
                    selected: lookingFor,
                    onChanged: (value) async {
                      logger.i(value);
                      ref.read(lookingForProvider.notifier).update(value!);
                      context.router.back();

                      final data = profiledata?.copyWith(
                        lookingFor: value,
                      );
                      await ref.read(ProfileController.userControllerProvider).updateUserData(data!);
                    },
                    value: LookingFor.values,
                  ));
            });
          });
        });
  }

  void _showWhereToMeetStatus(context) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        builder: (BuildContext bc) {
          return StatefulBuilder(builder: (context, setState) {
            return Consumer(builder: (context, ref, child) {
              final whereToMeet = ref.watch(whereToMeetProvider);
              final profiledata = ref.read(ProfileController.userControllerProvider).userModel;

              return SizedBox(
                  height: 200,
                  child: AdditionalDataWidget<WhereToMeet>(
                    selected: whereToMeet,
                    onChanged: (value) async {
                      logger.i(value);
                      ref.read(whereToMeetProvider.notifier).update(value!);
                      // context.router.back();
                      final data = profiledata?.copyWith(
                        whereToMeet: value,
                      );
                      await ref.read(ProfileController.userControllerProvider).updateUserData(data!);
                    },
                    value: WhereToMeet.values,
                  ));
            });
          });
        });
  }
}

class AdditionalDataWidget<TValue> extends StatefulWidget {
  const AdditionalDataWidget({
    super.key,
    required this.value,
    required this.onChanged,
    required this.selected,
    this.isString = false,
  });

  final List<TValue> value;
  final Function(TValue?) onChanged;

  final TValue selected;
  final bool? isString;

  @override
  State<AdditionalDataWidget> createState() => _AdditionalDataWidgetState();
}

class _AdditionalDataWidgetState extends State<AdditionalDataWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      itemExtent: 50,
      children: List.generate(
        widget.value.length,
        (index) => ListWheelItemWidget(
          onTap: () async {
            print("tapped");
            await widget.onChanged(widget.value[index]);
            // ignore: use_build_context_synchronously
            context.router.maybePop();
          },
          color: widget.selected == widget.value[index]
              ? Theme.of(context).primaryColor
              : Theme.of(context).primaryColor.withOpacity(0.2),
          role: widget.isString! ? widget.value[index] : "${widget.value[index].value}",
        ),
      ),
    );
  }
}

class ListWheelItemWidget extends StatelessWidget {
  const ListWheelItemWidget({
    super.key,
    required this.role,
    this.onTap,
    required this.color,
  });

  final String role;
  final void Function()? onTap;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: color,
        width: MediaQuery.of(context).size.width,
        height: 30,
        child: Center(
          child: Text(role),
        ),
      ),
    );
  }
}

class AlbumWidgetPicker extends ConsumerStatefulWidget {
  const AlbumWidgetPicker({
    super.key,
    this.path,
    required this.index,
  });

  final String? path;
  final int index;

  @override
  ConsumerState<AlbumWidgetPicker> createState() => _AlbumWidgetPickerState();
}

class _AlbumWidgetPickerState extends ConsumerState<AlbumWidgetPicker> {
  // final int index;
  @override
  Widget build(BuildContext context) {
    ref.watch(ProfileController.userControllerProvider);
    // final albumList = ref.watch(albumListProvider);

    return InkWell(
      onTap: () async {
        await showModalBottomSheet(
          context: context,
          builder: (context) {
            return BottomSheet(
              onClosing: () {
                // Navigator.pop(context);
              },
              builder: (context) {
                return ImagePickerWidget(
                  camera: () async {
                    final data = await ref.read(ProfileController.userControllerProvider).pickImageFromAlbum(
                          ImageSource.camera,
                        );

                    if (data != null) {
// albumList.update((state) => state[widget.index] = data);

                      // albumList[widget.index] = data;
                      setState(() {});
                    }
                  },
                  gallery: () async {
                    final data = await ref.read(ProfileController.userControllerProvider).pickImageFromAlbum(
                          ImageSource.gallery,
                        );

                    if (data != null) {
                      // albumList[widget.index] = data;
                      setState(() {});
                    }
                  },
                );
              },
            );
          },
        );
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 1.5,
            color: Theme.of(context).primaryColor.withOpacity(0.5),
          ),
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        // child: albumList!.isEmpty
        //     ? const Icon(Icons.add)
        //     : userController.albumImages.isEmpty
        //         ? Image(
        //             image: FileImage(
        //               File(
        //                 userController.albumImages[widget.index],
        //               ),
        //             ),
        //             fit: BoxFit.cover,
        //           )
        //         : const Icon(Icons.add),
      ),
    );
  }
}
