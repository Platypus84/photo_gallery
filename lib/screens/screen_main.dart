import 'package:flutter/material.dart';
import 'package:photo_gallery/screens/screen_about.dart';
import 'package:photo_gallery/screens/screen_gallery.dart';
import 'package:photo_gallery/screens/screen_home.dart';
import 'package:photo_gallery/styles/photogallery_stylesheet.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  // Reminder: TickerProviderStateMixin wird für Animation (Page Transition) benötigt
  int _currentIndex = 0;

  final List<Widget> screens = [HomeScreen(), GalleryScreen(), AboutScreen()];
  final List<String> screenTitles = ['Home', 'Meine Galerie', 'Über mich'];

  late AnimationController _animationController; // handelt die Animation
  late Animation<double> _fadeAnimation; // definiert die Art der Animation

  // Funktion für die State Initialisierung
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(seconds: 1), // 1 second fade duration
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    // Start with the first page visible
    _animationController.forward();
  }

  // Funktion für das Verlassen des States
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  // Funktion für das Event Handling, deren Rumpf sonst in NavigationBar nach "onDestinationSelected" steht. Aktualisiert den Page Index.
  void _onItemTapped(int index) {
    if (index != _currentIndex) {
      setState(() {
        _currentIndex = index;
      });

      // Startet die Fade Animation neu
      _animationController.reset();
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: photoGalleryTheme,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            screenTitles[_currentIndex],
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color.fromARGB(255, 85, 97, 120), Color(0xff96A1B6)],
              ),
            ),
          ),
        ),
        body: FadeTransition(
          // Widget für Fade Animationen, muss den body Content umschließen.
          opacity: _fadeAnimation,
          child: screens[_currentIndex],
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color.fromARGB(255, 85, 97, 120), Color(0xff96A1B6)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.0, 1.0],
            ),
            border: Border(top: BorderSide(color: Color(0xff80ACAF), width: 1)),
          ),

          child: NavigationBar(
            backgroundColor: Colors.transparent,
            animationDuration: Duration(milliseconds: 1000),
            labelTextStyle: WidgetStateTextStyle.resolveWith((Set states) {
              final Color color = states.contains(WidgetState.selected)
                  ? Colors.white
                  : Colors.white;
              return TextStyle(color: color);
            }),
            elevation: 0,

            indicatorColor: Color.fromARGB(255, 82, 92, 117),
            onDestinationSelected: _onItemTapped,
            selectedIndex: _currentIndex,
            destinations: const <Widget>[
              NavigationDestination(
                icon: Icon(Icons.home, color: Colors.white),
                label: 'Home',
              ),
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
