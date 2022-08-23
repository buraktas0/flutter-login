import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/data/failure.dart';
import 'package:flutter_application_1/domain/repositories/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  @override
  Future<Either<Failure, String>> authenticate(
      String email, String password) async {
    await Future.delayed(Duration(seconds: 1));
    return Right('token');
  }

  @override
  Future<void> deleteToken() async {
    /// delete from keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  Future<void> persistToken(String token) async {
    /// write to keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  Future<Either<Failure, bool>> hasToken() async {
    /// read from keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    return Left(UserFailure(''));
  }
}
