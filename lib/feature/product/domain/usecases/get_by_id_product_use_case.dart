import 'package:either_dart/either.dart';
import 'package:prueba_tecnica_orn/core/config/helpers/errors/invalid_data.dart';
import 'package:prueba_tecnica_orn/feature/product/domain/entities/product_entity.dart';
import 'package:prueba_tecnica_orn/feature/product/domain/repositories/product_repository.dart';

class GetByIdProductsUseCase {
  ProductRepository productsRepository;
  GetByIdProductsUseCase({
    required this.productsRepository,
  });

  Future<Either<InvalidData, ProductEntity>>
      fetchProductByIdCall({required String id}) async {
    return await productsRepository.fetchProductById(id: id);
  }
}
