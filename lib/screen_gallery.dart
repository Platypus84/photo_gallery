import 'package:flutter/material.dart';
import 'package:photo_gallery/gallery_data.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //List<Widget> imageCards = [Placeholder(), Placeholder(), Placeholder()];

    return Padding(
      padding: EdgeInsets.all(16.0),
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        children:
            // [
            //   GalleryItem(
            //     imageTitle: 'Title',
            //     imageDescription: 'Description',
            //     imagePath: 'assets/images/soccer.jpeg',
            //     imageDate: '22.10.2012',
            //   ),
            // ],
            galleryData,
      ),
    );
  }
}
