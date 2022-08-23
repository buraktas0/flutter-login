import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/data/failure.dart';
import 'package:flutter_application_1/domain/entities/user.dart';
import 'package:flutter_application_1/domain/repositories/remote_repository.dart';

class LoginUsecase {
  final RemoteRepository repository;

  LoginUsecase(this.repository);

  Future<Either<Failure, String>> execute(String email, String password) {
    return repository.postLogin(email, password);
  }
}
