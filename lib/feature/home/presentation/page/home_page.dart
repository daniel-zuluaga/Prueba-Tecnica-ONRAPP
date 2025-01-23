import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica_orn/core/utils/colors.dart';
import 'package:prueba_tecnica_orn/core/widgets/button_widget.dart';
import 'package:prueba_tecnica_orn/core/widgets/text_widget.dart';
import 'package:prueba_tecnica_orn/feature/product/presentation/bloc/product_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

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
            return ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      width: double.infinity,
                      height: 10.h,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                );
              },
            );
          } else if (state is ProductLoaded) {
            return ListView.builder(
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                final product = state.products[index];
                return Card(
                  margin: const EdgeInsets.all(16),
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: const BorderSide(
                      color: Colors.grey,
                      width: 2,
                    ),
                  ),
                  elevation: 4,
                  child: ListTile(
                    leading: Container(
                      width: 12.w,
                      height: 12.h,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(product.image),
                          fit: BoxFit.contain,
                          scale: 2
                        ),
                      ),
                    ),
                    title: TextWidget(
                      text: product.title,
                      style: TextStyle(fontSize: 15.sp),
                      fontWeight: FontWeight.w400,
                      textAlign: TextAlign.start,
                      color: Colors.black,
                      maxLines: 4,
                    ),
                    subtitle: Column(
                      children: [
                        SizedBox(height: 1.h),
                        TextWidget(
                          text: product.description,
                          style: TextStyle(fontSize: 14.sp),
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.start,
                          color: Colors.grey.shade800,
                          maxLines: 2,
                        ),
                        SizedBox(height: 1.5.h),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: TextWidget(
                            text: "\$${product.price.toStringAsFixed(2)}",
                            style: TextStyle(fontSize: 16.sp),
                            fontWeight: FontWeight.w400,
                            textAlign: TextAlign.start,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 1.5.h),
                      ],
                    ),
                  ),
                );
              },
            );
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
