import 'package:flutter/material.dart';
import 'package:testapp/presentation/dto/image_page_dto.dart';

class ImageRow extends StatelessWidget {
  final String? name;
  final String? path;
  final String? description;

  const ImageRow(
      {Key? key,
      required this.name,
      required this.path,
      required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if (path != null)
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/image',
                  arguments: ImagePageDto(path: path, name: name));
            },
            child: SizedBox(
              height: 100.0,
              width: 100.0,
              child: Image.network(
                path ?? '',
                fit: BoxFit.fill,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      color: Colors.black87,
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                },
              ),
            ),
          ),
        const SizedBox(
          width: 20.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              description != null ? _checkLength(description!) : '',
              softWrap: true,
            ),
            const SizedBox(height: 8.0),
            Text(
              name ?? '',
              softWrap: true,
            )
          ],
        )
      ],
    );
  }

  String _checkLength(String word) {
    return word.length > 35 ? word.substring(0, 35) : word;
  }
}
