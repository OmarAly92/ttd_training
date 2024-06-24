import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tdd_training/feature/auth/data/model/method_params/create_user_params.dart';
import 'package:tdd_training/feature/auth/domain/repository/auth_repository.dart';
import 'package:tdd_training/feature/auth/domain/use_case/create_user_use_case.dart';

import 'auth_repository.mock.dart';


void main() {
  late CreateUserUseCase useCase;
  late AuthRepository repository;


  setUp(() {
    repository = AuthRepositoryMock();
    useCase = CreateUserUseCase(repository);
    registerFallbackValue(const CreateUserParams.empty());
  });

  const params = CreateUserParams.empty();
  test('should call the [AuthRepository.createUser]', () async {
    // Arrange
    when(
      () => repository.createUser(any()),
    ).thenAnswer((invocation) async => const Right(null));

    // Act
    final result = await useCase(params);

    // Assert
    expect(result, equals(const Right<dynamic, void>(null)));
    verify(
      () => repository.createUser(
        CreateUserParams(
          createdAt: params.createdAt,
          name: params.name,
          avatar: params.avatar,
        ),
      ),
    ).called(1);
    verifyNoMoreInteractions(repository);
  });
}
