import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar.medium(
          flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text("Collapsing Toolbar",
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
            onPressed: () {},
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
                  const Text("username"),
                  const Text("bio"),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
