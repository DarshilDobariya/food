import 'package:food/model/model.dart';

abstract class BaseProductRepository {
  Stream<List<Product>> getAllProducts();
}
