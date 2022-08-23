import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/auth/bloc/authentication_bloc.dart';
import 'package:flutter_application_1/presentation/auth/bloc/authentication_event.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthenticationBloc authenticationBloc = context.read<AuthenticationBloc>();
    //final AuthenticationBloc authenticationBloc =
    //    BlocProvider.of<AuthenticationBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Container(
        child: Center(
            child: OutlinedButton(
          child: Text('logout'),
          onPressed: () {
            authenticationBloc.add(LoggedOut());
          },
        )),
      ),
    );
  }
}
