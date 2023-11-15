

import 'package:burger_king/data/repository/category_data_repository.dart';
import 'package:burger_king/internal/dependencies/data_module.dart';

class CategoryRepositoryModule{
  static final categoryDataRepository =
      CategoryDataRepository(DataModule.categoriesData());
}