import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testapp/core/mixins/map_failure.dart';
import 'package:testapp/domain/entities/image/image_entity.dart';
import 'package:testapp/domain/usecases/image/get_new_image.dart';
import 'package:testapp/presentation/blocs/image/image_state.dart';

class ImageCubit extends Cubit<ImageState> with MapFailure {
  final GetImagesUsecase getAllImages;
  int page = 1;

  ImageCubit({required this.getAllImages}) : super(ImageStateEmpty());

  Future<void> getImages() async {
    if (state is ImageStateLoad) return;

    final currentState = state;

    var oldImages = <ImageEntity>[];
    if (currentState is ImageStateLoaded) {
      oldImages = currentState.loadedImages;
    }

    emit(ImageStateLoad(oldImages, isFirstFetch: page == 1));

    final failureOrImage = await getAllImages(ImageParams(page: page));

    failureOrImage.fold(
        (error) => emit(ImageStateError(message: getFailure(error))), (images) {
      page++;
      final imagesAll = (state as ImageStateLoad).oldImages;
      imagesAll.addAll(images);
      emit(ImageStateLoaded(loadedImages: imagesAll));
    });
  }
}
