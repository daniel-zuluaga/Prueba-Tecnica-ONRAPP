import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:go_router/go_router.dart';
import 'package:prueba_tecnica_orn/core/router/app_routes.dart';
import 'package:prueba_tecnica_orn/core/widgets/text_widget.dart';
import 'package:prueba_tecnica_orn/feature/product/domain/entities/product_entity.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ListProductWidget extends StatelessWidget {
  const ListProductWidget({
    required this.products,
    super.key,
  });

  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return GestureDetector(
          onTap: () {
            context.push(AppRoutes.productDetail, extra: product.id);
          },
          child: Card(
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
              leading: Image.network(
                product.image,
                fit: BoxFit.cover,
                width: 12.w,
                height: 12.h,
              ),
              title: TextWidget(
                text: product.title,
                style: TextStyle(fontSize: 15.sp),
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.start,
                color: Colors.black,
                maxLines: 10,
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
                      text: "${toCurrencyString(
                        product.price.toString(),
                        mantissaLength: 2,
                        leadingSymbol: r'$',
                        useSymbolPadding: true,
                      )} USD",
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
          ),
        );
      },
    );
  }
}
