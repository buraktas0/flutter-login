abstract class LoginEvent {
  const LoginEvent();
}

class LoginButtonPressed extends LoginEvent {
  final String email;
  final String password;

  LoginButtonPressed(
    this.email,
    this.password,
  );

  @override
  String toString() =>
      'LoginButtonPressed { username: $email, password: $password }';
}
