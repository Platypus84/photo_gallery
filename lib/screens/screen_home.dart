import 'package:flutter/material.dart';
// import 'dart:async' show Future;
// import 'package:flutter/services.dart' show rootBundle;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Future<String> loadAsset() async {
    //   return await rootBundle.loadString('assets/texts/kaja_müller_text.txt');
    // }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(450.0),
              ),
              child: Image.asset('assets/images/tennis_2.jpeg'),
            ),
            Positioned(
              top: 32,
              left: 16,
              child: Container(
                width: 3750,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(100, 0, 0, 0),
                      blurRadius: 24.0,
                      blurStyle: BlurStyle.normal,
                      spreadRadius: 24,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Kaya Müller Photography',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    // Transform.translate(
                    //   offset: Offset(-16, 0), // 16px nach links verschieben
                    //   child: SizedBox(
                    //     width: 375,
                    //     child: Divider(
                    //       height: 8.0,
                    //       thickness: 1,
                    //       color: const Color.fromARGB(255, 255, 169, 71),
                    //     ),
                    //   ),
                    // ),
                    Text(
                      '{ Genieße den Moment }',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 24,
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 78,
                    backgroundColor: Color.fromARGB(255, 255, 255, 255),

                    child: CircleAvatar(
                      radius: 72.0,
                      backgroundImage: AssetImage('assets/images/kaya.jpeg'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        Padding(
          padding: const EdgeInsets.only(
            top: 24.0,
            right: 32.0,
            left: 0.0,
            bottom: 16.0,
          ),
          child: Text(
            '"Willkommen in meiner App!\n Erkunde meine Galerie\n und mehr über mich."',
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }
}
