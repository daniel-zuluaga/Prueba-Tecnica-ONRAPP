import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:prueba_tecnica_orn/core/config/helpers/errors/invalid_data.dart';
import 'package:prueba_tecnica_orn/feature/product/domain/entities/product_entity.dart';
import 'package:prueba_tecnica_orn/feature/product/domain/repositories/product_repository.dart';
import 'package:prueba_tecnica_orn/feature/product/domain/usecases/get_by_id_product_use_case.dart';

class MockProductRepository extends Mock implements ProductRepository {}

void main() {
  late GetByIdProductsUseCase getByIdProductsUseCase;
  
  late MockProductRepository mockProductRepository;

  setUp(() {
    mockProductRepository = MockProductRepository();
    getByIdProductsUseCase = GetByIdProductsUseCase(productsRepository: mockProductRepository);
  });

  final ProductEntity mockProduct = ProductEntity(
      id: 1,
      title: "Product 1",
      description: "Description 1",
      price: 10.0,
      category: "Category 1",
      image: "https://media.giphy.com/media/Ss024CyIIc2PVpY50r/giphy.gif?cid=790b7611m0g9f4agmoznlpf964p1m5bwwxfa88y9u4e2oc5g&ep=v1_gifs_search&rid=giphy.gif&ct=g",
      rating: RatingEntity(rate: 4.5, count: 120),
    );

  group(
    'Unit test of the services of products, get all product service',
    () {
      test(
          "should return a list of products when the repository call is successful",
          () async {
        const productId = 'id';
        when(() => mockProductRepository.fetchProductById(id: productId))
            .thenAnswer((_) async => Right(mockProduct));

        final result = await getByIdProductsUseCase.fetchProductByIdCall(id: productId);

        expect(result.isRight, true);
        result.fold(
          (error) => fail("Expected success but got error"),
          (product) => expect(product, mockProduct),
        );
      });

      test("should return an error when the repository call fails", () async {
        const productId = 'id';
        when(() => mockProductRepository.fetchProductById(id: productId)).thenAnswer(
          (_) async => Left(InvalidData(message: "Network Error")),
        );

        final result = await getByIdProductsUseCase.fetchProductByIdCall(id: productId);

        expect(result.isLeft, true);
        result.fold(
          (error) => expect(error.message, "Network Error"),
          (_) => fail("Expected error but got success"),
        );
      });
    },
  );
}
