import 'package:dartz/dartz.dart';
import 'package:tdd_training/core/errors/failure.dart';

typedef Result<T> = Either<Failure, T>;
typedef MapData = Map<String, dynamic>;
