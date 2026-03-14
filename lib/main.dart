// Importing Flutter's material design package for building the UI
// Provides access to pre-built UI-Components/Widgets such as MaterialApp, Scaffold, AppBar, Button, Text etc.

import 'package:flutter/material.dart';
import 'package:the_web/views/landing_page/home_page/home_page.dart';
import 'package:the_web/views/landing_page/landing_page.dart';


/// ------------------------------------
/// APPLICATION ENTRY POINT
/// ------------------------------------
/// The 'main()' function is the starting point of every Dart Application. 
/// It initializes necessary bindings and launches the root widget.

void main() {
  // runApp attaches the given widget (MyApp) to the screen
  // and starts rendering the UI.

  WidgetsFlutterBinding.ensureInitialized(); // Ensures that the Flutter engine is initialized before running the app
  runApp(const MyApp()); // Launches the app by running the MyApp widget

}

/// ------------------------------------
/// ROOT APPLICATION WIDGET
/// ------------------------------------
/// MyApp is the root of the widget tree.
/// It configures:
/// - Application theme
/// - Title (used by browsers / OS)
/// - Routing / Navigation / Routes (if any)
/// - Debug settings
/// - Initial home screen

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      // Remove the debug banner in the top right corner of the app
      debugShowCheckedModeBanner: false,

      // Application Title (used by browsers / OS)
      title: 'Edward Chisaka | Researcher',

      // Global Themes Configuration
      // Configure Material 3 Design System
      theme: ThemeData(
        // Generate a full colour scheme from a seed colour
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo, // Base colour for generating the colour scheme
          brightness: Brightness.light, // Use light mode
        ),
        // Use Material 3 design system
        useMaterial3: true,
      ),
      // Set the initial screen of the app to LandingPage
      home: const LandingPage(),
    );
  }
}
