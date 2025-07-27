import 'package:flutter/material.dart';
import 'package:photo_gallery/data/gallery_data.dart';
import 'package:photo_gallery/widgets/gallery_item.dart';

class GalleryScreen extends StatelessWidget {
  final int picsPerRow;
  const GalleryScreen({super.key, this.picsPerRow = 2});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: picsPerRow,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
        itemCount: galleryData.length,
        itemBuilder: (context, index) {
          final item = galleryData[index];

          return GalleryItem(
            imageTitle: item.imageTitle,
            imageDescription: item.imageDescription,
            imagePath: item.imagePath,
            imageDate: item.imageDate,
            picsPerRow: picsPerRow,
          );
        },
      ),
    );
  }
}
