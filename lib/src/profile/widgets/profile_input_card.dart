import 'package:flutter/material.dart';

class ProfileInputCard extends StatelessWidget {
  const ProfileInputCard({
    super.key,
    required this.title,
    required this.value,
  });

  // final UserModel? userData;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return value == "Do not Show"
        ? const SizedBox.shrink()
        : Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Divider(),
              SizedBox(
                height: 50,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(title,
                        style: const TextStyle(
                          fontSize: 20,
                        )),
                    Text(value,
                        style: const TextStyle(
                          fontSize: 15,
                        )),
                  ],
                ),
              ),
            ],
          );
  }
}
