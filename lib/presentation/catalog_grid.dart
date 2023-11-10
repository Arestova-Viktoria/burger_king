import 'package:flutter/material.dart';

import '../domain/model/product.dart';
import 'catalog_card.dart';

class CatalogGrid extends StatelessWidget {

  final List<Product> _listProducts;

  const CatalogGrid(this._listProducts, {super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 5,
        childAspectRatio: 1,
        crossAxisSpacing: 5,
        mainAxisExtent: 275,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 15,
      ),
      children: [
        ..._listProducts.map((product) => CatalogCard(product))
      ],
    );
  }
}
