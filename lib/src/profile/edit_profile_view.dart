// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:wings_dating_app/dependency/dependenies.dart';
import 'package:wings_dating_app/helpers/logger.dart';

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

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _usernameController = TextEditingController();
    _nicknameController = TextEditingController();
// _phoneController = TextEditingController();
    _dobController = TextEditingController();
    super.initState();

    ref.read(Dependency.profileProvider).checkUserDocExist();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isEditProfile ? "Edit Profile" : "Save Profile"),
      ),
      body: Form(
        // autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const CircleAvatar(
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
                          return SizedBox(
                            height: 120,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ListTile(
                                  leading: Icon(Icons.camera),
                                  title: const Text("Camera"),
                                  onTap: () {},
                                ),
                                ListTile(
                                  leading: Icon(Icons.photo),
                                  title: const Text("Gallery"),
                                  onTap: () {},
                                ),
                              ],
                            ),
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
            TextFormField(
              controller: _usernameController,
              decoration: const InputDecoration(
                hintText: "Username",
              ),
              validator: (value) {
//username regex for validation checking the uniqueness of the username

// regex expression for username
                final RegExp usernameExp = RegExp(
                    r"^(?=.{8,20}$)(?![_.])(?!.*[_.]{2})[a-zA-Z0-9._]+(?<![_.])$");
                if (usernameExp.hasMatch(value!)) {
                  return null;
                } else if (value.isEmpty) {
                  return "Username must be at least 6 characters";
                } else if (value.length > 20) {
                  return "Username must be less than 20 characters";
                } else {
                  return "Please enter a Username";
                }
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _nicknameController,
              decoration: const InputDecoration(
                hintText: "Nickname",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _dobController,
              decoration: const InputDecoration(
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

                  logger.i(DateFormat.yMd().format(value!));
                });
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton.icon(
                  icon: const Icon(Icons.add),
                  onPressed: () {},
                  label: const Text("Add Additional Information")),
            ),
            const SizedBox(
              height: 20,
            ),
            AnimatedContainer(
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(widget.isEditProfile ? "Update" : "Save"),
              ),
            ),
          ],
        ).p16(),
      ),
    );
  }
}

// padding extansion

