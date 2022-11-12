// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:wings_dating_app/dependency/dependenies.dart';
import 'package:wings_dating_app/helpers/age.dart';
import 'package:wings_dating_app/helpers/helpers.dart';
import 'package:wings_dating_app/helpers/logger.dart';
import 'package:wings_dating_app/routes/app_router.dart';
// /  / / import 'package:wings_dating_app/src/model/geo_point.dart';
import 'package:wings_dating_app/src/model/user_models.dart';
import 'package:wings_dating_app/src/profile/controller/profile_controller.dart';

import '../model/user_basic_model.dart';

final roleProvider = StateProvider<Role>((ref) {
  final userdata = ref.read(ProfileController.userControllerProvider).userModel;
  return userdata!.role;
});

final bodyTypeProvider = StateProvider<BodyType>((ref) {
  final userdata = ref.read(ProfileController.userControllerProvider).userModel;
  return userdata!.bodyType;
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
      appBar: AppBar(
        title: Text(widget.isEditProfile ? "Edit Profile" : "Save Profile"),
      ),
      body: Form(
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
                                    .pickImage(imageSource: ImageSource.camera);
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
                      context.router.push(AddAdditionalInformationRoute());
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
                    final data = await location.getLocation();
                    if (_formKey.currentState!.validate()) {
                      int age = calculateAge(_selectedDate!);

                      UserModel user = UserModel(
                        nickname: "udesh",
                        location: GeoPoint(
                          data.latitude!,
                          data.longitude!,
                        ),
                        aboutMe: _bioController.text,
                        age: age,
                        avatarUrl: await ref
                            .read(ProfileController.userControllerProvider)
                            .uploadImage(),
                        birthday: _dobController.text,
                        // userBasicModel: UserBasicModel(
                        //   dob: _dobController.text,
                        // ),
                      );

                      await ref
                          .read(Dependency.profileProvider)
                          .createUserDoc(user);
                    }
                  },
                  child: Text(widget.isEditProfile ? "Update" : "Save"),
                ),
              ),
            ],
          ).p16(),
        ),
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
            leading: Icon(Icons.camera),
            title: const Text("Camera"),
            onTap: camera,
          ),
          ListTile(
            leading: Icon(Icons.photo),
            title: const Text("Gallery"),
            onTap: gallery,
          ),
        ],
      ),
    );
  }
}

// padding extansion

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
    final prfiledata =
        ref.read(ProfileController.userControllerProvider).userModel;
    final role = ref.watch(roleProvider);
    final bodyType = ref.watch(bodyTypeProvider);

    logger.i(prfiledata?.role.index);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(),
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
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              selected: true,
              style: ListTileStyle.list,
              onTap: () {
                _showRole(context);
              },
              title: const Text("Body Type"),
              subtitle: Text(role.value),
              enabled: true,
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            const Divider()
          ],
        ),
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
                      ref.read(roleProvider.notifier).state = value;

                      setState(() {});
                      context.router.pop();
                    },
                    value: Role.values,
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
