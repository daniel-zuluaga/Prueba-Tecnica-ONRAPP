

import 'package:either_dart/either.dart';
import 'package:prueba_tecnica_orn/core/config/helpers/errors/invalid_data.dart';
import 'package:prueba_tecnica_orn/feature/product/data/datasources/product_data_source.dart';
import 'package:prueba_tecnica_orn/feature/product/data/models/product_model.dart';
import 'package:prueba_tecnica_orn/feature/product/domain/entities/product_entity.dart';
import 'package:prueba_tecnica_orn/feature/product/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductDataSource productsDataSource;

  ProductRepositoryImpl({
    required this.productsDataSource,
  });

  @override
  Future<Either<InvalidData, List<ProductEntity>>> fetchProducts() async {
    try {
      final List<ProductModel> response = await productsDataSource.fetchProducts();
      return Right(response);
    } on InvalidData catch (invalidData) {
      return Left(invalidData);
    }
  }

  @override
  Future<Either<InvalidData, ProductEntity>> fetchProductById({required String id}) async {
    try {
      final ProductEntity response = await productsDataSource.fetchProductById(id: id);
      return Right(response);
    } on InvalidData catch (invalidData) {
      return Left(invalidData);
    }
  }
}
