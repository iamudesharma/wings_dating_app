// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
import 'package:wings_dating_app/src/model/geo_point_data.dart';
import 'package:wings_dating_app/src/model/user_models.dart';
import 'package:wings_dating_app/src/profile/controller/profile_controller.dart';
import 'package:wings_dating_app/src/profile/providers/onboarding_providers.dart';
import 'package:wings_dating_app/repo/profile_extras_api_repo.dart';
import 'package:wings_dating_app/src/profile/onboarding/onboarding_view.dart';
import 'package:wings_dating_app/src/profile/widgets/profile_completion_meter.dart';
import 'package:wings_dating_app/src/profile/widgets/prompts_editor.dart';
import 'package:wings_dating_app/src/profile/widgets/chips_selector.dart';
import 'package:wings_dating_app/src/profile/widgets/social_links_form.dart';
import 'package:wings_dating_app/src/profile/widgets/video_clip_uploader.dart';
import 'package:wings_dating_app/helpers/send_notification.dart';
import 'package:wings_dating_app/src/profile/add_additional_information_view.dart';

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
  DateTime? _selectedDate;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Geolocator location = Geolocator();
  bool isImageUpdate = false;
  // final geo = GeoFlutterFire();

  Widget _sectionHeader(BuildContext context, String title, {IconData? icon}) {
    final theme = Theme.of(context);
    return Row(
      children: [
        if (icon != null)
          Icon(
            icon,
            color: theme.colorScheme.primary,
          ),
        if (icon != null) const SizedBox(width: 8),
        Text(
          title,
          style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
        ),
      ],
    );
  }

  Widget _enumDropdown<T>({
    required BuildContext context,
    required String label,
    required T value,
    required List<DropdownMenuItem<T>> items,
    required ValueChanged<T?> onChanged,
    IconData? icon,
    double? width,
  }) {
    final theme = Theme.of(context);
    final field = DropdownButtonFormField<T>(
      value: value,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: icon != null ? Icon(icon, color: theme.colorScheme.primary) : null,
        isDense: true,
      ),
      items: items,
      onChanged: onChanged,
    );
    if (width != null) {
      return SizedBox(width: width, child: field);
    }
    return field;
  }

  Widget _stringDropdown({
    required BuildContext context,
    required String label,
    required String value,
    required List<String> options,
    required ValueChanged<String?> onChanged,
    IconData? icon,
    double? width,
  }) {
    final theme = Theme.of(context);
    final normalizedValue = options.contains(value) ? value : options.first;

    final field = DropdownButtonFormField<String>(
      value: normalizedValue,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: icon != null ? Icon(icon, color: theme.colorScheme.primary) : null,
        isDense: true,
      ),
      items: options
          .map(
            (option) => DropdownMenuItem<String>(
              value: option,
              child: Text(option),
            ),
          )
          .toList(),
      onChanged: onChanged,
    );
    if (width != null) {
      return SizedBox(width: width, child: field);
    }
    return field;
  }

  Widget _buildAdditionalInfoSection(BuildContext context) {
    final role = ref.watch(roleProvider);
    final bodyType = ref.watch(bodyTypeProvider);
    final relationshipStatus = ref.watch(relationshipStatusProvider);
    final ethnicity = ref.watch(ethnicityProvider);
    final lookingFor = ref.watch(lookingForProvider);
    final whereToMeet = ref.watch(whereToMeetProvider);
    final height = ref.watch(heightProvider);
    final weight = ref.watch(weightProvider);

    return LayoutBuilder(
      builder: (context, constraints) {
        final double maxWidth = constraints.maxWidth;
        final bool useTwoColumns = maxWidth > 640;
        final double fieldWidth = useTwoColumns ? (maxWidth - 16) / 2 : maxWidth;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _sectionHeader(context, 'Additional Information', icon: Icons.badge_outlined),
            const SizedBox(height: 16),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                _enumDropdown<Role>(
                  context: context,
                  label: 'Role',
                  value: role,
                  items: Role.values
                      .map((value) => DropdownMenuItem<Role>(
                            value: value,
                            child: Text(value.value),
                          ))
                      .toList(),
                  icon: Icons.person_outline,
                  onChanged: (value) {
                    if (value != null) {
                      ref.read(roleProvider.notifier).update(value);
                    }
                  },
                  width: fieldWidth,
                ),
                _enumDropdown<BodyType>(
                  context: context,
                  label: 'Body Type',
                  value: bodyType,
                  items: BodyType.values
                      .map((value) => DropdownMenuItem<BodyType>(
                            value: value,
                            child: Text(value.value),
                          ))
                      .toList(),
                  icon: Icons.accessibility_new_outlined,
                  onChanged: (value) {
                    if (value != null) {
                      ref.read(bodyTypeProvider.notifier).update(value);
                    }
                  },
                  width: fieldWidth,
                ),
                _enumDropdown<RelationshipStatus>(
                  context: context,
                  label: 'Relationship Status',
                  value: relationshipStatus,
                  items: RelationshipStatus.values
                      .map((value) => DropdownMenuItem<RelationshipStatus>(
                            value: value,
                            child: Text(value.value),
                          ))
                      .toList(),
                  icon: Icons.favorite_outline,
                  onChanged: (value) {
                    if (value != null) {
                      ref.read(relationshipStatusProvider.notifier).update(value);
                    }
                  },
                  width: fieldWidth,
                ),
                _enumDropdown<Ethnicity>(
                  context: context,
                  label: 'Ethnicity',
                  value: ethnicity,
                  items: Ethnicity.values
                      .map((value) => DropdownMenuItem<Ethnicity>(
                            value: value,
                            child: Text(value.value),
                          ))
                      .toList(),
                  icon: Icons.public_outlined,
                  onChanged: (value) {
                    if (value != null) {
                      ref.read(ethnicityProvider.notifier).update(value);
                    }
                  },
                  width: fieldWidth,
                ),
                _enumDropdown<LookingFor>(
                  context: context,
                  label: 'Looking For',
                  value: lookingFor,
                  items: LookingFor.values
                      .map((value) => DropdownMenuItem<LookingFor>(
                            value: value,
                            child: Text(value.value),
                          ))
                      .toList(),
                  icon: Icons.search_outlined,
                  onChanged: (value) {
                    if (value != null) {
                      ref.read(lookingForProvider.notifier).update(value);
                    }
                  },
                  width: fieldWidth,
                ),
                _enumDropdown<WhereToMeet>(
                  context: context,
                  label: 'Where to Meet',
                  value: whereToMeet,
                  items: WhereToMeet.values
                      .map((value) => DropdownMenuItem<WhereToMeet>(
                            value: value,
                            child: Text(value.value),
                          ))
                      .toList(),
                  icon: Icons.place_outlined,
                  onChanged: (value) {
                    if (value != null) {
                      ref.read(whereToMeetProvider.notifier).update(value);
                    }
                  },
                  width: fieldWidth,
                ),
                _stringDropdown(
                  context: context,
                  label: 'Height',
                  value: height,
                  options: heightList,
                  icon: Icons.height,
                  onChanged: (value) {
                    if (value != null) {
                      ref.read(heightProvider.notifier).state = value;
                    }
                  },
                  width: fieldWidth,
                ),
                _stringDropdown(
                  context: context,
                  label: 'Weight',
                  value: weight,
                  options: weightList,
                  icon: Icons.monitor_weight_outlined,
                  onChanged: (value) {
                    if (value != null) {
                      ref.read(weightProvider.notifier).state = value;
                    }
                  },
                  width: fieldWidth,
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget _buildOnboardingSection(BuildContext context) {
    final habits = ref.watch(habitsProvider);
    final values = ref.watch(valuesProvider);

    return LayoutBuilder(
      builder: (context, constraints) {
        final double maxWidth = constraints.maxWidth;
        final bool useTwoColumns = maxWidth > 900;
        final double columnWidth = useTwoColumns ? (maxWidth - 24) / 2 : maxWidth;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _sectionHeader(context, 'Profile Story', icon: Icons.auto_awesome_outlined),
            const SizedBox(height: 16),
            SizedBox(
              width: maxWidth,
              child: const ProfileCompletionMeter(),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                SizedBox(
                  width: columnWidth,
                  child: const PromptsEditor(),
                ),
                SizedBox(
                  width: columnWidth,
                  child: ChipsSelector(
                    title: 'Habits',
                    options: defaultHabits,
                    selected: habits,
                    onToggle: (value) => ref.read(habitsProvider.notifier).toggle(value),
                  ),
                ),
                SizedBox(
                  width: columnWidth,
                  child: ChipsSelector(
                    title: 'Values',
                    options: defaultValues,
                    selected: values,
                    onToggle: (value) => ref.read(valuesProvider.notifier).toggle(value),
                  ),
                ),
                SizedBox(
                  width: columnWidth,
                  child: const SocialLinksForm(),
                ),
                SizedBox(
                  width: columnWidth,
                  child: const VideoClipUploader(),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _dobController = TextEditingController();
    _bioController = TextEditingController();

    if (widget.isEditProfile) {
      final userdata = ref.read(ProfileController.userControllerProvider).userModel;
      if (userdata != null) {
        logger.i(userdata);

        _usernameController.text = userdata.username;
        _dobController.text = userdata.birthday ?? "";
        _bioController.text = userdata.bio ?? "";

        // Defer provider mutations until after the first frame to avoid updating while the widget tree builds
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!mounted) return;
          ref.read(roleProvider.notifier).update(userdata.role);
          ref.read(bodyTypeProvider.notifier).update(userdata.bodyType);
          ref.read(relationshipStatusProvider.notifier).update(userdata.relationshipStatus);
          ref.read(ethnicityProvider.notifier).update(userdata.ethnicity);
          ref.read(lookingForProvider.notifier).update(userdata.lookingFor);
          ref.read(whereToMeetProvider.notifier).update(userdata.whereToMeet);
          ref.read(heightProvider.notifier).state =
              (userdata.height?.isNotEmpty ?? false) ? userdata.height! : heightList.first;
          ref.read(weightProvider.notifier).state =
              (userdata.weight?.isNotEmpty ?? false) ? userdata.weight! : weightList.first;
        });
      }
    }
  }

  @override
  void didChangeDependencies() {
    // No-op: keep lifecycle method clean. Request permissions lazily when needed.
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 900;
    final isTablet = MediaQuery.of(context).size.width >= 600 && MediaQuery.of(context).size.width < 900;
    final double maxWidth = isDesktop
        ? 1040
        : isTablet
            ? 720
            : double.infinity;
    final double cardPadding = isDesktop
        ? 48
        : isTablet
            ? 32
            : 16;
    final double imageSize = isDesktop
        ? 120
        : isTablet
            ? 100
            : 90;

    final isDark = Theme.of(context).brightness == Brightness.dark;
    final profile = ref.watch(ProfileController.userControllerProvider);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(widget.isEditProfile ? 'Edit Profile' : 'Create Profile'),
      ),
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
                color: Theme.of(context).colorScheme.surface.withValues(alpha: isDark ? 0.98 : 0.95),
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
                                    color: Colors.black.withValues(alpha: 0.18),
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
                                        color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.5))
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
                                      color: Theme.of(context).colorScheme.secondaryContainer,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withValues(alpha: 0.12),
                                          blurRadius: 8,
                                          offset: const Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    child: Icon(Icons.edit,
                                        color: Theme.of(context).colorScheme.onSecondaryContainer, size: 22),
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
                            labelText: "Username",
                            prefixIcon: Icon(Icons.person, color: Theme.of(context).colorScheme.primary),
                          ),
                          controller: _usernameController,
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          validator: (value) => value!.isEmpty ? "Please enter your Date of Birth" : null,
                          decoration: InputDecoration(
                            isDense: true,
                            labelText: "Date of Birth",
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
                            labelText: "Bio",
                            prefixIcon: Icon(Icons.info_outline, color: Theme.of(context).colorScheme.primary),
                          ),
                        ),
                        const SizedBox(height: 20),
                        if (widget.isEditProfile) ...[
                          _buildAdditionalInfoSection(context),
                          const SizedBox(height: 24),
                          _buildOnboardingSection(context),
                          const SizedBox(height: 24),
                        ] else ...[
                          Align(
                            alignment: Alignment.centerLeft,
                            child: FilledButton.tonalIcon(
                              icon: const Icon(Icons.add),
                              onPressed: () async {
                                await Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (_) => const AddAdditionalInformationView(),
                                  ),
                                );
                              },
                              label: const Text("Add Additional Information"),
                            ),
                          ),
                          const SizedBox(height: 24),
                        ],
                        AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          curve: Curves.easeInOut,
                          child: Visibility(
                            visible: _loading,
                            replacement: SizedBox(
                              width: double.infinity,
                              child: FilledButton(
                                style: FilledButton.styleFrom(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                                  padding: const EdgeInsets.symmetric(vertical: 16),
                                  textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                                onPressed: () async {
                                  if (!_formKey.currentState!.validate()) return;
                                  setState(() {
                                    _loading = true;
                                  });

                                  if (widget.isEditProfile) {
                                    try {
                                      // Ensure permission requested
                                      if (!await Geolocator.isLocationServiceEnabled()) {
                                        await Geolocator.requestPermission();
                                      }
                                      final data = await Geolocator.getCurrentPosition();
                                      final myLocation = GeoFirePoint(GeoPoint(data.latitude, data.longitude));
                                      final profileNotifier =
                                          ref.read(ProfileController.userControllerProvider.notifier);
                                      final userdata = ref.read(ProfileController.userControllerProvider).userModel;

                                      final updatedRole = ref.read(roleProvider);
                                      final updatedBodyType = ref.read(bodyTypeProvider);
                                      final updatedRelationship = ref.read(relationshipStatusProvider);
                                      final updatedEthnicity = ref.read(ethnicityProvider);
                                      final updatedLookingFor = ref.read(lookingForProvider);
                                      final updatedWhereToMeet = ref.read(whereToMeetProvider);
                                      final updatedHeight = ref.read(heightProvider);
                                      final updatedWeight = ref.read(weightProvider);
                                      final updatedHabits = ref.read(habitsProvider);
                                      final updatedValues = ref.read(valuesProvider);
                                      final uploadedProfileUrl =
                                          isImageUpdate ? await profileNotifier.uploadImage() : null;

                                      await ref.read(Dependency.profileProvider).updateUserDoc(
                                            userdata!.copyWith(
                                              bio: _bioController.text,
                                              username: _usernameController.text,
                                              role: updatedRole,
                                              bodyType: updatedBodyType,
                                              relationshipStatus: updatedRelationship,
                                              ethnicity: updatedEthnicity,
                                              lookingFor: updatedLookingFor,
                                              whereToMeet: updatedWhereToMeet,
                                              height: updatedHeight,
                                              weight: updatedWeight,
                                              position: GeoPointData(
                                                geopoint: [
                                                  myLocation.geopoint.longitude,
                                                  myLocation.geopoint.latitude,
                                                ],
                                              ),
                                              profileUrl: uploadedProfileUrl ?? userdata.profileUrl,
                                            ),
                                          );
                                      // Save onboarding extras (stored separately from UserModel)
                                      await ref.read(profileExtrasApiRepoProvider).saveAll(
                                            habits: updatedHabits,
                                            values: updatedValues,
                                          );
                                      await profileNotifier.getCurrentUser();

                                      if (!mounted) return;
                                      setState(() {
                                        _loading = false;
                                        isImageUpdate = false;
                                      });
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(content: Text('Profile updated')),
                                      );
                                      if (Navigator.of(context).canPop()) {
                                        Navigator.of(context).pop();
                                      }
                                      return;
                                    } catch (e, st) {
                                      logger.e('Update failed: $e', stackTrace: st);
                                      if (mounted) {
                                        setState(() => _loading = false);
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          const SnackBar(content: Text('Failed to update profile')),
                                        );
                                      }
                                      return;
                                    }
                                  }

                                  // Create profile path
                                  try {
                                    // Ensure permission requested
                                    if (!await Geolocator.isLocationServiceEnabled()) {
                                      await Geolocator.requestPermission();
                                    }
                                    final data = await Geolocator.getCurrentPosition();
                                    final myLocation = GeoFirePoint(GeoPoint(data.latitude, data.longitude));

                                    // Fallback if user typed date, parse it
                                    _selectedDate ??= _dobController.text.isNotEmpty
                                        ? DateFormat.yMd().parse(_dobController.text)
                                        : null;
                                    if (_selectedDate == null) {
                                      throw Exception('Please select your Date of Birth');
                                    }
                                    final int age = calculateAge(_selectedDate!);

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

                                    final user = UserModel(
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
                                      position: GeoPointData(
                                        geopoint: [
                                          myLocation.geopoint.longitude,
                                          myLocation.geopoint.latitude,
                                        ],
                                      ),
                                    );

                                    await ref.read(Dependency.profileProvider).createUserDoc(user);

                                    if (!mounted) return;
                                    // After creating profile, take user to onboarding flow
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (_) => const ProfileOnboardingView(),
                                      ),
                                    );
                                  } catch (e, st) {
                                    logger.e('Create failed: $e', stackTrace: st);
                                    _bioController.clear();
                                    _usernameController.clear();
                                    _dobController.clear();
                                    _formKey.currentState!.reset();
                                    if (mounted) {
                                      setState(() {
                                        _loading = false;
                                      });
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(content: Text('Failed to create profile')),
                                      );
                                    }
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
