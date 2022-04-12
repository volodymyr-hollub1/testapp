import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:testapp/data/datasources/image/image_remote_datasource.dart';
import 'package:testapp/data/repositories/image/image_data_repository.dart';
import 'package:testapp/domain/repositories/image/image_repository.dart';
import 'package:testapp/domain/usecases/image/get_new_image.dart';
import 'package:testapp/presentation/blocs/image/image_cubit.dart';

final sl = GetIt.instance;

init() {
  //Bloc
  sl.registerFactory(() => ImageCubit(getAllImages: sl<GetImagesUsecase>()));

  //Usecases
  sl.registerLazySingleton(() => GetImagesUsecase(imageRepository: sl()));

  //Repositories
  sl.registerLazySingleton<ImageRepository>(
      () => ImageRepositoryImpl(imageRemoteData: sl()));
  sl.registerLazySingleton<ImageRemoteDatasource>(
      () => ImageRemoteDatasourceImpl(client: http.Client()));

  //External
  sl.registerLazySingleton(() => http.Client());
}
