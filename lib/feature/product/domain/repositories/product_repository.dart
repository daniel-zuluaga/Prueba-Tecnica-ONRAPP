

import 'package:either_dart/either.dart';
import 'package:prueba_tecnica_orn/core/config/helpers/errors/invalid_data.dart';
import 'package:prueba_tecnica_orn/feature/product/domain/entities/product_entity.dart';

abstract class ProductRepository {
  Future<Either<InvalidData, List<ProductEntity>>> fetchProducts();
}
