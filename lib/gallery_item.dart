import 'package:flutter/material.dart';
import 'package:photo_gallery/screen_details.dart';

class GalleryItem extends StatelessWidget {
  final String imageTitle;
  final String imageDescription;
  final String imagePath;
  final String imageDate;

  const GalleryItem({
    super.key,
    required this.imageTitle,
    required this.imageDescription,
    required this.imagePath,
    required this.imageDate,
  });

  @override
  Widget build(BuildContext context) {
    Route createRoute() {
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => DetailsScreen(
          imageTitle: imageTitle,
          imageDescription: imageDescription,
          imageDate: imageDate,
          imagePath: imagePath,
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          final tween = Tween(begin: begin, end: end);
          final offsetAnimation = animation.drive(tween);

          return SlideTransition(position: offsetAnimation, child: child);
        },
      );
    }

    return Card(
      clipBehavior: Clip.hardEdge,
      elevation: 3,
      child: InkWell(
        onTap: () {
          Navigator.push(context, createRoute());
        },
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                height: null,
                child: Container(
                  color: Color.fromARGB(100, 0, 0, 0),
                  child: ListTile(
                    visualDensity: VisualDensity(
                      vertical: -3, // bestimmt die Höhe der ListTile
                    ),
                    title: Text(
                      imageTitle,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        height: 1,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
