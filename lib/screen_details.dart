import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final String imageTitle;
  final String imageDescription;
  final String imagePath;
  final String imageDate;

  const DetailsScreen({
    super.key,
    required this.imageTitle,
    required this.imageDescription,
    required this.imagePath,
    required this.imageDate,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text('Details', style: TextStyle(color: Colors.white)),
        backgroundColor: Color.fromRGBO(101, 5, 28, 1),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image(image: AssetImage(imagePath)),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      imageTitle,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Text(
                      imageDate,
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0, bottom: 32.0),
                      child: Text(imageDescription),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
