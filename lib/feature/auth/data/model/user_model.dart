import 'package:tdd_training/core/utils/type_def.dart';
import 'package:tdd_training/feature/auth/domain/entity/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.id,
    required super.createdAt,
    required super.name,
    required super.avatar,
  });
  const UserModel.empty() : this(name: '', avatar: '', createdAt: '', id: '');

  UserModel.fromJson(MapData json)
      : this(
          id: json['id'] ?? '',
          createdAt: json['createdAt'] ?? '',
          name: json['name'] ?? '',
          avatar: json['avatar'] ?? '',
        );

  MapData toMap() => {
        'id': id,
        'createdAt': createdAt,
        'name': name,
        'avatar': avatar,
      };

  UserModel copyWith({
     String? id,
     String? createdAt,
     String? name,
     String? avatar,
  }) {
    return UserModel(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      name: name ?? this.name,
      avatar: avatar ?? this.avatar,
    );
  }
}
