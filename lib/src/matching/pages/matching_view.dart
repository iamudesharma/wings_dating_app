import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:wings_dating_app/src/users/users_view.dart';

@RoutePage()
class MatchingView extends ConsumerStatefulWidget {
  const MatchingView({super.key});

  @override
  ConsumerState<MatchingView> createState() => _MatchingViewState();
}

class _MatchingViewState extends ConsumerState<MatchingView> with WidgetsBindingObserver {
  late StreamSubscription<List<ConnectivityResult>> connectivityStateSubscription;
  AppLifecycleState? appState;

  @override
  void initState() {
    super.initState();
    // Initialize connectivity subscription
    connectivityStateSubscription = Connectivity().onConnectivityChanged.listen((connectivityType) {
      // Handle connectivity changes
    });
    appState = WidgetsBinding.instance.lifecycleState;
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    connectivityStateSubscription.cancel();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator.adaptive(
        onRefresh: () async {
          // Refresh logic
        },
        child: ResponsiveBuilder(builder: (context, sizingInformation) {
          return Row(
            children: [
              NavigationBarWidget(
                sizingInformation: sizingInformation,
              ),
              Expanded(
                flex: 5,
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: AppBar(
                        title: const Text("Matching Users"),
                        actions: [
                          // Add search functionality if needed
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
