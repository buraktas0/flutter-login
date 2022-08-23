import 'package:flutter_application_1/domain/repositories/user_repository.dart';
import 'package:flutter_application_1/presentation/auth/bloc/authentication_event.dart';
import 'package:flutter_application_1/presentation/auth/bloc/authentication_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository userRepository;

  AuthenticationBloc(this.userRepository)
      : super(AuthenticationUninitialized()) {
    on<AppStarted>((event, emit) async {
      final result = await userRepository.hasToken();

      result.fold((failure) => emit(AuthenticationUnauthenticated('')),
          (data) => emit(AuthenticationAuthenticated(data.toString())));
    });

    on<LoggedIn>((event, emit) async {
      emit(AuthenticationLoading());
      final result = await userRepository.persistToken(event.token);
      emit(AuthenticationAuthenticated('result'));
    });

    on<LoggedOut>((event, emit) async {
      emit(AuthenticationLoading());
      final result = await userRepository.deleteToken();
      emit(AuthenticationUnauthenticated('result'));
    });
  }

  @override
  AuthenticationState get initialState => AuthenticationUninitialized();
}
