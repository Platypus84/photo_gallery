import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
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
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  IconData _iconData = Icons.favorite_border_outlined;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Details',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        backgroundColor: Color.fromRGBO(101, 5, 28, 1),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 85, 97, 120),
                Color.fromARGB(255, 155, 173, 220),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Image(image: AssetImage(widget.imagePath)),
                  Positioned(
                    top: 16,
                    right: 16,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(100, 0, 0, 0),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      height: 40,
                      width: 40,
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            _iconData =
                                _iconData == Icons.favorite_border_outlined
                                ? Icons.favorite
                                : Icons.favorite_border_outlined;
                          });
                        },
                        icon: Icon(_iconData, color: Colors.white),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Color.fromARGB(200, 10, 10, 10),
                            Color.fromARGB(0, 0, 0, 0),
                          ],
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          bottom: 16,
                          left: 16,
                          right: 16,
                          top: 40,
                        ),
                        child: Row(
                          children: [
                            RichText(
                              text: TextSpan(
                                text: widget.imageTitle,
                                style: Theme.of(
                                  context,
                                ).textTheme.displayMedium,
                                children: [
                                  TextSpan(
                                    text: ' | ${widget.imageDate}',
                                    style: TextStyle(
                                      color: const Color.fromARGB(
                                        215,
                                        225,
                                        225,
                                        225,
                                      ),
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      widget.imageDescription,
                      style: Theme.of(context).textTheme.bodyMedium,
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
