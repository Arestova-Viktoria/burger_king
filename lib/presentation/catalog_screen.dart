import 'package:burger_king/presentation/catalog.dart';
import 'package:flutter/material.dart';

import 'categories.dart';


class CatalogScreen extends StatefulWidget {
  const CatalogScreen({Key? key}) : super(key: key);

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Бургер Кинг", style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500
        ),),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.keyboard_backspace),
          onPressed: () {  },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () {  },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(left: 15,top: 5,bottom: 5),
            height: 52,
            child: const Categories(),
          ),
          const Expanded(child: Catalog())
        ],
      ),
    );
  }
}

