import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String id;
  final String createdAt;
  final String name;
  final String avatar;

  const UserEntity({
    required this.id,
    required this.createdAt,
    required this.name,
    required this.avatar,
  });

  const UserEntity.empty() : this(name: '', avatar: '', createdAt: '', id: '');

  @override
  List<Object> get props => [id, createdAt, name, avatar];
}
