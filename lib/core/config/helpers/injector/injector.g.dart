// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'injector.dart';

// **************************************************************************
// KiwiInjectorGenerator
// **************************************************************************

class _$Injector extends Injector {
  @override
  void _configureProductsFactories() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerFactory<ProductRepository>((c) => ProductRepositoryImpl(
          productsDataSource: c.resolve<ProductDataSource>()))
      ..registerFactory((c) => ProductDataSource())
      ..registerFactory((c) => GetAllProductsUseCase(
          productsRepository: c.resolve<ProductRepository>()))
      ..registerFactory((c) => GetByIdProductsUseCase(
          productsRepository: c.resolve<ProductRepository>()));
  }
}
