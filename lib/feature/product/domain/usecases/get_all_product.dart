import 'package:either_dart/either.dart';
import 'package:prueba_tecnica_orn/core/config/helpers/errors/invalid_data.dart';
import 'package:prueba_tecnica_orn/feature/product/domain/entities/product_entity.dart';
import 'package:prueba_tecnica_orn/feature/product/domain/repositories/product_repository.dart';

class GetAllProductsUseCase {
  ProductRepository productsRepository;
  GetAllProductsUseCase({
    required this.productsRepository,
  });

  Future<Either<InvalidData, List<ProductEntity>>>
      fetchProductsCall() async {
    return await productsRepository.fetchProducts();
  }
}
