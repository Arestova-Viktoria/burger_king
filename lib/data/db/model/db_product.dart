// данные для 1 продукта в исходном состоянии (как в бд)

class DbProduct {
  static const ID = "product_id";
  static const TITLE = "product_title";
  static const IMAGE = "product_image";
  static const PRICE = "product_price";

  final int _id;
  final String _title;
  final String _image;
  final double _price;

  int get id => _id;
  String get title => _title;
  String get image => _image;
  double get price => _price;

  DbProduct(
      this._id,
      this._title,
      this._image,
      this._price
      );

  DbProduct.fromMap(dynamic map):
      _id = map [ID],
      _title = map [TITLE],
      _image = map [IMAGE],
      _price = map [PRICE];

  toMap () => {
    ID: id,
    TITLE: title,
    IMAGE: image,
    PRICE: price,
  };
}