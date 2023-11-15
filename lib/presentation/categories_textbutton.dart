import 'package:burger_king/domain/model/category.dart';
import 'package:flutter/material.dart';

class CategoriesTextButton extends StatelessWidget {

  final Category _category;
  final int selectedIndex;

  const CategoriesTextButton(this._category, this.selectedIndex, {super.key});


  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {

        },
        style: TextButton.styleFrom(
          backgroundColor: selectedIndex == _category.id ? const Color.fromRGBO(228, 200, 64,1.00) : Colors.transparent,
        ),
        child: Text(_category.name,
          style: TextStyle(
            color: selectedIndex == _category.id ? Colors.black : Colors.white30,
            fontWeight: selectedIndex == _category.id ? FontWeight.w600 : FontWeight.normal,
            fontSize: 15,
          ),
        )
    );
  }
}
