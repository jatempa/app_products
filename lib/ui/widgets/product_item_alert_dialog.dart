import 'package:flutter/material.dart';

import 'package:app_products/models/Product.dart';
import 'package:app_products/ui/widgets/product_image.dart';

class ProductItemAlertDialog extends StatefulWidget {
  final Product product;

  const ProductItemAlertDialog({Key? key, required this.product}) : super(key: key);

  @override
  _ProductItemAlertDialogState createState() => _ProductItemAlertDialogState();
}

class _ProductItemAlertDialogState extends State<ProductItemAlertDialog> {

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('${widget.product.name}'),
      content: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          ProductImage(url: widget.product.image),
          Text('${widget.product.description}'),
        ],
      ),
      actions: [],
    );
  }
}