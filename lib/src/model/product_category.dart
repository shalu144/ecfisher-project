
import 'package:flutter/material.dart';

import 'product.dart';

class ProductCategory {
  ProductType type;
  bool isSelected;
  IconData icon;

  ProductCategory(this.type, this.isSelected, this.icon);
}
