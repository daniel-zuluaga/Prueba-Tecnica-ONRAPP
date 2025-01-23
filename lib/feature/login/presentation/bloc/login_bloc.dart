import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica_orn/core/utils/valid_email_utils.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<AuthenticationEvent>((event, emit) async {
      emit(LoginLoading());
      await Future.delayed(const Duration(seconds: 3));
      print(event.email);
      print(event.password);

      if (!ValidEmailUtils.isValidEmail(event.email)) {
        emit(const LoginFailure(message: 'El email ingresado no es válido'));
      } else {
        emit(LoginSuccess());
      }
    });
  }
}
