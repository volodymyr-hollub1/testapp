import 'package:dartz/dartz.dart';
import 'package:testapp/core/fails/failure.dart';
import 'package:testapp/domain/entities/image/image_entity.dart';

abstract class ImageRepository {
  Future<Either<Failure, List<ImageEntity>>> getImages(int page);
}
