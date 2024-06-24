import 'package:equatable/equatable.dart';

class CreateUserParams extends Equatable {
  final String createdAt;
  final String name;
  final String avatar;

  const CreateUserParams({
    required this.createdAt,
    required this.name,
    required this.avatar,
  });

  const CreateUserParams.empty() : this(name: '', avatar: '', createdAt: '');

  @override
  List<Object> get props => [createdAt, name, avatar];
}
