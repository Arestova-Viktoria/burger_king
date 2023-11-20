
import 'package:flutter/material.dart';

import '../../domain/model/product.dart';


class CatalogGridItem extends StatelessWidget {

  final Product _product;

  const CatalogGridItem(this._product, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        color: const Color.fromRGBO(48, 48, 48,1.00),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 8,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(_product.image),
                  ),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 3,
              fit: FlexFit.tight,
              child: Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                child: Text(_product.title,
                  textAlign: TextAlign.start,
                  maxLines: 2,
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            Flexible(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(10, 3, 10, 0),
                  child: Text("${_product.price.toInt()} ₽",
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                )
            ),
          ],
        )
    );
  }
}

