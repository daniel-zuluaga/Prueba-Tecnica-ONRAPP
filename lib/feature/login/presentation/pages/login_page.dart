import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:prueba_tecnica_orn/core/router/router.dart';
import 'package:prueba_tecnica_orn/core/utils/colors.dart';
import 'package:prueba_tecnica_orn/core/widgets/button_widget.dart';
import 'package:prueba_tecnica_orn/core/widgets/modals/modal_sheet_widget.dart';
import 'package:prueba_tecnica_orn/core/widgets/text_field_widget.dart';
import 'package:prueba_tecnica_orn/feature/login/presentation/bloc/login_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green.shade100,
        ),
        body: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginLoading) {
              context.loaderOverlay.show();
            } else if (state is LoginSuccess) {
              context.loaderOverlay.hide();
              context.push(AppRoutes.home);
            } else if (state is LoginFailure) {
              context.loaderOverlay.hide();
              ModalSheetWidget.show(
                title: 'Email no válido',
                iconColor: PTColors.error,
                assetIcon: Icons.error_outline,
                message: state.message,
                context: context,
              );
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                SizedBox(height: 3.h),
                Text(
                  'Bienvenido',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 3.h),
                TextFieldWidget(
                  hintText: 'Email',
                  controller: _emailController,
                  isPassword: false,
                ),
                SizedBox(height: 1.h),
                TextFieldWidget(
                  controller: _passwordController,
                  hintText: 'Password',
                  isPassword: isPasswordVisible,
                  suffixIcon: IconButton(
                    padding: EdgeInsets.only(right: 1.w),
                    onPressed: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                    icon: Icon(
                      isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                  ),
                ),
                SizedBox(height: 3.h),
                ButtonWidget(
                  width: 50.w,
                  height: 5.h,
                  onTap: () {
                    if (_emailController.text.isEmpty ||
                        _passwordController.text.isEmpty) {
                      ModalSheetWidget.show(
                        title: 'Campos vacíos',
                        iconColor: PTColors.error,
                        assetIcon: Icons.error_outline,
                        message: 'Por favor, rellene todos los campos',
                        context: context,
                      );
                      return;
                    }

                    BlocProvider.of<LoginBloc>(context).add(
                      AuthenticationEvent(
                        email: _emailController.text,
                        password: _passwordController.text,
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade100,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
