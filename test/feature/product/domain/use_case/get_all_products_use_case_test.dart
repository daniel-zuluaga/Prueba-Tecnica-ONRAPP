import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:prueba_tecnica_orn/core/config/helpers/errors/invalid_data.dart';
import 'package:prueba_tecnica_orn/feature/product/domain/entities/product_entity.dart';
import 'package:prueba_tecnica_orn/feature/product/domain/repositories/product_repository.dart';
import 'package:prueba_tecnica_orn/feature/product/domain/usecases/get_all_product_use_case.dart';

class MockProductRepository extends Mock implements ProductRepository {}

void main() {
  late GetAllProductsUseCase getAllProductsUseCase;
  late MockProductRepository mockProductRepository;

  setUp(() {
    mockProductRepository = MockProductRepository();
    getAllProductsUseCase =
        GetAllProductsUseCase(productsRepository: mockProductRepository);
  });

  final List<ProductEntity> mockProducts = [
    ProductEntity(
      id: 1,
      title: "Product 1",
      description: "Description 1",
      price: 10.0,
      category: "Category 1",
      image: "https://media.giphy.com/media/oMCNFgAqqFdjq/giphy.gif?cid=790b7611m0g9f4agmoznlpf964p1m5bwwxfa88y9u4e2oc5g&ep=v1_gifs_search&rid=giphy.gif&ct=g",
      rating: RatingEntity(rate: 4.5, count: 120),
    ),
    ProductEntity(
      id: 2,
      title: "Product 2",
      description: "Description 2",
      price: 20.0,
      category: "Category 2",
      image: "https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExbTBnOWY0YWdtb3pubHBmOTY0cDFtNWJ3d3hmYTg4eTl1NGUyb2M1ZyZlcD12MV9naWZzX3NlYXJjaCZjdD1n/3HBVUHV6Y67jhX0LHz/giphy.gif",
      rating: RatingEntity(rate: 4.0, count: 10),
    ),
  ];

  group(
    'Unit test of the services of products, get an product by id service',
    () {
      test(
          "should return a list of products when the repository call is successful",
          () async {
        when(() => mockProductRepository.fetchProducts())
            .thenAnswer((_) async => Right(mockProducts));

        final result = await getAllProductsUseCase.fetchProductsCall();

        expect(result.isRight, true);
        result.fold(
          (error) => fail("Expected success but got error"),
          (products) => expect(products, mockProducts),
        );
      });

      test("should return an error when the repository call fails", () async {
        when(() => mockProductRepository.fetchProducts()).thenAnswer(
          (_) async => Left(InvalidData(message: "Network Error")),
        );

        final result = await getAllProductsUseCase.fetchProductsCall();

        expect(result.isLeft, true);
        result.fold(
          (error) => expect(error.message, "Network Error"),
          (_) => fail("Expected error but got success"),
        );
      });
    },
  );
}
