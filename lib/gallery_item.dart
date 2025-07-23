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
      // child: Stack(
      //   children: [
      //     Expanded(child: Image.asset(imagePath, fit: BoxFit.fill)),
      //     Positioned(bottom: 0, left: 0, child: Text(imageTitle)),
      //   ],
      // ),
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
          child: ListTile(
            tileColor: Color.fromARGB(200, 0, 0, 0),
            title: Text(
              imageTitle,
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
        ),

        // child: Column(
        //   children: [
        //     Expanded(
        //       child: Image.asset(imagePath, fit: BoxFit.fitWidth, scale: 1000),
        //     ),
        //     Positioned(
        //       bottom: 0,
        //       left: 0,
        //       child: Padding(
        //         padding: const EdgeInsets.all(8.0),
        //         child: Text(
        //           imageTitle,
        //           style: Theme.of(context).textTheme.displaySmall,
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
