import 'package:flutter_application_1/data/datasources/remote_datasource.dart';
import 'package:flutter_application_1/data/repositories/remote_repository_impl.dart';
import 'package:flutter_application_1/data/repositories/user_repository_impl.dart';
import 'package:flutter_application_1/domain/repositories/remote_repository.dart';
import 'package:flutter_application_1/domain/repositories/user_repository.dart';
import 'package:flutter_application_1/domain/usecases/login_usecase.dart';
import 'package:flutter_application_1/presentation/auth/bloc/authentication_bloc.dart';
import 'package:flutter_application_1/presentation/login/bloc/login_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final locator = GetIt.instance;

void init() {
  //bloc
  locator.registerFactory(() => AuthenticationBloc(locator()));
  locator.registerFactory(() => LoginBloc(locator(), locator()));

  //usecase
  locator.registerLazySingleton(() => LoginUsecase(locator()));

  //repository
  locator.registerLazySingleton<RemoteRepository>(
      () => RemoteRepositoryImpl(remoteDataSource: locator()));
  locator.registerLazySingleton<UserRepository>(() => UserRepositoryImpl());

  //datasource
  locator.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(client: locator()));

  //external
  locator.registerLazySingleton(() => http.Client());
}
