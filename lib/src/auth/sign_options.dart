import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';

class SignOptionsView extends StatelessWidget {
  const SignOptionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SignInScreen(
      providerConfigs: [
        EmailProviderConfiguration(),
        GoogleProviderConfiguration(clientId: ''),
      ],
    );
  }
}
