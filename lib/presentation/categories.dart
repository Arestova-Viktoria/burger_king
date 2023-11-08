import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List categoriesList = ["Популярные блюда","Комбо","Креветки","Гриль","Бургеры"];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoriesList.length,
        itemBuilder: (BuildContext context, int index){
          return TextButton(
              onPressed: () {

              },
              style: TextButton.styleFrom(
                backgroundColor: selectedIndex == index ? Color.fromRGBO(228, 200, 64,1.00) : Colors.transparent,
              ),
              child: Text(categoriesList[index],
                style: TextStyle(
                  color: selectedIndex == index ? Colors.black : Colors.white30,
                  fontWeight: selectedIndex == index ? FontWeight.w600 : FontWeight.normal,
                  fontSize: 15,
                ),
              )
          );
        });
  }
}