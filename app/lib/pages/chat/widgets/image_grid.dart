import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageGrid extends StatelessWidget {
  late List<String> medias;
  final Function(int index)? onMediaItemInMediaGridTap;

  ImageGrid(this.medias, {Key? key, this.onMediaItemInMediaGridTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    int column;
    if (medias.length == 1) {
      column = 1;
    } else if (medias.length == 2 || medias.length == 4) {
      column = 2;
    } else {
      column = 3;
    }
    return GridView.builder(
      shrinkWrap: true,
      // Add shrinkWrap property
      physics: const NeverScrollableScrollPhysics(),
      // Add physics property
      itemCount: medias.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: column,
        crossAxisSpacing: 5.0,
        mainAxisSpacing: 5.0,
      ),
      itemBuilder: (BuildContext context, int index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: InkWell(
            onTap: onMediaItemInMediaGridTap != null
                ? () => onMediaItemInMediaGridTap!(index)
                : null,
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              progressIndicatorBuilder: (context, url, progress) => Center(
                child: CircularProgressIndicator(
                  value: progress.progress,
                ),
              ),
              imageUrl: medias[index],
            ),
          ),
        );
      },
    );
  }
}
