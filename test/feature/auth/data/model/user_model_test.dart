import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_training/core/utils/type_def.dart';
import 'package:tdd_training/feature/auth/data/model/user_model.dart';
import 'package:tdd_training/feature/auth/domain/entity/user_entity.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  test('should be a subclass of [UserEntity]', () {
    // Arrange
    const tModel = UserModel.empty();

    // Act

    // Assert
    expect(tModel, isA<UserEntity>());
  });

  group('fromJson', () {
    test('should convert from [Json] to [UserModel]', () {
      // Arrange
      const tModel = UserModel.empty();
      final tJson = fixture('user.json');
      final tMap = jsonDecode(tJson) as MapData;

      // Act
      final result = UserModel.fromJson(tMap);

      // Assert
      expect(result, equals(tModel));
    });
  });

  group('toMap', () {
    test('should convert from [UserModel] to [Json]', () {
      // Arrange
      const tModel = UserModel.empty();
      final tJson = fixture('user.json');
      final tMap = jsonDecode(tJson);

      // Act
      final result = tModel.toMap();

      // Assert
      expect(result, equals(tMap));
    });
  });

  group('copyWith', () {
    test('change all only should return [UserModel]', () {
      // Arrange
      const tModel = UserModel.empty();

      // Act
      final result = tModel.copyWith(id: '', createdAt: '', name: '', avatar: '');

      // Assert
      expect(result, equals(tModel));
    });

    test('change id only should return [UserModel] that id = ["id"]', () {
      // Arrange
      const tModel = UserModel(id: 'id', createdAt: '', name: '', avatar: '');

      // Act
      final result = tModel.copyWith(id: 'id');

      // Assert
      expect(result, equals(tModel));
    });

    test('change createdAt only should return [UserModel] that createdAt = ["createdAt"]',
        () {
      // Arrange
      const tModel = UserModel(id: '', createdAt: 'createdAt', name: '', avatar: '');

      // Act
      final result = tModel.copyWith(createdAt: 'createdAt');

      // Assert
      expect(result, equals(tModel));
    });

    test('change name only should return [UserModel] that name = ["name"]', () {
      // Arrange
      const tModel = UserModel(id: '', createdAt: '', name: 'name', avatar: '');

      // Act
      final result = tModel.copyWith(name: 'name');

      // Assert
      expect(result, equals(tModel));
    });

    test('change avatar only should return [UserModel] that avatar = ["avatar"]', () {
      // Arrange
      const tModel = UserModel(id: '', createdAt: '', name: '', avatar: 'avatar');

      // Act
      final result = tModel.copyWith(avatar: 'avatar');

      // Assert
      expect(result, equals(tModel));
    });
  });
}
