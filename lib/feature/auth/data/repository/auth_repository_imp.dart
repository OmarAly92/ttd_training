import 'package:dartz/dartz.dart';
import 'package:tdd_training/core/errors/failure.dart';
import 'package:tdd_training/core/utils/type_def.dart';
import 'package:tdd_training/feature/auth/data/data_source/remote_data_source/auth_remote_data_source.dart';
import 'package:tdd_training/feature/auth/data/model/method_params/create_user_params.dart';
import 'package:tdd_training/feature/auth/domain/entity/user_entity.dart';
import 'package:tdd_training/feature/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImp implements AuthRepository {
  AuthRepositoryImp(this._remoteDataSource);

  final AuthRemoteDataSource _remoteDataSource;

  @override
  Future<Result<void>> createUser(CreateUserParams params) async {

    try {
      final response = await _remoteDataSource.createUser(params);
      return Right(response);
    } on Failure catch (error) {
      return Left(ServerFailure(message: error.message, statusCode: error.statusCode));
    }
  }

  @override
  Future<Result<List<UserEntity>>> getUser() async {
    try {
      final response = await _remoteDataSource.getUser();
      return Right(response);
    } on Failure catch (error) {
      return Left(ServerFailure(message: error.message, statusCode: error.statusCode));
    }
  }
}
