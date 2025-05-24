// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';
// import 'dart:js';
import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:connectycube_sdk/connectycube_sdk.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geoflutterfire_plus/geoflutterfire_plus.dart';
// import 'package:geoflutterfire2/geoflutterfire2.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
// import 'package:location/location.dart';
// import 'package:velocity_x/velocity_x.dart';
import 'package:wings_dating_app/const/pref_util.dart';

import 'package:wings_dating_app/dependency/dependencies.dart';
import 'package:wings_dating_app/helpers/app_notification.dart';
import 'package:wings_dating_app/helpers/helpers.dart';
import 'package:wings_dating_app/repo/profile_repo.dart';
import 'package:wings_dating_app/routes/app_router.dart';
import 'package:wings_dating_app/routes/app_router_provider.dart';
// / / /  / / import 'package:wings_dating_app/src/model/geo_point.dart';
import 'package:wings_dating_app/src/model/user_models.dart';
import 'package:wings_dating_app/src/profile/controller/profile_controller.dart';
import 'package:wings_dating_app/src/profile/profile_view.dart';

import '../../helpers/responsive_layout.dart';
import '../model/geo_point_data.dart';

@RoutePage()
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
  bool _loading = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Geolocator location = Geolocator();
  bool isImageUpdate = false;
  // final geo = GeoFlutterFire();

  @override
  void initState() {
    if (widget.isEditProfile) {
      final userdata = ref.read(ProfileController.userControllerProvider).userModel;

      logger.i(userdata);

      _usernameController = TextEditingController(text: userdata?.username ?? "");
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
  }

  @override
  void didChangeDependencies() async {
    if (await Geolocator.isLocationServiceEnabled()) {
      Geolocator.requestPermission();
      // if (await Geolocator.checkPermission() == LocationPermission.) {
      //   logger.i('Permission granted');
      // } else {
      //   location.requestPermission();
      // }
    } else {
      Geolocator.requestPermission();
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
          SliverToBoxAdapter(
            child: AppBar(
              title: Text(widget.isEditProfile ? "Edit Profile" : "Save Profile"),
            ),
          ),
          SliverToBoxAdapter(
            child: Form(
              key: _formKey,
              // autovalidateMode: AutovalidateMode.onUserInteraction,
              child: ResponsiveLayout(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        profile.profileImage != null
                            ? kIsWeb
                                ? CircleAvatar(
                                    radius: 45,
                                    backgroundImage: MemoryImage(
                                      profile.profileImage!,
                                    ),
                                  )
                                : CircleAvatar(
                                    radius: 45,
                                    backgroundImage: MemoryImage(
                                      profile.profileImage!,
                                    ),
                                  )
                            : !widget.isEditProfile
                                ? const CircleAvatar(
                                    radius: 45,
                                  )
                                : CircleAvatar(
                                    radius: 45,
                                    backgroundImage: CachedNetworkImageProvider(profile.userModel?.profileUrl ?? ""),
                                  ),
                        const SizedBox(
                          height: 20,
                        ),
                        Builder(builder: (context) {
                          return ElevatedButton(
                            onPressed: () async {
                              showModalBottomSheet(
                                  // cupertino: CupertinoModalSheetData(),
                                  context: context,
                                  builder: (context) {
                                    return BottomSheet(onClosing: () {
                                      Navigator.pop(context);
                                    }, builder: (context) {
                                      return ImagePickerWidget(
                                        camera: () async {
                                          setState(() {
                                            isImageUpdate = true;
                                          });
                                          await ref
                                              .read(ProfileController.userControllerProvider)
                                              .pickImage(imageSource: ImageSource.camera);

                                          // await ref.read(profileRepoProvider).updateImage(profile.profileImage!);
                                        },
                                        gallery: () async {
                                          if (widget.isEditProfile) {
                                            setState(() {
                                              isImageUpdate = true;
                                            });
                                            await ref.read(ProfileController.userControllerProvider).pickImage(
                                                  imageSource: ImageSource.gallery,
                                                );

                                            // await ref.read(profileRepoProvider).updateImage(profile.profileImage!);
                                          }
                                        },
                                      );
                                    });
                                  });
                            },
                            child: Text(widget.isEditProfile ? "Change Profile Picture" : "Upload Profile Picture"),
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
                          decoration: const InputDecoration(
                            isDense: true,
                            hintText: "Username",
                          ),
                          controller: _usernameController,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          validator: ((value) {
                            if (value!.isEmpty) {
                              return "Please enter a nickname";
                            } else {
                              return null;
                            }
                          }),
                          decoration: const InputDecoration(
                            isDense: true,
                            hintText: "Date of Birth",
                          ),
                          controller: _dobController,
                          readOnly: true,
                          onTap: () async {
                            // if (Platform.isIOS) {
                            await showDatePicker(
                              cancelText: "Cancel",
                              confirmText: "Done",
                              helpText: "Select Date of Birth",
                              errorFormatText: "Enter valid date",
                              errorInvalidText: "Enter date in valid range",
                              fieldHintText: "MM/DD/YYYY",
                              fieldLabelText: "Date of Birth",
                              lastDate: DateTime.now().subtract(
                                const Duration(
                                  days: 6570,
                                ),
                              ),
                              context: context,
                              initialDate: DateTime.now().subtract(
                                const Duration(
                                  days: 6570,
                                ),
                              ),
                              firstDate: DateTime(1960),
                            ).then((value) {
                              print(value);
                              if (value != null) {
                                setState(() {
                                  _dobController.text = DateFormat.yMd().format(value);

                                  //     _selectedDate = value;
                                  _selectedDate = value;
                                });
                              }
                            });
                          },
                        ),
                        const SizedBox(
                          height: 10,
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
                            hintText: "Bio",
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
                                      context.router.push(const AddAdditionalInformationRoute());
                                    },
                                    label: const Text("Add Additional Information")),
                              )
                            : const SizedBox.shrink(),
                        const SizedBox(
                          height: 20,
                        ),
                        AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          curve: Curves.easeInOut,
                          child: Visibility(
                            visible: _loading,
                            replacement: ElevatedButton(
                              onPressed: () async {
                                final route = AutoRouter.of(context);

                                setState(() {
                                  _loading = true;
                                });

                                if (widget.isEditProfile) {
                                  final data = await Geolocator.getCurrentPosition();

                                  GeoFirePoint myLocation = GeoFirePoint(GeoPoint(
                                    data.latitude,
                                    data.longitude,
                                  ));
                                  final userdata = ref.read(ProfileController.userControllerProvider).userModel;
                                  await ref.read(Dependency.profileProvider).updateUserDoc(
                                        userdata!.copyWith(
                                            bio: _bioController.text,
                                            username: _usernameController.text,
                                            position: GeoPointData(
                                              // geohash: myLocation.geohash,
                                              geopoint: [myLocation.geopoint.longitude, myLocation.geopoint.latitude],
                                            ),
                                            profileUrl:
                                                await ref.read(ProfileController.userControllerProvider).uploadImage()),
                                      );

                                  setState(() {
                                    _loading = false;
                                  });
                                  return;
                                }
                                var permission = await Geolocator.checkPermission();

                                print(permission);

                                final data = await Geolocator.getCurrentPosition();

                                GeoFirePoint myLocation = GeoFirePoint(GeoPoint(
                                  data.latitude,
                                  data.longitude,
                                ));

                                int age = calculateAge(_selectedDate!);

                                UserModel user = UserModel(
                                  fcmToken: "dejkedk",
                                  // fcmToken: token ?? "",
                                  dob: _dobController.text,
                                  isOnline: true,
                                  isVerified: false,
                                  id: FirebaseAuth.instance.currentUser!.uid,
                                  username: _usernameController.text,
                                  bio: _bioController.text,
                                  age: age,
                                  albumUrl: [],
                                  birthday: _dobController.text,

                                  position: GeoPointData(
                                    // geohash: myLocation.geohash,
                                    geopoint: [myLocation.geopoint.longitude, myLocation.geopoint.latitude],
                                  ),
                                );

                                await ref.read(Dependency.profileProvider).createUserDoc(user);

                                try {
                                  await route.popAndPush(const DashboardRoute());
                                } catch (e) {
                                  logger.e(e);
                                  _bioController.clear();
                                  _usernameController.clear();
                                  _dobController.clear();
                                  _formKey.currentState!.reset();

                                  setState(() {
                                    _loading = false;
                                  });
                                }
                              },
                              child: Text(
                                widget.isEditProfile ? "Update" : "Save",
                              ),
                            ),
                            child: const Center(
                              child: CircularProgressIndicator.adaptive(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
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
    this.isCallEnabled = false,
  }) : super(key: key);

  final VoidCallback camera;
  final VoidCallback gallery;
  final bool? isCallEnabled;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: isCallEnabled! ? 180 : 120,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ListTile(
            leading: Icon(Icons.camera_alt),
            title: const Text("Camera"),
            onTap: camera,
          ),
          ListTile(
            leading: Icon(Icons.photo_album),
            title: const Text("Gallery"),
            onTap: gallery,
          ),
        ],
      ),
    );
  }
}
