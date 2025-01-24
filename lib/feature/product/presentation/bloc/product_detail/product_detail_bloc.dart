import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica_orn/core/config/helpers/injector/injector.dart';
import 'package:prueba_tecnica_orn/feature/product/domain/entities/product_entity.dart';
import 'package:prueba_tecnica_orn/feature/product/domain/usecases/get_by_id_product_use_case.dart';

part 'product_detail_event.dart';
part 'product_detail_state.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  ProductDetailBloc() : super(ProductDetailInitial()) {
    final getProductById = Injector.resolve<GetByIdProductsUseCase>();

    on<GetProductByIdEvent>((event, emit) async {
      emit(ProductDetailLoading());
      final response = await getProductById.fetchProductByIdCall(id: event.id);

      response.fold((error) {
        emit(ProductDetailError(message: error.message!));
      }, (product) {
        emit(ProductDetailLoadedById(product: product));
      });
    });
  }
}
