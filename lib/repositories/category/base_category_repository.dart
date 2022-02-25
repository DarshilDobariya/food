import 'package:food/model/model.dart';

abstract class BaseCategoryRepository{
  Stream<List<Category>> getAllCategories();
}