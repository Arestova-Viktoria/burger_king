// данные для 1 продукта, который будет отображаться на экране

class Product {
  static const ID = "product_id";
  static const TITLE = "product_title";
  static const IMAGE = "product_image";
  static const PRICE = "product_price";

  final int id;
  final String title;
  final String image;
  final double price;

  // int get id => _id;
  // String get title => _title;
  // String get image => _image;
  // double get price => _price;

  Product({
    required this.id,
    required this.title,
    required this.image,
    required this.price
  });

  Product.fromMap(dynamic map):
        id = map ["product_id"],
        title = map ["product_title"],
        image = map ["product_image"],
        price = map ["product_price"];
}