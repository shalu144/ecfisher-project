import 'package:ecfisher/core/app_color.dart';
import 'package:flutter/material.dart';
import '../widget/product_grid_view.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.light,
      appBar: AppBar(
        backgroundColor: AppColor.theme,
        title: const Text(
          "Favorites",
          style:TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: ProductGridView(),
      ),
    );
  }
}
