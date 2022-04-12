import 'package:dartz/dartz.dart';
import 'package:testapp/core/fails/failure.dart';

abstract class Usecase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
