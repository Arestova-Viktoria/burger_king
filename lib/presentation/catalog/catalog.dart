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

  @override
  Widget build(BuildContext context) {
    return BlocListener<CatalogBloc,CatalogState>(
      bloc: BlocProvider.of<CatalogBloc>(context),
      listener: (context,state){
        if (state is ErrorCatalogState) {
          print("Ошибка");
        }
      },
      child: BlocBuilder<CatalogBloc,CatalogState>(
        bloc: BlocProvider.of<CatalogBloc>(context),
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
