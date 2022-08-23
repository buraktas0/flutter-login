import 'dart:convert';
import 'dart:io';

import 'package:flutter_application_1/data/constants.dart';
import 'package:flutter_application_1/data/exceptions.dart';
import 'package:http/http.dart' as http;

abstract class RemoteDataSource {
  Future<String> getLoginResult(String email, String password);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final http.Client client;
  RemoteDataSourceImpl({required this.client});

  @override
  Future<String> getLoginResult(String email, String password) async {
    final body = json.encode({
      'email': email,
      'password': password,
    });

    final response = await client.post(
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      Uri.parse(Urls.getLoginUrl()),
      body: body,
    );

    if (response.statusCode == HttpStatus.ok) {
      return response.body;
    } else {
      throw ServerException();
    }
  }
}
