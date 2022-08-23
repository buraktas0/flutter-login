abstract class LoginState {
  const LoginState();
}

/*
LoginInitial is the initial state of the LoginForm.

LoginLoading is the state of the LoginForm when we are validating credentials

LoginFailure is the state of the LoginForm when a login attempt has failed.
*/

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginFailure extends LoginState {
  final String error;

  const LoginFailure(this.error);

  @override
  String toString() => 'LoginFailure { error: $error }';
}
