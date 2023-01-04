import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:image_picker/image_picker.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:wings_dating_app/src/profile/controller/profile_controller.dart';
import 'package:wings_dating_app/src/profile/edit_profile_view.dart';

import '../../dependency/dependenies.dart';
import '../../helpers/extra_data.dart';
import '../../helpers/logger.dart';

class AddAdditionalInformationView extends ConsumerStatefulWidget {
  const AddAdditionalInformationView({super.key});

  @override
  ConsumerState<AddAdditionalInformationView> createState() =>
      _AddAdditionalInformationViewState();
}

class _AddAdditionalInformationViewState
    extends ConsumerState<AddAdditionalInformationView> {
  @override
  Widget build(
    BuildContext context,
  ) {
    final prfile = ref.watch(Dependency.profileProvider);
    final profiledata =
        ref.read(ProfileController.userControllerProvider).userModel;
    final role = ref.watch(roleProvider);
    final bodyType = ref.watch(bodyTypeProvider);

    final relationshipStatus = ref.watch(relationshipStatusProvider);
    final ethnicity = ref.watch(ethnicityProvider);
    final lookingFor = ref.watch(lookingForProvider);
    final whereTomeet = ref.watch(whereToMeetProvider);

    logger.i(profiledata?.role.index);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.medium(
              title: const Text("Additional Information"), floating: false),
          SliverToBoxAdapter(
            child: StaggeredGrid.count(
              crossAxisCount: 4,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              children: const [
                StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 2,
                  child: AlbumWidgetPicker(
                    index: 0,
                  ),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 1,
                  child: AlbumWidgetPicker(
                    index: 1,
                    // path: ,
                  ),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 1,
                  mainAxisCellCount: 1,
                  child: AlbumWidgetPicker(
                    index: 2,
                  ),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 1,
                  mainAxisCellCount: 1,
                  child: AlbumWidgetPicker(
                    index: 3,
                  ),
                ),
                // StaggeredGridTile.count(
                //   crossAxisCellCount: 4,
                //   mainAxisCellCount: 2,
                //   child: Text("hello"),
                // ),
              ],
            ),
          ),
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
                  20.heightBox,
                  ElevatedButton(
                    onPressed: () async {
                      final data = profiledata?.copyWith(
                        bodyType: bodyType,
                        lookingFor: lookingFor,
                        ethnicity: ethnicity,
                        relationshipStatus: relationshipStatus,
                        whereToMeet: whereTomeet,
                        role: role,
                      );

                      logger.i(data?.toJson());
                      await ref
                          .read(ProfileController.userControllerProvider)
                          .updateUserData(data!);
                    },
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(MediaQuery.of(context).size.width, 35)),
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
              final role = ref.watch(roleProvider);
              return SizedBox(
                  height: 200,
                  child: AdditionalDataWidget<Role>(
                    selected: role,
                    onChanged: <Role>(value) {
                      logger.i(value);
                      ref.read(roleProvider.notifier).update((state) => value);
                      context.router.pop();
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
              final bodyType = ref.watch(bodyTypeProvider);
              return SizedBox(
                  height: 200,
                  child: AdditionalDataWidget<BodyType>(
                    selected: bodyType,
                    onChanged: <BodyType>(value) {
                      logger.i(value);
                      ref
                          .read(bodyTypeProvider.notifier)
                          .update((sate) => value);
                      context.router.pop();
                    },
                    value: BodyType.values,
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
              final relationShip = ref.watch(relationshipStatusProvider);
              return SizedBox(
                  height: 200,
                  child: AdditionalDataWidget<RelationshipStatus>(
                    selected: relationShip,
                    onChanged: <BodyType>(value) {
                      logger.i(value);
                      ref.read(relationshipStatusProvider.notifier).state =
                          value;

                      setState(() {});
                      context.router.pop();
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
              final ethnicity = ref.watch(ethnicityProvider);
              return SizedBox(
                  height: 200,
                  child: AdditionalDataWidget<Ethnicity>(
                    selected: ethnicity,
                    onChanged: <BodyType>(value) {
                      logger.i(value);
                      ref
                          .read(ethnicityProvider.notifier)
                          .update((state) => value);

                      context.router.pop();
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
              return SizedBox(
                  height: 200,
                  child: AdditionalDataWidget<LookingFor>(
                    selected: lookingFor,
                    onChanged: <BodyType>(value) {
                      logger.i(value);
                      ref
                          .read(lookingForProvider.notifier)
                          .update((sate) => value);
                      context.router.pop();
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
              return SizedBox(
                  height: 200,
                  child: AdditionalDataWidget<WhereToMeet>(
                    selected: whereToMeet,
                    onChanged: <BodyType>(value) {
                      logger.i(value);
                      ref
                          .read(whereToMeetProvider.notifier)
                          .update((sate) => value);
                      context.router.pop();
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
    Key? key,
    required this.value,
    required this.onChanged,
    required this.selected,
  }) : super(key: key);

  final List<TValue> value;
  final Function(TValue?) onChanged;

  final TValue selected;

  @override
  State<AdditionalDataWidget> createState() => _AdditionalDataWidgetState();
}

class _AdditionalDataWidgetState extends State<AdditionalDataWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      itemExtent: 50,
      children: List.generate(
        Role.values.length,
        (index) => ListWheelItemWidget(
            onTap: () async {
              print("tapped");
              widget.onChanged(widget.value[index]);
            },
            color: widget.selected == widget.value[index]
                ? Theme.of(context).primaryColor
                : Theme.of(context).primaryColor.withOpacity(0.2),
            role: "${widget.value[index].value}"),
      ),
    );
  }
}

class ListWheelItemWidget extends StatelessWidget {
  const ListWheelItemWidget({
    Key? key,
    required this.role,
    this.onTap,
    required this.color,
  }) : super(key: key);

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

class AlbumWidgetPicker extends ConsumerWidget {
  const AlbumWidgetPicker({
    Key? key,
    this.path,
    required this.index,
  }) : super(key: key);

  final String? path;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userController = ref.watch(ProfileController.userControllerProvider);
    return InkWell(
      onTap: () async {
        await showModalBottomSheet(
          context: context,
          builder: (context) {
            return BottomSheet(
              onClosing: () {
                Navigator.pop(context);
              },
              builder: (context) {
                return ImagePickerWidget(
                  camera: () async {
                    await ref
                        .read(ProfileController.userControllerProvider)
                        .pickImageFromAlbum(
                          index,
                          ImageSource.camera,
                        );
                  },
                  gallery: () async {
                    await ref
                        .read(ProfileController.userControllerProvider)
                        .pickImageFromAlbum(
                          index,
                          ImageSource.gallery,
                        );
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
        child: userController.albumImages.isEmpty
            ? const Icon(Icons.add)
            : userController.albumImages[index].isEmpty
                ? Image(
                    image: FileImage(File(userController.albumImages[index])),
                    fit: BoxFit.cover,
                  )
                : const Icon(Icons.add),
      ),
    );
  }
}
