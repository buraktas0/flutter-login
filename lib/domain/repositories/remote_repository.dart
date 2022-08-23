import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/data/failure.dart';
import 'package:flutter_application_1/domain/entities/user.dart';

abstract class RemoteRepository {
  Future<Either<Failure, String>> postLogin(String email, String password);
}
