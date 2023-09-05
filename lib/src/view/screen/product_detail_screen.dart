
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../core/app_color.dart';
import '../../controller/product_controller.dart';
import '../../model/product.dart';
import 'product_img.dart';

final ProductController controller = Get.put(ProductController());

class ProductDetailScreen extends StatelessWidget {
  final PageController _pageController = PageController(initialPage: 0);


  final Product product;
  

  ProductDetailScreen(this.product, {Key? key}) : super(key: key);

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          controller.productImageDefaultIndex.value = 0;
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget productPageView(double width, double height,BuildContext context) {
  double scrwidth = MediaQuery.of(context).size.width;
  double scrheight = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.42,
      width: width,
      decoration: const BoxDecoration(
        color: Color(0xFFE5E6E8),
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(200),
          bottomLeft: Radius.circular(200),
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: height * 0.32,
            child: PageView.builder(
              itemCount: product.images.length,
              controller: _pageController,
              onPageChanged: controller.switchBetweenProductImages,
              itemBuilder: (_, index) {
                return FittedBox(
                  fit: BoxFit.none,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    width: (200/ 375.0) * scrwidth,
                    height: (100/ 375.0) *scrheight,
                   
                    child: InkWell(
          onTap: (() {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProdectImage(image: product.images[index],)));
          }),
          child: Image.network(product.images[index],fit: BoxFit.fill,)),
                  ),
                );
              },
            ),
          ),
          Obx(
            () => SmoothIndicator(
                effect: const WormEffect(
                    dotColor: Colors.white,
                    activeDotColor: AppColor.theme),
                offset: controller.productImageDefaultIndex.value.toDouble(),
                count: product.images.length),
          )
        ],
      ),
    );
  }

  Widget _ratingBar(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: 
        List.generate(5, (index) {
        return Icon(
           Icons.star_border,
           color: Colors.amber,
           size:48,
        );
        })
        // RatingBar.builder(
        //     initialRating: product.rating,
        //     direction: Axis.horizontal,
        //     itemBuilder: (_, index) {
        //       return const Icon(Icons.star, color: AppColor.theme,);
        //     },
        //     onRatingUpdate: (rating) {}),
        // const SizedBox(width: 30),
        // Text(
        //   "(4500 Reviews)",
        //   style: Theme.of(context)
        //       .textTheme
        //       .headline3
        //       ?.copyWith(fontWeight: FontWeight.w300),
        // )
      
    );
  }

  Widget productSizesListView() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: controller.sizeType(product).length,
      itemBuilder: (_, index) {
        return InkWell(
          onTap: () {
            controller.switchBetweenProductSizes(product, index);
          },
          child: Container(
            margin: const EdgeInsets.only(right: 5, left: 5),
            alignment: Alignment.center,
            width: controller.isNominal(product) ? 40 : 70,
            decoration: BoxDecoration(
                color: controller.sizeType(product)[index].isSelected == false
                    ? Colors.white
                    : AppColor.light,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColor.light)),
            child: FittedBox(
              child: Text(
                //Map<String,bool>
                controller.sizeType(product)[index].numerical,
                style:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: _appBar(context),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              productPageView(width, height,context),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: TextStyle(color: AppColor.theme,
                              fontWeight: FontWeight.bold,fontSize: 20),
                    ),
                    const SizedBox(height: 10),
                    _ratingBar(context),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          product.off != null
                              ? "₹${product.off}"
                              : "₹${product.price}",
                          //   style: const TextStyle(
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        const SizedBox(width: 3),
                        Visibility(
                          visible: product.off != null ? true : false,
                          child: Text(
                            "₹${product.price}",
                            style: const TextStyle(
                              decoration: TextDecoration.lineThrough,
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Text(
                          product.isAvailable
                              ? "Available in stock"
                              : "Not available",
                      style: TextStyle(color: AppColor.theme,
                              fontWeight: FontWeight.bold,fontSize: 20),
                        )
                      ],
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      "About :",
                      style: TextStyle(color: AppColor.theme,
                              fontWeight: FontWeight.bold,fontSize: 20),
                      
                    ),
                    const SizedBox(height: 10),
                    Text(product.about),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 40,
                      child: GetBuilder<ProductController>(
                        builder: (ProductController controller) {
                          return productSizesListView();
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        child: const Text("Add to cart"),
                        onPressed: product.isAvailable
                            ? () => controller.addToCart(product)
                            : null,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
