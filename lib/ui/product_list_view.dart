import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

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
        : Text("${model.products}"),
      ),
    );
  }
}