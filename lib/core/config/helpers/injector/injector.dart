import 'package:kiwi/kiwi.dart';
import 'package:prueba_tecnica_orn/feature/product/data/datasources/product_data_source.dart';
import 'package:prueba_tecnica_orn/feature/product/data/repositories/product_repository_impl.dart';
import 'package:prueba_tecnica_orn/feature/product/domain/repositories/product_repository.dart';
import 'package:prueba_tecnica_orn/feature/product/domain/usecases/get_all_product.dart';

part 'injector.g.dart';

abstract class Injector {
  static KiwiContainer container = KiwiContainer();
  static void setup() {
    var injector = _$Injector();
    injector._configure();
  }

  static final resolve = container.resolve;

  //The repositories and their implementation, the use case and the datasource must always be registered.
  //If two or more use cases depend on the same repositories and datasource, only the new use case should be registered, since the rest will already be registered.

  //When you finish registering the new use case, you must run the following command in the console
  // flutter packages pub run build_runner build
  //If it fails, you must run the following command
  // flutter packages pub run build_runner build --delete-conflicting-outputs
  //The second command will overwrite the injector.g.dart file if necessary

  //A new factory configuration must be created every time there is a new repository and datasource.

  void _configure() {
    _configureProductModule();
  }

  void _configureProductModule() {
    _configureProductsFactories();
  }

  @Register.factory(ProductRepository, from: ProductRepositoryImpl)
  @Register.factory(ProductDataSource)
  @Register.factory(GetAllProductsUseCase)
  void _configureProductsFactories();
}
