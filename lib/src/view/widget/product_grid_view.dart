import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../../../core/app_color.dart';
import '../../model/product.dart';
import '../screen/product_detail_screen.dart';
import 'open_container_wrapper.dart';

class ProductGridView extends StatelessWidget {
  const ProductGridView({Key? key}) : super(key: key);

  Widget _gridItemBody(Product product, BuildContext context) {
  double scrwidth = MediaQuery.of(context).size.width;
  double scrheight = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(padding: EdgeInsets.all(5),
        child:  Image.network(
            product.images[0],
          
        ),
      ),
    );
  }

  Widget _gridItemHeader(Product product, int index) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Visibility(
            visible: controller.isPriceOff(product),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30), color: AppColor.light),
              // width: 80,
              // height: 30,
              alignment: Alignment.center,
              child: const Text(
                "30% OFF",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.favorite,
              color: controller.filteredProducts[index].isLiked
                  ? AppColor.theme
                  : const Color(0xFFA6A3A0),
            ),
            onPressed: () => controller.isLiked(index),
          ),
        ],
      ),
    );
  }

  Widget _gridItemFooter(Product product, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(10),
        // height: 60,
        decoration: const BoxDecoration(
          color: AppColor.theme,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FittedBox(
              child: Text(
                product.name,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: const TextStyle(
                    fontWeight: FontWeight.w500, color: Colors.white),
              ),
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Text(
                  product.off != null
                      ? "₹${product.off}"
                      : "₹${product.price}",
                  style: Theme.of(context).textTheme.headline4,
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
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return GridView.builder(
          itemCount: controller.filteredProducts.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 10 / 16,
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10),
          itemBuilder: (_, index) {
            Product product = controller.filteredProducts[index];
            return OpenContainerWrapper(
                child: GridTile(
                  header: _gridItemHeader(product, index),
                  footer: _gridItemFooter(product, context),
                  child: _gridItemBody(product,context),
                ),
                product: product);
          },
        );
      },
    );
  }
}
