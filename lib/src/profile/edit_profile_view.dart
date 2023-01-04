// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:geoflutterfire2/geoflutterfire2.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:wings_dating_app/dependency/dependenies.dart';
import 'package:wings_dating_app/helpers/helpers.dart';
import 'package:wings_dating_app/routes/app_router.dart';
// / / /  / / import 'package:wings_dating_app/src/model/geo_point.dart';
import 'package:wings_dating_app/src/model/user_models.dart';
import 'package:wings_dating_app/src/profile/controller/profile_controller.dart';

import '../model/geo_point_data.dart';
import '../model/user_basic_model.dart';

final roleProvider = StateProvider<Role>((ref) {
  final userdata = ref.read(ProfileController.userControllerProvider).userModel;
  return userdata!.role;
});

final bodyTypeProvider = StateProvider<BodyType>((ref) {
  final userdata = ref.read(ProfileController.userControllerProvider).userModel;
  return userdata!.bodyType;
});

final relationshipStatusProvider = StateProvider<RelationshipStatus>((ref) {
  final userdata = ref.read(ProfileController.userControllerProvider).userModel;
  return userdata!.relationshipStatus;
});

final ethnicityProvider = StateProvider<Ethnicity>((ref) {
  final userdata = ref.read(ProfileController.userControllerProvider).userModel;
  return userdata!.ethnicity;
});
final lookingForProvider = StateProvider<LookingFor>((ref) {
  final userdata = ref.read(ProfileController.userControllerProvider).userModel;
  return userdata!.lookingFor ?? LookingFor.doNotShow;
});

final whereToMeetProvider = StateProvider<WhereToMeet>((ref) {
  final userdata = ref.read(ProfileController.userControllerProvider).userModel;
  return userdata!.whereToMeet ?? WhereToMeet.doNotShow;
});

class EditProfileView extends ConsumerStatefulWidget {
  const EditProfileView({
    super.key,
    required this.isEditProfile,
  });

  final bool isEditProfile;

