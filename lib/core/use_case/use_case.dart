import 'package:tdd_training/core/utils/type_def.dart';

abstract class UseCaseWithParams<Type, Params> {
  Future<Result<Type>> call(Params params);
}

abstract class UseCaseWithoutParams<Type> {
  Future<Result<Type>> call();
}
