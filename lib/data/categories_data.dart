

class CategoriesData{
  final List<Map<String, dynamic>> _listCategories = [
    {
      "category_id": 0,
      "category_name": "Популярные блюда",
    },
    {
      "category_id": 1,
      "category_name": "Комбо",
    },
    {
      "category_id": 2,
      "category_name": "Креветки",
    },
    {
      "category_id": 3,
      "category_name": "Гриль",
    },
    {
      "category_id": 4,
      "category_name": "Напитки",
    },
  ];

  List<Map<String, dynamic>> get listCategories => _listCategories;
}