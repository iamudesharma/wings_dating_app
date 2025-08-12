// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geoflutterfire_plus/geoflutterfire_plus.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import 'package:wings_dating_app/dependency/dependencies.dart';
import 'package:wings_dating_app/helpers/age.dart';
import 'package:wings_dating_app/helpers/extra_data.dart';
import 'package:wings_dating_app/helpers/logger.dart';
import 'package:wings_dating_app/routes/app_router.dart';
import 'package:wings_dating_app/src/model/geo_point_data.dart';
import 'package:wings_dating_app/src/model/user_models.dart';
import 'package:wings_dating_app/src/profile/controller/profile_controller.dart';
import 'package:wings_dating_app/src/profile/add_additional_information_view.dart';
import 'package:wings_dating_app/services/location_service.dart';

import '../../helpers/responsive_layout.dart';

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

  bool isImageUpdate = false;
  // final geo = GeoFlutterFire();

  @override
  void initState() {
    _usernameController = TextEditingController();
    _dobController = TextEditingController();
    _bioController = TextEditingController();

    if (widget.isEditProfile) {
      final userdata = ref.read(ProfileController.userControllerProvider).userModel;
      if (userdata != null) {
        logger.i(userdata);

        _usernameController.text = userdata.username ?? "";
        _dobController.text = userdata.birthday ?? "";
        _bioController.text = userdata.bio ?? "";
      }
    }

    super.initState();
  }

  @override
  void didChangeDependencies() async {
    // Location handling is now managed by LocationService
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
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isDesktop = MediaQuery.of(context).size.width >= 900;
    final isTablet = MediaQuery.of(context).size.width >= 600 && MediaQuery.of(context).size.width < 900;
    final double maxWidth = isDesktop
        ? 600
        : isTablet
            ? 450
            : double.infinity;
    final double cardPadding = isDesktop
        ? 40
        : isTablet
            ? 24
            : 12;
    final double imageSize = isDesktop
        ? 120
        : isTablet
            ? 100
            : 90;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxWidth),
          child: ListView(
            padding: EdgeInsets.symmetric(
              vertical: isDesktop
                  ? 48
                  : isTablet
                      ? 32
                      : 16,
              horizontal: cardPadding,
            ),
            children: [
              Card(
                elevation: 8,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
                color: Theme.of(context).colorScheme.surface.withOpacity(isDark ? 0.98 : 0.95),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: cardPadding, vertical: cardPadding),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 24),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.18),
                                    blurRadius: 24,
                                    offset: const Offset(0, 8),
                                  ),
                                ],
                                border: Border.all(
                                  color: Theme.of(context).colorScheme.background,
                                  width: 6,
                                ),
                              ),
                              child: CircleAvatar(
                                radius: imageSize / 2,
                                backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
                                backgroundImage: profile.profileImage != null
                                    ? MemoryImage(profile.profileImage!) as ImageProvider<Object>
                                    : (widget.isEditProfile && (profile.userModel?.profileUrl?.isNotEmpty ?? false))
                                        ? NetworkImage(profile.userModel!.profileUrl!) as ImageProvider<Object>
                                        : null,
                                child: (profile.profileImage == null &&
                                        (!widget.isEditProfile || (profile.userModel?.profileUrl?.isEmpty ?? true)))
                                    ? Icon(Icons.person,
                                        size: imageSize / 2,
                                        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5))
                                    : null,
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(24),
                                  onTap: () async {
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return ImagePickerWidget(
                                          camera: () async {
                                            setState(() {
                                              isImageUpdate = true;
                                            });
                                            await ref
                                                .read(ProfileController.userControllerProvider)
                                                .pickImage(imageSource: ImageSource.camera);
                                            Navigator.pop(context);
                                          },
                                          gallery: () async {
                                            setState(() {
                                              isImageUpdate = true;
                                            });
                                            await ref
                                                .read(ProfileController.userControllerProvider)
                                                .pickImage(imageSource: ImageSource.gallery);
                                            Navigator.pop(context);
                                          },
                                        );
                                      },
                                    );
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).colorScheme.primary,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.12),
                                          blurRadius: 8,
                                          offset: const Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    child: Icon(Icons.edit, color: Theme.of(context).colorScheme.onPrimary, size: 22),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        Text(
                          widget.isEditProfile ? "Edit Profile" : "Create Profile",
                          style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 24),
                        TextFormField(
                          validator: (value) => value!.isEmpty ? "Please enter a Username" : null,
                          decoration: InputDecoration(
                            isDense: true,
                            hintText: "Username",
                            prefixIcon: Icon(Icons.person, color: Theme.of(context).colorScheme.primary),
                          ),
                          controller: _usernameController,
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          validator: (value) => value!.isEmpty ? "Please enter your Date of Birth" : null,
                          decoration: InputDecoration(
                            isDense: true,
                            hintText: "Date of Birth",
                            prefixIcon: Icon(Icons.cake, color: Theme.of(context).colorScheme.primary),
                          ),
                          controller: _dobController,
                          readOnly: true,
                          onTap: () async {
                            await showDatePicker(
                              cancelText: "Cancel",
                              confirmText: "Done",
                              helpText: "Select Date of Birth",
                              errorFormatText: "Enter valid date",
                              errorInvalidText: "Enter date in valid range",
                              fieldHintText: "MM/DD/YYYY",
                              fieldLabelText: "Date of Birth",
                              lastDate: DateTime.now().subtract(const Duration(days: 6570)),
                              context: context,
                              initialDate: DateTime.now().subtract(const Duration(days: 6570)),
                              firstDate: DateTime(1960),
                            ).then((value) {
                              if (value != null) {
                                setState(() {
                                  _dobController.text = DateFormat.yMd().format(value);
                                  _selectedDate = value;
                                });
                              }
                            });
                          },
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          validator: (value) => value!.isEmpty ? "Please enter a bio" : null,
                          maxLines: 2,
                          controller: _bioController,
                          decoration: InputDecoration(
                            isDense: true,
                            hintText: "Bio",
                            prefixIcon: Icon(Icons.info_outline, color: Theme.of(context).colorScheme.primary),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: TextButton.icon(
                            icon: const Icon(Icons.add),
                            onPressed: () async {
                              context.router.push(const AddAdditionalInformationRoute());
                            },
                            label: const Text("Add Additional Information"),
                          ),
                        ),
                        const SizedBox(height: 20),
                        AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          curve: Curves.easeInOut,
                          child: Visibility(
                            visible: _loading,
                            replacement: SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Theme.of(context).colorScheme.primary,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                                  padding: const EdgeInsets.symmetric(vertical: 16),
                                  textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                                onPressed: () async {
                                  final route = AutoRouter.of(context);

                                  setState(() {
                                    _loading = true;
                                  });

                                  // Get location from location service
                                  final locationState = ref.read(locationServiceProvider);
                                  if (!locationState.hasValidLocation) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Please set your location first'),
                                        backgroundColor: Colors.red,
                                      ),
                                    );
                                    setState(() {
                                      _loading = false;
                                    });
                                    return;
                                  }

                                  final userLocation = locationState.currentLocation!;

                                  if (widget.isEditProfile) {
                                    final userdata = ref.read(ProfileController.userControllerProvider).userModel;
                                    await ref.read(Dependency.profileProvider).updateUserDoc(
                                          userdata!.copyWith(
                                              bio: _bioController.text,
                                              username: _usernameController.text,
                                              position: userLocation,
                                              profileUrl: await ref
                                                  .read(ProfileController.userControllerProvider)
                                                  .uploadImage()),
                                        );

                                    setState(() {
                                      _loading = false;
                                    });
                                    return;
                                  }
                                  
                                  int age = calculateAge(_selectedDate!);

                                  // Get additional information from providers or use default values if not set
                                  Role role;
                                  BodyType bodyType;
                                  RelationshipStatus relationshipStatus;
                                  Ethnicity ethnicity;
                                  LookingFor lookingFor;
                                  WhereToMeet whereTomeet;
                                  String weight;
                                  String height;

                                  try {
                                    role = ref.read(roleProvider);
                                    bodyType = ref.read(bodyTypeProvider);
                                    relationshipStatus = ref.read(relationshipStatusProvider);
                                    ethnicity = ref.read(ethnicityProvider);
                                    lookingFor = ref.read(lookingForProvider);
                                    whereTomeet = ref.read(whereToMeetProvider);
                                    weight = ref.read(weightProvider);
                                    height = ref.read(heightProvider);
                                  } catch (e) {
                                    // If providers are not initialized, use default values
                                    logger.e("Error reading providers: $e");
                                    role = Role.doNotShow;
                                    bodyType = BodyType.doNotShow;
                                    relationshipStatus = RelationshipStatus.doNotShow;
                                    ethnicity = Ethnicity.doNotShow;
                                    lookingFor = LookingFor.doNotShow;
                                    whereTomeet = WhereToMeet.doNotShow;
                                    weight = "";
                                    height = "";
                                  }

                                  UserModel user = UserModel(
                                    fcmToken: "dejkedkmkkw",
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
                                    // Include additional information
                                    role: role,
                                    bodyType: bodyType,
                                    relationshipStatus: relationshipStatus,
                                    ethnicity: ethnicity,
                                    lookingFor: lookingFor,
                                    whereToMeet: whereTomeet,
                                    height: height,
                                    weight: weight,
                                    position: userLocation,
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
                                child: Text(widget.isEditProfile ? "Update" : "Save"),
                              ),
                            ),
                            child: const Center(child: CircularProgressIndicator.adaptive()),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
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
