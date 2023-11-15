import 'package:burger_king/internal/dependencies/product_module.dart';
import 'package:burger_king/presentation/catalog/catalog_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/bloc/catalog_bloc.dart';


class Catalog extends StatefulWidget {
  const Catalog({Key? key}) : super(key: key);

  @override
  State<Catalog> createState() => _CatalogState();
}

class _CatalogState extends State<Catalog> {
  final CatalogBloc _catalogBloc = ProductModule.catalogBloc();

  @override
  void initState() {
    super.initState();
    _catalogBloc.add(RefreshCatalogEvent(categoryIndex: 0));
  }

  @override
  void dispose() {
    _catalogBloc.close();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return BlocListener<CatalogBloc,CatalogState>(
      bloc: _catalogBloc,
      listener: (context,state){
        if (state is ErrorCatalogState) {
          print("Ошибка");
        }
      },
      child: BlocBuilder<CatalogBloc,CatalogState>(
        bloc: _catalogBloc,
        builder: (context,state){
          if (state is ReadyCatalogState){
            return CatalogGrid(state.listProducts);
          }
          else{
            return const Text("Загрузка");
          }
        },

      ),
    );
  }
}
