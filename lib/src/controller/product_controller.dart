import 'package:ecfisher/core/extensions.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import '../../core/app_data.dart';
import '../model/numerical.dart';
import '../model/product.dart';
import '../model/product_category.dart';
import '../model/product_size_type.dart';

class ProductController extends GetxController {
  RxList<Product> allProducts = AppData.products.obs;
  RxList<Product> filteredProducts = AppData.products.obs;
  RxList<Product> cartProducts = <Product>[].obs;
  RxList<ProductCategory> categories = AppData.categories.obs;
  int length = EnumToString.toList(ProductType.values).length;
  RxInt totalPrice = 0.obs;
  RxInt currentBottomNavItemIndex = 0.obs;
  RxInt productImageDefaultIndex = 0.obs;

  void filterItemsByCategory(int index) {
    for (ProductCategory element in categories) {
      element.isSelected = false;
    }
    categories[index].isSelected = true;
    update();

    if (categories[index].type == ProductType.all) {
      filteredProducts.assignAll(allProducts);
    } else {
      filteredProducts.assignAll(allProducts.where((item) {
        return item.type == categories[index].type;
      }).toList());
    }
    filteredProducts.refresh();
  }

  void isLiked(int index) {
    filteredProducts[index].isLiked = !filteredProducts[index].isLiked;
    filteredProducts.refresh();
  }

  void addToCart(Product product) {
    product.quantity++;
    cartProducts.add(product);
    cartProducts.assignAll(cartProducts.distinctBy((item) => item));
    calculateTotalPrice();
  }

  void increaseItem(int index) {
    Product product = cartProducts[index];
    product.quantity++;
    calculateTotalPrice();
    update();
  }

  bool get isZeroQuantity {
    return cartProducts.any(
      (element) {
        return element.price.compareTo(0) == 0 ? true : false;
      },
    );
  }

  bool isPriceOff(Product product) {
    if (product.off != null) {
      return true;
    } else {
      return false;
    }
  }

  bool get isEmptyCart {
    if (cartProducts.isEmpty || isZeroQuantity) {
      return true;
    } else {
      return false;
    }
  }

  bool isNominal(Product product) {
    if (product.sizes?.numerical != null) {
      return true;
    } else {
      return false;
    }
  }

  void decreaseItem(int index) {
    Product product = cartProducts[index];
    if (product.quantity > 0) {
      product.quantity--;
    }
    calculateTotalPrice();
    update();
  }

  void calculateTotalPrice() {
    totalPrice.value = 0;
    for (var element in cartProducts) {
      if (isPriceOff(element)) {
        totalPrice.value += element.quantity * element.off!.toInt();
      } else {
        totalPrice.value += element.quantity * element.price.toInt();
      }
    }
  }

  void switchBetweenBottomNavigationItems(int index) {
    if (index == 0) {
      filteredProducts.assignAll(allProducts);
    }
    if (index == 1) {
      getLikedItems();
    } if (index == 2) {
      filteredProducts.assignAll(allProducts);
    }
    if (index == 3) {
      cartProducts.assignAll(allProducts.where((item) => item.quantity > 0));
    }

    currentBottomNavItemIndex.value = index;
  }

  void switchBetweenProductImages(int index) {
    productImageDefaultIndex.value = index;
  }

  void getLikedItems() {
    filteredProducts.assignAll(allProducts.where((item) => item.isLiked));
  }

  List<Numerical> sizeType(Product product) {
    ProductSizeType? productSize = product.sizes;
    List<Numerical> numericalList = [];

    if (productSize?.numerical != null) {
      for (var element in productSize!.numerical!) {
        numericalList.add(Numerical(element.numerical, element.isSelected));
      }
    }

    if (productSize?.categorical != null) {
      for (var element in productSize!.categorical!) {
        numericalList
            .add(Numerical(element.categorical.name, element.isSelected));
      }
    }

    return numericalList;
  }

  void switchBetweenProductSizes(Product product, int index) {
    sizeType(product).forEach((element) {
      element.isSelected = false;
    });

    if (product.sizes?.categorical != null) {
      for (var element in product.sizes!.categorical!) {
        element.isSelected = false;
      }

      product.sizes?.categorical![index].isSelected = true;
    }

    if (product.sizes?.numerical != null) {
      for (var element in product.sizes!.numerical!) {
        element.isSelected = false;
      }

      product.sizes?.numerical![index].isSelected = true;
    }

    update();
  }

  String getCurrentSize(Product product) {
    String currentSize = "";
    if (product.sizes?.categorical != null) {
      for (var element in product.sizes!.categorical!) {
        if (element.isSelected) {
          currentSize = "Size:" + element.categorical.name.toString();
        }
      }
    }

    if (product.sizes?.numerical != null) {
      for (var element in product.sizes!.numerical!) {
        if (element.isSelected) {
          currentSize = "Size:" + element.numerical;
        }
      }
    }
    return currentSize;
  }
}
