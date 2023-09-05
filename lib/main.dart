import 'package:ecfisher/login_screen.dart';
import 'package:woocommerce_api/woocommerce_api.dart';

import '../core/app_theme.dart';
import '../src/view/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/app_data.dart';
import 'src/controller/api.dart';
import 'src/controller/product_controller.dart';
import 'src/model/product.dart';

void main() {
  runApp(MyApp());
}

final ProductController c = Get.put(ProductController());

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // getproducts() async {
  //   AppData.products.clear();
  //   var demodata;
  //   // Initialize the API
  //   WooCommerceAPI wooCommerceAPI = WooCommerceAPI(
  //       url: "http://3.227.244.140/wordpress",
  //       consumerKey: "ck_1477ecbbcfba5136a880ad42f0e056d31feac63e",
  //       consumerSecret: "cs_d1ddcde952b27c8d0671213d512aa302b775dae3");

    // Get data using the "products" endpoint
  //   var products = await wooCommerceAPI.getAsync("products");

  //   for (var i in products) {
  //     demodata = AppData.products;
  //     AppData.products.add(Product(
  //         name: i["name"],
  //         price: i["regular_price"] is double
  //             ? i["regular_price"]
  //             : double.parse(i["regular_price"] == "" ? "0" : i["regular_price"].toString()),
  //         about: i["description"],
  //         isAvailable: true,
  //         off: i["price"] is double
  //             ? i["price"]
  //             : double.parse(i["price"] == "" ? "0" : i["price"].toString()),
  //         quantity: 0,
  //         images: [i["images"][0]["src"]],
  //         isLiked: true,
  //         rating: i["rating_count"] is double
  //             ? i["rating_count"]
  //             : double.parse(
  //                 i["rating_count"] == "" ? "0" : i["rating_count"].toString()),
  //         type: ProductType.seeFish));
  //   }
  //   c.allProducts.value = demodata;
  // }

  @override
  Widget build(BuildContext context) {
    // getproducts();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      theme: AppTheme.lightAppTheme,
    );
  }
}
