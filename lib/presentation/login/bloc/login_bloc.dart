import 'package:flutter_application_1/presentation/auth/bloc/authentication_bloc.dart';
import 'package:flutter_application_1/presentation/auth/bloc/authentication_event.dart';
import 'package:flutter_application_1/presentation/login/bloc/login_event.dart';
import 'package:flutter_application_1/presentation/login/bloc/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/domain/usecases/login_usecase.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUsecase loginUsecase;
  final AuthenticationBloc authenticationBloc;

  LoginBloc(this.loginUsecase, this.authenticationBloc)
      : super(LoginInitial()) {
    on<LoginButtonPressed>(((event, emit) async {
      emit(LoginLoading());

      final result = await loginUsecase.execute(event.email, event.password);
      result.fold(
        (failure) {
          emit(LoginFailure(failure.message));
        },
        (data) {
          authenticationBloc.add(LoggedIn(data));
          emit(LoginInitial());
        },
      );
    }));
  }
}
