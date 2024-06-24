import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tdd_training/feature/auth/data/data_source/remote_data_source/auth_remote_data_source.dart';
import 'package:tdd_training/feature/auth/data/model/method_params/create_user_params.dart';
import 'package:tdd_training/feature/auth/data/repository/auth_repository_imp.dart';
import 'package:tdd_training/feature/auth/domain/repository/auth_repository.dart';

class MockAuthRemoteDataSource extends Mock implements AuthRemoteDataSource {}

void main() {
  late AuthRemoteDataSource remoteDataSource;
  late AuthRepository repository;
  setUp(() {
    remoteDataSource = MockAuthRemoteDataSource();
    repository = AuthRepositoryImp(remoteDataSource);
    registerFallbackValue(const CreateUserParams.empty());
  });

  group('createUser method', () {
    test(
        'should call the [RemoteDataSource.createUser] and complete '
        'successfully when the call to the remote source is successful', () async {
      // Arrange
      when(
        () => remoteDataSource.createUser(
          const CreateUserParams.empty(),
        ),
      ).thenAnswer((invocation) async => Future.value());
      // Act
      final result = await repository.createUser(const CreateUserParams.empty());

      // Assert
      expect(result, const Right(null));
      verify(
        () => remoteDataSource.createUser(
            const CreateUserParams.empty()),
      ).called(1);
    });
  });
}
