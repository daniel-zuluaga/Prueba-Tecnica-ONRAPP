import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica_orn/core/config/helpers/injector/injector.dart';
import 'package:prueba_tecnica_orn/feature/product/domain/entities/product_entity.dart';
import 'package:prueba_tecnica_orn/feature/product/domain/usecases/get_all_product_use_case.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    final getAllProduct = Injector.resolve<GetAllProductsUseCase>();

    on<GetAllProductsEvent>((event, emit) async{
      emit(ProductLoading());
      final response = await getAllProduct.fetchProductsCall();

      response.fold((error) {
        emit(ProductError(message: error.message!));
      }, (products) {
        emit(ProductLoaded(products: products));
      });
    });
  }
}
