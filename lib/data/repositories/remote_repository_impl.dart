import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/data/datasources/remote_datasource.dart';
import 'package:flutter_application_1/data/exceptions.dart';
import 'package:flutter_application_1/data/failure.dart';
import 'package:flutter_application_1/domain/entities/user.dart';
import 'package:flutter_application_1/domain/repositories/remote_repository.dart';

class RemoteRepositoryImpl implements RemoteRepository {
  final RemoteDataSource remoteDataSource;

  RemoteRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, String>> postLogin(
      String email, String password) async {
    try {
      final result = await remoteDataSource.getLoginResult(email, password);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
