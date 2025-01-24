part of 'product_detail_bloc.dart';

abstract class ProductDetailState extends Equatable {
  const ProductDetailState();
  
  @override
  List<Object> get props => [];
}

class ProductDetailInitial extends ProductDetailState {}

class ProductDetailLoading extends ProductDetailState {}

class ProductDetailLoadedById extends ProductDetailState {
  final ProductEntity product;

  const ProductDetailLoadedById({required this.product});

  @override
  List<Object> get props => [product];
}

class ProductDetailError extends ProductDetailState {
  final String message;

  const ProductDetailError({required this.message});

  @override
  List<Object> get props => [message];
}