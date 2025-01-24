part of 'product_detail_bloc.dart';

abstract class ProductDetailEvent extends Equatable {
  const ProductDetailEvent();

  @override
  List<Object> get props => [];
}

class GetProductByIdEvent extends ProductDetailEvent {
  final String id;

  const GetProductByIdEvent({required this.id});

  @override
  List<Object> get props => [id];
}

