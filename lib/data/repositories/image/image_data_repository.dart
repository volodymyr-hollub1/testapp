import 'package:dartz/dartz.dart';
import 'package:testapp/core/fails/exception.dart';
import 'package:testapp/core/fails/failure.dart';
import 'package:testapp/data/datasources/image/image_remote_datasource.dart';
import 'package:testapp/domain/entities/image/image_entity.dart';
import 'package:testapp/domain/repositories/image/image_repository.dart';

class ImageRepositoryImpl implements ImageRepository {
  final ImageRemoteDatasource imageRemoteData;

  ImageRepositoryImpl({required this.imageRemoteData});

  @override
  Future<Either<Failure, List<ImageEntity>>> getImages(int page) async {
    try {
      /// get news from remote server
      final remoteImages = await imageRemoteData.getImages(page);

      /// Todo: CACHED DATA HERE

      return Right(remoteImages);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
