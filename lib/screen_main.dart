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
            color: Color.fromRGBO(101, 5, 28, 1),
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
          displaySmall: TextStyle(
            color: Color.fromRGBO(130, 130, 130, 1),
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          bodyMedium: TextStyle(
            color: Color.fromRGBO(0, 0, 0, 1),
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              screenTitles[currentIndex],
              style: TextStyle(color: Colors.white),
            ),
          ),
          backgroundColor: Color.fromRGBO(101, 5, 28, 1),
        ),
        body: screens[currentIndex],
        bottomNavigationBar: NavigationBar(
          backgroundColor: Color.fromRGBO(101, 5, 28, .25),
          labelTextStyle: WidgetStateTextStyle.resolveWith((Set states) {
            final Color color = states.contains(WidgetState.selected)
                ? Color.fromRGBO(101, 5, 28, 1)
                : Color.fromRGBO(101, 5, 28, 1);
            return TextStyle(color: color);
          }),
          elevation: 0,

          indicatorColor: Color.fromRGBO(101, 5, 28, 1),
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
            // NavigationDestination(
            //   icon: Badge(
            //     label: Text('5'),
            //     textColor: Color(0xff000000),
            //     backgroundColor: Color.fromARGB(255, 255, 196, 0),
            //     child: Icon(
            //       Icons.newspaper,
            //       color: Color.fromRGBO(33, 74, 44, 1),
            //     ),
            //   ),
            //   label: 'News',
            // ),
            // NavigationDestination(
            //   icon: Icon(Icons.favorite, color: Color.fromRGBO(33, 74, 44, 1)),
            //   label: 'Likes',
            // ),
            NavigationDestination(
              icon: Icon(Icons.person_2, color: Color.fromRGBO(101, 5, 28, 1)),
              label: 'Über mich',
            ),
          ],
        ),
      ),
    );
  }
}
