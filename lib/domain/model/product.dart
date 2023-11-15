// данные для 1 продукта, который будет отображаться на экране

class Product {
  static const idMap = "product_id";
  static const titleMap = "product_title";
  static const imageMap = "product_image";
  static const priceMap = "product_price";

  final int id;
  final String title;
  final String image;
  final double price;

  Product({
    required this.id,
    required this.title,
    required this.image,
    required this.price
  });

  Product.fromMap(Map<String, dynamic> map):
        id = map [idMap],
        title = map [titleMap],
        image = map [imageMap],
        price = map [priceMap];
}