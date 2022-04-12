import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:testapp/core/fails/failure.dart';
import 'package:testapp/core/usecase/usescase.dart';
import 'package:testapp/domain/entities/image/image_entity.dart';
import 'package:testapp/domain/repositories/image/image_repository.dart';

class GetImagesUsecase extends Usecase<List<ImageEntity>, ImageParams> {
  final ImageRepository imageRepository;

  GetImagesUsecase({required this.imageRepository});

  @override
  Future<Either<Failure, List<ImageEntity>>> call(ImageParams params) async {
    return await imageRepository.getImages(params.page);
  }
}

class ImageParams extends Equatable {
  final int page;

  const ImageParams({required this.page});

  @override
  List<Object?> get props => [page];
}
