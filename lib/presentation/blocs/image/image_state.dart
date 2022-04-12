import 'package:equatable/equatable.dart';
import 'package:testapp/domain/entities/image/image_entity.dart';

abstract class ImageState extends Equatable {
  @override
  List<Object> get props => [];
}

class ImageStateEmpty extends ImageState {}

class ImageStateLoad extends ImageState {
  final List<ImageEntity> oldImages;
  final bool isFirstFetch;

  ImageStateLoad(this.oldImages, {this.isFirstFetch = false});

  @override
  List<Object> get props => [oldImages];
}

// ignore: must_be_immutable
class ImageStateLoaded extends ImageState {
  List<ImageEntity> loadedImages;

  ImageStateLoaded({required this.loadedImages});

  @override
  List<Object> get props => [loadedImages];
}

class ImageStateError extends ImageState {
  final String message;

  ImageStateError({required this.message});
}
