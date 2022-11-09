import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar.medium(
          pinned: true,
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),

          actions: [
            IconButton(
              icon: const Icon(Icons.more_vert_outlined),
              onPressed: () {},
            ),
          ],
          // centerTitle: true,
          title: Text("username"),
        ),
        SliverToBoxAdapter(
          child: Row(
            children: [
              Card(
                child: Placeholder(
                  fallbackWidth: 100,
                  fallbackHeight: 100,
                ),
              ),
              // 10.h.,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