  @override
  ConsumerState<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends ConsumerState<EditProfileView> {
  late TextEditingController _usernameController;
  late TextEditingController _nicknameController;
  // TextEditingController _phoneController ;
  late TextEditingController _dobController;
  late TextEditingController _bioController;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Location location = Location();
  final geo = GeoFlutterFire();

  @override
  void initState() {
    if (widget.isEditProfile) {
      final userdata =
          ref.read(ProfileController.userControllerProvider).userModel;

      logger.i(userdata);
      _nicknameController = TextEditingController(
        text: userdata?.nickname,
      );
      _nicknameController =
          TextEditingController(text: userdata?.nickname ?? "");
// _phoneController = TextEditingController();
      _dobController = TextEditingController(
        text: userdata?.birthday,
      );
      _bioController = TextEditingController(
        text: userdata?.aboutMe,
      );
    } else {
      _usernameController = TextEditingController();
      _nicknameController = TextEditingController();
// _phoneController = TextEditingController();
      _dobController = TextEditingController();
      _bioController = TextEditingController();
    }

    super.initState();

    ref.read(Dependency.profileProvider).checkUserDocExist();
  }

  @override
  void didChangeDependencies() async {
    if (await location.serviceEnabled()) {
      if (await location.hasPermission() == PermissionStatus.granted) {
        logger.i('Permission granted');
      } else {
        location.requestPermission();
      }
    } else {
      location.requestService();
    }

    super.didChangeDependencies();
  }

  DateTime? _selectedDate;
  @override
  void dispose() {
    _usernameController.dispose();
    _nicknameController.dispose();
    // _phoneController.dispose();
    _dobController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final profile = ref.watch(ProfileController.userControllerProvider);
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.isEditProfile ? "Edit Profile" : "Save Profile"),
      // ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar.medium(
            title: Text(widget.isEditProfile ? "Edit Profile" : "Save Profile"),
          ),
          SliverToBoxAdapter(
            child: Form(
              key: _formKey,
              // autovalidateMode: AutovalidateMode.onUserInteraction,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    profile.profileImage != null
                        ? CircleAvatar(
                            radius: 35,
                            backgroundImage: FileImage(
                              File(profile.profileImage!),
                            ),
                          )
                        : const CircleAvatar(
                            radius: 35,
                          ),
                    const SizedBox(
                      height: 20,
                    ),
                    Builder(builder: (context) {
                      return ElevatedButton(
                        onPressed: () async {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return BottomSheet(onClosing: () {
                                  Navigator.pop(context);
                                }, builder: (context) {
                                  return ImagePickerWidget(
                                    camera: () async {
                                      await ref
                                          .read(ProfileController
                                              .userControllerProvider)
                                          .pickImage(
                                              imageSource: ImageSource.camera);
                                    },
                                    gallery: () async {
                                      await ref
                                          .read(ProfileController
                                              .userControllerProvider)
                                          .pickImage(
                                              imageSource: ImageSource.gallery);
                                    },
                                  );
                                });
                              });
                        },
                        child: Text(widget.isEditProfile
                            ? "Change Profile Picture"
                            : "Upload Profile Picture"),
                      );
                    }),
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter a nickname";
                        } else {
                          return null;
                        }
                      },
                      controller: _nicknameController,
                      decoration: const InputDecoration(
                        isDense: true,
                        hintText: "Nickname",
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      validator: ((value) {
                        if (value!.isEmpty) {
                          return "Please enter a nickname";
                        } else {
                          return null;
                        }
                      }),
                      controller: _dobController,
                      decoration: const InputDecoration(
                        isDense: true,
                        hintText: "Date of Birth",
                      ),
                      readOnly: true,
                      onTap: () async {
                        showDatePicker(
                          context: context,
                          initialDate: DateTime(2004),
                          firstDate: DateTime(1960),
                          lastDate: DateTime(2004),
                        ).then((value) {
                          logger.i(value);

                          _dobController.text = DateFormat.yMd().format(value!);

                          _selectedDate = value;
                          setState(() {});
                        });
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter a nickname";
                        } else {
                          return null;
                        }
                      },
                      maxLines: 2,
                      controller: _bioController,
                      decoration: const InputDecoration(
                        isDense: true,
                        hintText: "bio",
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton.icon(
                          icon: const Icon(Icons.add),
                          onPressed: () async {
                            context.router
                                .push(const AddAdditionalInformationRoute());
                          },
                          label: const Text("Add Additional Information")),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeInOut,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            if (widget.isEditProfile) {
                              UserModel? user = profile.userModel?.copyWith(
                                position: profile.userModel!.position,
                                nickname: _nicknameController.text,
                                aboutMe: _bioController.text,
                                avatarUrl: await ref
                                    .read(ProfileController
                                        .userControllerProvider)
                                    .uploadImage(),
                                birthday: _dobController.text,
                              );
                              logger.i(user?.toJson());
                              await ref
                                  .read(Dependency.profileProvider)
                                  .updateUserDoc(user!);
                            } else {
                              final data = await location.getLocation();

                              int age = calculateAge(_selectedDate!);
                              GeoFirePoint myLocation = geo.point(
                                  latitude: 12.960632, longitude: 77.641603);

                              UserModel user = UserModel(
                                nickname: "udesh",

                                aboutMe: _bioController.text,
                                age: age,
                                avatarUrl: await ref
                                    .read(ProfileController
                                        .userControllerProvider)
                                    .uploadImage(),
                                birthday: _dobController.text,
                                // userBasicModel: UserBasicModel(
                                //   dob: _dobController.text,
                                // ),
                              );

                              logger.w(user.position?.toJson());
                              await ref
                                  .read(Dependency.profileProvider)
                                  .createUserDoc(user);

                              await ref
                                  .read(Dependency.profileProvider)
                                  .addLocation(GeoPointData(
                                      geopoint: myLocation.geoPoint,
                                      geohash: myLocation.hash));
                            }
                          }
                        },
                        child: Text(widget.isEditProfile ? "Update" : "Save"),
                      ),
                    ),
                  ],
                ).p16(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ImagePickerWidget extends StatelessWidget {
  const ImagePickerWidget({
    Key? key,
    required this.camera,
    required this.gallery,
  }) : super(key: key);

  final VoidCallback camera;
  final VoidCallback gallery;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ListTile(
            leading: const Icon(Icons.camera),
            title: const Text("Camera"),
            onTap: camera,
          ),
          ListTile(
            leading: const Icon(Icons.photo),
            title: const Text("Gallery"),
            onTap: gallery,
          ),
        ],
      ),
    );
  }
}

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
