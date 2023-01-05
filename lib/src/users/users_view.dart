import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../profile/controller/profile_controller.dart';

class UsersView extends ConsumerWidget {
  const UsersView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final userData =
        ref.watch(ProfileController.userControllerProvider).userModel;

    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar.medium(
          centerTitle: true,
          pinned: true,
          // floating: false,
          titleSpacing: 50,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              // radius: 2,
              backgroundImage: NetworkImage(userData!.profileUrl!),
            ),
          ),
          title: Text(userData.name),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
          ],
        ),
        SliverToBoxAdapter(
          child: Container(height: 1000, width: 100),
        )
      ]),
    );
  }
}
