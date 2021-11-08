import 'package:flutter/material.dart';

import 'package:app_products/models/Product.dart';
import 'package:app_products/ui/widgets/product_image.dart';

class ProductDataSearch extends SearchDelegate<Product?> {
  final List<Product>? products;

  ProductDataSearch({required this.products});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
          showSuggestions(context);
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty ? [] : products!.where(
      (s) => s.name!.toLowerCase().contains(query)
    ).toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        final product = suggestionList[index];

        return Card(
          elevation: 0,
          child: ListTile(
            leading: ProductImage(url: product.image),
            title: Text("${product.name}"),
            onTap: () => close(context, product)
          )
        );
      },
    );
  }
}