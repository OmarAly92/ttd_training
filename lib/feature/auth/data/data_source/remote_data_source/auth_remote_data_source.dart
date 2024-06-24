import 'package:tdd_training/core/errors/failure.dart';
import 'package:tdd_training/core/network/api_consumer.dart';
import 'package:tdd_training/feature/auth/data/model/user_model.dart';

import '../../model/method_params/create_user_params.dart';

abstract class AuthRemoteDataSource {
  Future<void> createUser(CreateUserParams params);

  Future<List<UserModel>> getUser();
}

class AuthRemoteDataSourceImp implements AuthRemoteDataSource {
  AuthRemoteDataSourceImp(this._consumer);

  final ApiConsumer _consumer;

  @override
  Future<void> createUser(CreateUserParams params) async {
    try {
      final response = await _consumer.post('/createUser');
      if (response.statusCode != 200) {
        throw ServerFailure(
            message: response.data['message'], statusCode: response.statusCode ?? -1);
      }
    } on Failure catch (error) {
      throw ServerFailure(message: error.message, statusCode: error.statusCode);
    }
  }

  @override
  Future<List<UserModel>> getUser() async {
    try {
      final response = await _consumer.post('/createUser');
      if (response.statusCode != 200) {
        throw ServerFailure(
            message: response.data['message'], statusCode: response.statusCode ?? -1);
      } else {
        final result = List<UserModel>.from(
            (response.data['user'] as List).map((e) => UserModel.fromJson(e)));
        return result;
      }
    } on Failure catch (error) {
      throw ServerFailure(message: error.message, statusCode: error.statusCode);
    }
  }
}
