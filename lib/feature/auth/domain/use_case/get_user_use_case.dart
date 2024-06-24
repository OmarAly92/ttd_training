import 'package:tdd_training/core/use_case/use_case.dart';
import 'package:tdd_training/core/utils/type_def.dart';
import 'package:tdd_training/feature/auth/domain/entity/user_entity.dart';
import 'package:tdd_training/feature/auth/domain/repository/auth_repository.dart';


class GetUserUseCase implements UseCaseWithoutParams<List<UserEntity>> {
  GetUserUseCase(this._repository);

  final AuthRepository _repository;

  @override
  Future<Result<List<UserEntity>>> call() async {
    return await _repository.getUser();
  }
}
