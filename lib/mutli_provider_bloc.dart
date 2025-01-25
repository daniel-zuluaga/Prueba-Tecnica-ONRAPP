import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica_orn/feature/login/presentation/bloc/login_bloc.dart';
import 'package:prueba_tecnica_orn/feature/product/presentation/bloc/product_detail/product_detail_bloc.dart';
import 'package:prueba_tecnica_orn/feature/product/presentation/bloc/product_list/product_bloc.dart';

class PTMultiBlocProvider extends StatelessWidget {
  const PTMultiBlocProvider({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
          create: (BuildContext context) => LoginBloc(),
        ),
        BlocProvider<ProductBloc>(
          create: (BuildContext context) => ProductBloc(),
        ),
        BlocProvider<ProductDetailBloc>(
          create: (BuildContext context) => ProductDetailBloc(),
        ),
      ],
      child: child,
    );
  }
}