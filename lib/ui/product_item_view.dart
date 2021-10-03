import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'package:app_products/models/Product.dart';
import 'package:app_products/ui/product_item_viewmodel.dart';

class ProductItemView extends StatelessWidget {
  final Product? product;

  const ProductItemView({Key? key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProductItemViewModel>.reactive(
      viewModelBuilder: () => ProductItemViewModel(),
      builder: (context, model, child) => Card(
        elevation: 0,
        child: Text("${product?.name}"),
      )
    );
  }
}