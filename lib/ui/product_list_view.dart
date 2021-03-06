import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'package:app_products/models/Product.dart';
import 'package:app_products/ui/product_item_view.dart';
import 'package:app_products/ui/product_list_viewmodel.dart';
import 'package:app_products/ui/widgets/product_data_search.dart';
import 'package:app_products/ui/widgets/product_item_alert_dialog.dart';

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
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () async {
                final selectedProduct = await showSearch<Product?>(
                  context: context,
                  delegate: ProductDataSearch(products: model.products)
                );

                if (selectedProduct != null) {
                  showDialog(
                    barrierDismissible: true,
                    context: context,
                    builder: (context) => ProductItemAlertDialog(
                      product: selectedProduct
                    )
                  );
                }
              }
            )
          ],
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