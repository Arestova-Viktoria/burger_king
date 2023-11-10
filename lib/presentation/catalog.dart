import 'package:burger_king/internal/dependencies/product_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/bloc/catalog_bloc.dart';


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
    _catalogBloc.add(RefreshCatalogEvent());
  }

  @override
  void dispose() {
    super.dispose();
    _catalogBloc.close();
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
            return _getGrid(state.listProducts);
          }
          else{
            return const Text("Загрузка");
          }
        },

      ),
    );
  }

  Widget _getGrid(listProducts){
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
          ...listProducts.map((product) => _getCard(product))
        ],
    );
  }

  Widget _getCard(product){
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
                    image: NetworkImage(product.image),
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
                child: Text(product.title,
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
                  child: Text(product.price.toInt().toString() + " ₽",
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
