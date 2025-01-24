import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica_orn/core/utils/colors.dart';
import 'package:prueba_tecnica_orn/core/widgets/button_widget.dart';
import 'package:prueba_tecnica_orn/core/widgets/text_widget.dart';
import 'package:prueba_tecnica_orn/feature/product/presentation/bloc/product_list/product_bloc.dart';
import 'package:prueba_tecnica_orn/feature/product/presentation/widgets/list_products_widget.dart';
import 'package:prueba_tecnica_orn/feature/product/presentation/widgets/shimmer_skeleton_products.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProductBloc>(context).add(GetAllProductsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Productos'),
        backgroundColor: Colors.green.shade100,
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return const ShimmerSkeletonLoadinProducts();
          } else if (state is ProductLoaded) {
            return ListProductWidget(products: state.products);
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 48),
                  const Icon(
                    Icons.error_outline_rounded,
                    size: 70,
                    color: PTColors.error,
                  ),
                  const SizedBox(height: 24),
                  TextWidget(
                    text: state is ProductError
                        ? state.message
                        : 'Ocurrió un error inesperado',
                    style: TextStyle(fontSize: 16.sp),
                    fontWeight: FontWeight.w400,
                    textAlign: TextAlign.start,
                    color: Colors.black,
                    maxLines: 4,
                  ),
                  const SizedBox(height: 24),
                  ButtonWidget(
                    width: 50.w,
                    height: 5.h,
                    onTap: () {
                      BlocProvider.of<ProductBloc>(context)
                          .add(GetAllProductsEvent());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green.shade100,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Text(
                      'Reintentar',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
