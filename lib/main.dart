import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/repositories/user_repository.dart';
import 'package:flutter_application_1/presentation/auth/bloc/authentication_bloc.dart';
import 'package:flutter_application_1/presentation/auth/bloc/authentication_event.dart';
import 'package:flutter_application_1/presentation/auth/bloc/authentication_state.dart';
import 'package:flutter_application_1/presentation/home/page/home_page.dart';
import 'package:flutter_application_1/presentation/loading_indicator.dart';
import 'package:flutter_application_1/presentation/login/bloc/login_bloc.dart';
import 'package:flutter_application_1/presentation/login/page/login_page.dart';
import 'package:flutter_application_1/presentation/splash/splash_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/injection.dart' as di;

void main() {
  di.init();
  AuthenticationBloc authBloc =
      AuthenticationBloc(di.locator<UserRepository>());
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (context) => authBloc,
        ),
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(di.locator(), authBloc),
        )
      ],
      child: const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticationUninitialized) {
            context.read<AuthenticationBloc>().add(AppStarted());
            return SplashPage();
          } else if (state is AuthenticationAuthenticated) {
            return HomePage();
          } else if (state is AuthenticationUnauthenticated) {
            return LoginPage();
          } else if (state is AuthenticationLoading) {
            return LoadingIndicator();
          } else
            return SplashPage();
        },
      ),
    );
  }
}
