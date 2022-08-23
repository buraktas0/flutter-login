import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/data/failure.dart';

abstract class UserRepository {
  Future<Either<Failure, String>> authenticate(String email, String password);

  Future<Either<Failure, bool>> hasToken();

  Future<void> persistToken(String token);

  Future<void> deleteToken();
}
