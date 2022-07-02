import 'package:aftab_neo_store/app/components/widgets/appbar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class EditProfileView extends GetView {
  const EditProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:customAppBar(text: "Edit Profile"),
      body: Center(
        child: Text(
          'EditProfileView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
