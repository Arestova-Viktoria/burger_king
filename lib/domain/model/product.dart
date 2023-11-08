// данные для 1 продукта, который будет отображаться на экране

class Product {
  final int _id;
  final String _title;
  final String _image;
  final double _price;

  int get id => _id;
  String get title => _title;
  String get image => _image;
  double get price => _price;

  Product(
      this._id,
      this._title,
      this._image,
      this._price
      );

}