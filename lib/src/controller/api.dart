import 'package:woocommerce_api/woocommerce_api.dart';

 getProducts() async {
  // Initialize the API
  WooCommerceAPI wooCommerceAPI = WooCommerceAPI(
      url: "http://3.227.244.140/wordpress",
      consumerKey: "ck_1477ecbbcfba5136a880ad42f0e056d31feac63e",
      consumerSecret: "cs_d1ddcde952b27c8d0671213d512aa302b775dae3");

  // Get data using the "products" endpoint
  var products = await wooCommerceAPI.getAsync("products");
  var bala = "JJJ";
  return products;
}
