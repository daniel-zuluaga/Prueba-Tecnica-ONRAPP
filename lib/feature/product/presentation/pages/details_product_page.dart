import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_multi_formatter/formatters/formatter_utils.dart';
import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:prueba_tecnica_orn/core/utils/colors.dart';
import 'package:prueba_tecnica_orn/core/widgets/button_widget.dart';
import 'package:prueba_tecnica_orn/core/widgets/text_widget.dart';
import 'package:prueba_tecnica_orn/feature/product/presentation/bloc/product_detail/product_detail_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProductDetailPage extends StatefulWidget {
  final String productId;

  const ProductDetailPage({super.key, required this.productId});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProductDetailBloc>(context)
        .add(GetProductByIdEvent(id: widget.productId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalles del Producto"),
        backgroundColor: PTColors.success.shade100,
      ),
      body: BlocBuilder<ProductDetailBloc, ProductDetailState>(
        builder: (context, state) {
          if (state is ProductDetailLoading) {
            context.loaderOverlay.show();
            return const SizedBox();
          } else if (state is ProductDetailLoadedById) {
            context.loaderOverlay.hide();
            final product = state.product;
            return Padding(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 1.h),
                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          product.image,
                          width: 20.w,
                          height: 20.h,
                        ),
                      ),
                    ),
                    SizedBox(height: 1.h),
                    TextWidget(
                      text: product.title,
                      style: TextStyle(fontSize: 18.sp),
                      fontWeight: FontWeight.w600,
                      textAlign: TextAlign.start,
                      color: Colors.black,
                      maxLines: 10,
                    ),
                    SizedBox(height: 1.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWidget(
                          text: "Precio: ${toCurrencyString(
                            product.price.toString(),
                            mantissaLength: 2,
                            leadingSymbol: r'$',
                            useSymbolPadding: true,
                          )} USD",
                          style: TextStyle(fontSize: 16.sp),
                          fontWeight: FontWeight.w700,
                          textAlign: TextAlign.start,
                          color: Colors.black,
                          maxLines: 4,
                        ),
                        RichText(
                          text: TextSpan(
                            text: "★ ",
                            style: TextStyle(fontSize: 20.sp, color: Colors.yellow),
                            children: [
                              TextSpan(
                                text: "${product.rating.rate}",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 1.h),
                    TextWidget(
                      text: "Categoría: ${product.category}",
                      style: TextStyle(fontSize: 16.sp),
                      fontWeight: FontWeight.w500,
                      textAlign: TextAlign.start,
                      color: Colors.black,
                      maxLines: 4,
                    ),
                    SizedBox(height: 1.h),
                    TextWidget(
                      text: "Descripción: ${product.description}",
                      style: TextStyle(fontSize: 15.5.sp),
                      fontWeight: FontWeight.w500,
                      textAlign: TextAlign.start,
                      color: Colors.black,
                      maxLines: 50,
                    ),
                    SizedBox(height: 3.h),
                    Center(
                      child: ButtonWidget(
                        width: 50.w,
                        height: 5.h,
                        onTap: () {
                          context.pop();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green.shade100,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: const Text(
                          'Cerrar',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(height: 2.h),
                  ],
                ),
              ),
            );
          } else if (state is ProductDetailError) {
            context.loaderOverlay.hide();
            return Center(child: Text(state.message));
          }
          context.loaderOverlay.hide();
          return const Center(child: Text("Cargando..."));
        },
      ),
    );
  }
}
