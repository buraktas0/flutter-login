abstract class AuthenticationState {
  const AuthenticationState();
}

/*
    uninitialized — waiting to see if the user is authenticated or not on app start.
    loading — waiting to persist/delete a token
    authenticated — successfully authenticated
    unauthenticated — not authenticated

    if the authentication state was uninitialized, the user might be seeing a splash screen.
    if the authentication state was loading, the user might be seeing a progress indicator.
    if the authentication state was authenticated, the user might see a home screen.
    if the authentication state was unauthenticated, the user might see a login form.
*/

class AuthenticationUninitialized extends AuthenticationState {}

class AuthenticationUnauthenticated extends AuthenticationState {
  final String message;

  AuthenticationUnauthenticated(this.message);
}

class AuthenticationAuthenticated extends AuthenticationState {
  final String result;

  AuthenticationAuthenticated(this.result);
}

class AuthenticationLoading extends AuthenticationState {}
