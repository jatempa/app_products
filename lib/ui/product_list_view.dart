import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'package:app_products/models/Product.dart';
import 'package:app_products/ui/product_item_view.dart';
import 'package:app_products/ui/product_list_viewmodel.dart';

class ProductListView extends StatelessWidget {
  const ProductListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProductListViewModel>.reactive(
      viewModelBuilder: () => ProductListViewModel(),
      onModelReady: (model) => model.fetchProducts(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text(model.title),
        ),
        body: (model.isBusy)
        ? Center(
            child: CircularProgressIndicator(),
          )
        : _buildList(model.products),
      ),
    );
  }

  Widget _buildList(List<Product>?  products) {
    if (products?.length == 0)
      return Center(child: Text("There is no products to show"));

    return ListView.builder(
      itemCount: products?.length,
      itemBuilder: (context, index) {
        return ProductItemView(product: products![index]);
      },
    );
  }
}