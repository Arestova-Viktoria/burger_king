
import 'package:burger_king/domain/model/category.dart';
import 'package:flutter/material.dart';


class CategoriesTextButton extends StatefulWidget {

  final Category _category;

  const CategoriesTextButton(this._category, {super.key});

  @override
  State<CategoriesTextButton> createState() => _CategoriesTextButtonState();
}

class _CategoriesTextButtonState extends State<CategoriesTextButton> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          //по нажатию должна обновляться информация в grid, но как хз
        },
        //стили тоже по-другому надо настроить
        style: TextButton.styleFrom(
          backgroundColor: selectedIndex == widget._category.id ? const Color.fromRGBO(228, 200, 64,1.00) : Colors.transparent,
        ),
        child: Text(widget._category.name,
          style: TextStyle(
            color: selectedIndex == widget._category.id ? Colors.black : Colors.white30,
            fontWeight: selectedIndex == widget._category.id ? FontWeight.w600 : FontWeight.normal,
            fontSize: 15,
          ),
        )
    );
  }
}
