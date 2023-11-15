
import 'package:burger_king/domain/model/category.dart';

abstract class CategoryRepository{
  List<Category> getListCategory();
}