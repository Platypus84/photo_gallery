import 'package:flutter/material.dart';
import 'package:photo_gallery/screen_about.dart';
import 'package:photo_gallery/screen_gallery.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  final List<Widget> screens = [GalleryScreen(), AboutScreen()];
  final List<String> screenTitles = ['Meine Galerie', 'Über mich'];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: TextTheme(
          headlineMedium: TextStyle(
            color: Color.fromARGB(255, 85, 97, 120),
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
          displaySmall: TextStyle(
            color: Color.fromRGBO(130, 130, 130, 1),
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          bodyMedium: TextStyle(
            color: Color.fromARGB(255, 75, 75, 80),
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              screenTitles[currentIndex],
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
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
        body: screens[currentIndex],
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 85, 97, 120),
                Color.fromARGB(255, 155, 173, 220),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.0, 1.0],
            ),
            border: Border(top: BorderSide(color: Color(0xff80ACAF), width: 1)),
          ),

          child: NavigationBar(
            backgroundColor: Colors.transparent,
            labelTextStyle: WidgetStateTextStyle.resolveWith((Set states) {
              final Color color = states.contains(WidgetState.selected)
                  ? Colors.white
                  : Colors.white;
              return TextStyle(color: color);
            }),
            elevation: 0,

            indicatorColor: Color.fromARGB(255, 82, 92, 117),
            onDestinationSelected: (int index) {
              setState(() {
                currentIndex = index;
              });
            },
            selectedIndex: currentIndex,
            destinations: const <Widget>[
              NavigationDestination(
                icon: Icon(Icons.photo_album, color: Colors.white),
                label: 'Galerie',
              ),
              NavigationDestination(
                icon: Icon(Icons.person_2, color: Colors.white),
                label: 'Über mich',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
