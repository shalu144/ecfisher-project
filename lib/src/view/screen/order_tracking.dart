import 'package:flutter/material.dart';

import '../../../core/app_color.dart';

class OrderTracking extends StatelessWidget {
  const OrderTracking({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:AppColor.theme,
        title:Text("Order Tracking")
      ),
    );
  }
}