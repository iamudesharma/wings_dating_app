// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';
// import 'dart:js';
import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectycube_sdk/connectycube_sdk.dart';
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
import 'package:velocity_x/velocity_x.dart';
import 'package:wings_dating_app/const/pref_util.dart';

import 'package:wings_dating_app/dependency/dependenies.dart';
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
                                  backgroundImage: CachedNetworkImageProvider(
                                    profile.profileImage!,
                                  ),
                                )
                              : CircleAvatar(
                                  radius: 45,
                                  backgroundImage: FileImage(
                                    File(profile.profileImage!),
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

                                        await ref.read(profileRepoProvider).updateImage(profile.profileImage!);
                                      },
                                      gallery: () async {
                                        if (widget.isEditProfile) {
                                          setState(() {
                                            isImageUpdate = true;
                                          });
                                          await ref.read(ProfileController.userControllerProvider).pickImage(
                                                imageSource: ImageSource.gallery,
                                              );

                                          await ref.read(profileRepoProvider).updateImage(profile.profileImage!);
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
                              SharedPrefs sharedPrefs = await SharedPrefs.instance.init();

                              final data = await Geolocator.getCurrentPosition();

                              GeoFirePoint myLocation = GeoFirePoint(GeoPoint(
                                data.latitude,
                                data.longitude,
                              ));

                              if (_formKey.currentState!.validate()) {
                                CubeUser? cubeUser0 = sharedPrefs.getUser();

                                final image = await ref.read(ProfileController.userControllerProvider).uploadImage();
                                if (widget.isEditProfile) {
                                  UserModel? user = profile.userModel?.copyWith(
                                    position: GeoPointData(geohash: myLocation.geohash, geopoint: myLocation.geopoint),
                                    bio: _bioController.text,
                                    fcmToken: "",
                                    cubeUser: CubeUser(
                                      id: cubeUser0?.id,
                                      password: cubeUser0?.password,
                                      login: cubeUser0?.login,
                                      fullName: _usernameController.text,
                                      avatar: isImageUpdate ? image : profile.userModel?.cubeUser.avatar,
                                    ),
                                    username: _usernameController.text,
                                    profileUrl: isImageUpdate ? image : profile.userModel?.cubeUser.avatar,
                                    birthday: _dobController.text,
                                  );
                                  logger.i(user?.toJson());
                                  await ref.read(Dependency.profileProvider).updateUserDoc(user!);

                                  // updateUser(CubeUser(
                                  //   id: _cubeUser?.id,
                                  //   login: _usernameController.text,
                                  //   fullName: _usernameController.text,
                                  //   avatar: image,
                                  //   phone: _cubeUser!.phone,
                                  //   password: "1234567890",
                                  // ));

                                  // await SharedPrefs.instance
                                  //     .updateUser(CubeUser(
                                  //   id: _cubeUser?.id,
                                  //   login: _usernameController.text,
                                  //   fullName: _usernameController.text,
                                  //   avatar: image,
                                  //   phone: _cubeUser!.phone,
                                  ref.invalidate(getUserByIdProvider(profile.userModel!.id)); // ));

                                  setState(() {
                                    _loading = false;
                                  });

                                  route.back();
                                } else {
                                  final sharedPrefs = await SharedPrefs.instance.init();
                                  int age = calculateAge(_selectedDate!);

                                  int password = Random().nextInt(1000000000);

                                  final cubeUser = sharedPrefs.getUser();
                                  UserModel user = UserModel(
                                    cubeUser: CubeUser(
                                        avatar: await ref.read(ProfileController.userControllerProvider).uploadImage(),
                                        fullName: _usernameController.text,
                                        password: password.toString(),
                                        login: _usernameController.text.toLowerCase()),
                                    fcmToken: "",
                                    // fcmToken: token ?? "",
                                    dob: _dobController.text,
                                    isOnline: true,
                                    isVerified: false,
                                    id: FirebaseAuth.instance.currentUser!.uid,
                                    username: _usernameController.text,
                                    bio: _bioController.text,
                                    age: age,
                                    profileUrl: await ref.read(ProfileController.userControllerProvider).uploadImage(),
                                    birthday: _dobController.text,

                                    position: GeoPointData(
                                      geohash: myLocation.geohash,
                                      geopoint: myLocation.geopoint,
                                    ),
                                  );

                                  await ref.read(Dependency.profileProvider).createUserDoc(user);

                                  try {
                                    _signInCC(
                                        CubeUser(
                                            avatar:
                                                await ref.read(ProfileController.userControllerProvider).uploadImage(),
                                            fullName: _usernameController.text,
                                            password: password.toString(),
                                            login: _usernameController.text.toLowerCase()),
                                        ref);

                                    await route.popAndPush(const DashboardRoute());
                                  } on Exception catch (e) {
                                    logger.e(e);
                                    _bioController.clear();
                                    _usernameController.clear();
                                    _dobController.clear();
                                    _formKey.currentState!.reset();

                                    setState(() {
                                      _loading = false;
                                    });
                                  }
                                }
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
                  ).p16(),
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

_signInCC(CubeUser user, WidgetRef ref) async {
  // if (_isLoginContinues) return;

  // setState(() {
  //   _isLoginContinues = true;
  // });
  if (!CubeSessionManager.instance.isActiveSessionValid()) {
    try {
      await createSession();
    } catch (error) {
      _processLoginError(error);
    }
  }
  signUp(user).then((newUser) {
    print("signUp newUser $newUser");
    user.id = newUser.id;
    SharedPrefs.instance.saveNewUser(user);
    signIn(user).then((result) {
      ref.read(appRouteProvider).replace(const DashboardRoute());
      _loginToCubeChat(user);

      ref.read(profileRepoProvider).updateCubeUser(user);
    });
  }).catchError((exception) {
    _processLoginError(exception);
  });
}

_loginToCC(CubeUser user, {bool saveUser = false}) {
  print("_loginToCC user: $user");
  // if (_isLoginContinues) return;
  // setState(() {
  //   _isLoginContinues = true;
  // });

  createSession(user).then((cubeSession) async {
    print("createSession cubeSession: $cubeSession");
    var tempUser = user;
    user = cubeSession.user!..password = tempUser.password;
    if (saveUser) {
      SharedPrefs.instance.init().then((sharedPrefs) {
        sharedPrefs.saveNewUser(user);
      });
    }

    // PushNotificationsManager.instance.init();

    _loginToCubeChat(user);
  }).catchError((error) {
    _processLoginError(error);
  });
}

_loginToCubeChat(CubeUser user) {
  print("_loginToCubeChat user $user");
  CubeChatConnectionSettings.instance.totalReconnections = 0;
  CubeChatConnection.instance.login(user).then((cubeUser) {
    // _isLoginContinues = false;
    // _goDialogScreen(context, cubeUser);
  }).catchError((error) {
    _processLoginError(error);
  });
}

void _processLoginError(exception) {
  // log("Login error $exception", TAG);
  // setState(() {
  //   _isLoginContinues = false;
  // });
  // showDialogError(exception, context);
}
