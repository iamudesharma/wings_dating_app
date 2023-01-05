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
  // late TextEditingController _nicknameController;
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

      _usernameController =
          TextEditingController(text: userdata?.username ?? "");
// _phoneController = TextEditingController();
      _dobController = TextEditingController(
        text: userdata?.birthday,
      );
      _bioController = TextEditingController(
        text: userdata?.bio,
      );
    } else {
      _usernameController = TextEditingController();
      // _nicknameController = TextEditingController();
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
    // _nicknameController.dispose();
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
                          return "Please enter a Username";
                        } else {
                          return null;
                        }
                      },
                      controller: _usernameController,
                      decoration: const InputDecoration(
                        isDense: true,
                        hintText: "Username",
                      ),
                    ),
                    const SizedBox(
                      height: 20,
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
                    widget.isEditProfile
                        ? Align(
                            alignment: Alignment.centerLeft,
                            child: TextButton.icon(
                                icon: const Icon(Icons.add),
                                onPressed: () async {
                                  context.router.push(
                                      const AddAdditionalInformationRoute());
                                },
                                label:
                                    const Text("Add Additional Information")),
                          )
                        : const SizedBox.shrink(),
                    const SizedBox(
                      height: 20,
                    ),
                    AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeInOut,
                      child: ElevatedButton(
                        onPressed: () async {
                          int age = calculateAge(_selectedDate!);
                          GeoFirePoint myLocation = geo.point(
                              latitude: 12.960632, longitude: 77.641603);

                          final route = AutoRouter.of(context);
                          if (_formKey.currentState!.validate()) {
                            if (widget.isEditProfile) {
                              UserModel? user = profile.userModel?.copyWith(
                                position: myLocation.data,
                                bio: _bioController.text,
                                username: _usernameController.text,
                                profileUrl: await ref
                                    .read(ProfileController
                                        .userControllerProvider)
                                    .uploadImage(),
                                birthday: _dobController.text,
                              );
                              logger.i(user?.toJson());
                              await ref
                                  .read(Dependency.profileProvider)
                                  .updateUserDoc(user!);

                              route.pop();
                            } else {
                              final data = await location.getLocation();

                              int age = calculateAge(_selectedDate!);
                              GeoFirePoint myLocation = geo.point(
                                  latitude: 12.960632, longitude: 77.641603);

                              UserModel user = UserModel(
                                username: _usernameController.text,
                                bio: _bioController.text,
                                age: age,
                                position: myLocation.data,
                                profileUrl: await ref
                                    .read(ProfileController
                                        .userControllerProvider)
                                    .uploadImage(),
                                birthday: _dobController.text,
                                userBasicModel: UserBasicModel(
                                    dob: _dobController.text,
                                    height: "5.7",
                                    lived: "New Delhi",
                                    weight: "80 kg"),
                              );

                              logger.w(myLocation.data);
                              logger.w(user.toJson());

                              await ref
                                  .read(Dependency.profileProvider)
                                  .createUserDoc(user);

                              route.replace(DashboardRoute());
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
