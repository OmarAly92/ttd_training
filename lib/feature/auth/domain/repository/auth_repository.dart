import 'package:tdd_training/core/utils/type_def.dart';
import 'package:tdd_training/feature/auth/domain/entity/user_entity.dart';

import '../../data/model/method_params/create_user_params.dart';

abstract class AuthRepository {
  Future<Result<void>> createUser(CreateUserParams params);

  Future<Result<List<UserEntity>>> getUser();
}
