import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../routes/app_router.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar.medium(
          flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: const Text("username",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  )),
              background: Image.network(
                "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
                fit: BoxFit.cover,
              )),
          pinned: true,
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              AutoRouter.of(context).push( EditProfileRoute(isEditProfile: false));
            },
          ),

          actions: [
            IconButton(
              icon: const Icon(Icons.more_vert_outlined),
              onPressed: () {},
            ),
          ],
          // centerTitle: true,
          title: const Text("username"),
        ),
        SliverToBoxAdapter(
          child: Row(
            children: [
              const Card(
                child: Placeholder(
                  fallbackWidth: 100,
                  fallbackHeight: 100,
                ),
              ),

              // 10.h.,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("username"),
                  Text("bio"),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
