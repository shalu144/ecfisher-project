import 'package:flutter/material.dart';

import '../../../core/app_color.dart';
import '../../../tect.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.light,
      appBar: AppBar(        backgroundColor: AppColor.theme,
    
        title: const Text("EC Fisher",
          style: TextStyle(
            fontSize: 20
          ,fontWeight: FontWeight.bold
          ),)),
      
      
      body:Center(child: Body())
    );
  }
}
