import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testapp/domain/entities/image/image_entity.dart';
import 'package:testapp/presentation/blocs/image/image_cubit.dart';
import 'package:testapp/presentation/blocs/image/image_state.dart';

import 'image_row.dart';

class ImageList extends StatelessWidget {
  const ImageList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ImageCubit imageCubit = context.read<ImageCubit>();
    final scrollController = ScrollController();

    void setupScrollController(BuildContext context) {
      scrollController.addListener(() {
        if (scrollController.position.atEdge) {
          if (scrollController.position.pixels != 0) {
            context.read<ImageCubit>().getImages();
          }
        }
      });
    }

    return BlocBuilder<ImageCubit, ImageState>(
      builder: (context, state) {
        setupScrollController(context);
        bool isListLoading = false;
        List<ImageEntity> images = [];

        if (state is ImageStateEmpty) {
          imageCubit.getImages();
        } else if (state is ImageStateLoad) {
          images = state.oldImages;
          isListLoading = true;
        } else if (state is ImageStateLoaded) {
          images = state.loadedImages;
        } else if (state is ImageStateError) {
          return Text(
            state.message,
            style: const TextStyle(color: Colors.white, fontSize: 25),
          );
        }

        return ListView.separated(
          controller: scrollController,
          separatorBuilder: (context, index) => const Divider(),
          itemCount: images.length + (isListLoading ? 1 : 0),
          itemBuilder: (context, index) {
            if (index < images.length) {
              return ImageRow(
                  name: images[index].user?.name,
                  description: images[index].description,
                  path: images[index].path);
            } else {
              Timer(const Duration(milliseconds: 30), () {
                scrollController
                    .jumpTo(scrollController.position.maxScrollExtent);
              });
              return _loadingIndicator();
            }
          },
        );
      },
    );
  }

  Widget _loadingIndicator() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
