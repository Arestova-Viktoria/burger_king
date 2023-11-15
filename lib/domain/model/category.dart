
class Category{
  static const idMap = "category_id";
  static const nameMap = "category_name";

  final int id;
  final String name;

  Category({
    required this.id,
    required this.name
  });

  Category.fromMap(Map<String, dynamic> map):
        id = map [idMap],
        name = map [nameMap];
}