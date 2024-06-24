import 'package:tdd_training/core/use_case/use_case.dart';
import 'package:tdd_training/core/utils/type_def.dart';
import 'package:tdd_training/feature/auth/data/model/method_params/create_user_params.dart';
import 'package:tdd_training/feature/auth/domain/repository/auth_repository.dart';

class CreateUserUseCase implements UseCaseWithParams<void, CreateUserParams> {
  CreateUserUseCase(this._repository);

  final AuthRepository _repository;

  @override
  Future<Result<void>> call(CreateUserParams params) async {
    return await _repository.createUser(params);
  }
}
