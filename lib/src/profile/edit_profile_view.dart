import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wings_dating_app/helpers/logger.dart';
import 'package:intl/intl.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Profile"),
      ),
      body: Column(
        children: [
          CircleAvatar(
            radius: 35,
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text("Change Profile Picture"),
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: "Username",
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: "Nickname",
            ),
          ),
          TextFormField(
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
        ],
      ),
    );
  }
}
