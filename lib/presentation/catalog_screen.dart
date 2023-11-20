import 'package:burger_king/internal/dependencies/product_module.dart';
import 'package:burger_king/presentation/catalog/catalog.dart';
import 'package:flutter/material.dart';

import 'categories/categories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/bloc/catalog_bloc.dart';


class CatalogScreen extends StatefulWidget {
  const CatalogScreen({Key? key}) : super(key: key);

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  final CatalogBloc _catalogBloc = ProductModule.catalogBloc();

  @override
  void initState() {
    super.initState();
    _catalogBloc.add(FilterCatalogEvent(categoryIndex: 0));
  }

  @override
  void dispose() {
    _catalogBloc.close();
    super.dispose();
  }


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
      body: BlocProvider<CatalogBloc>(
          create: (context) => _catalogBloc,
          child: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(left: 15,top: 5,bottom: 5),
                height: 52,
                child: const Categories(),
              ),
              const Expanded(child: Catalog())
            ],
          ),
      ),
    );
  }
}

