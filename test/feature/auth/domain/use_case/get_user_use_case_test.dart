import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tdd_training/core/errors/failure.dart';
import 'package:tdd_training/feature/auth/domain/entity/user_entity.dart';
import 'package:tdd_training/feature/auth/domain/repository/auth_repository.dart';
import 'package:tdd_training/feature/auth/domain/use_case/get_user_use_case.dart';

import 'auth_repository.mock.dart';

void main() {
  late AuthRepository repository;
  late GetUserUseCase useCase;

  setUp(() {
    repository = AuthRepositoryMock();
    useCase = GetUserUseCase(repository);
  });

  List<UserEntity> testResponse = [const UserEntity.empty()];

  test('should call [AuthRepository] and return [List<UserEntity>]', () async {
    // Arrange
    when(() => repository.getUser())
        .thenAnswer((invocation) async => Right(testResponse));

    // Act
    final result = await useCase();

    // Assert
    expect(result, equals(Right<Failure, List<UserEntity>>(testResponse)));
    verify(() => repository.getUser()).called(1);
    verifyNoMoreInteractions(repository);
  });
}
