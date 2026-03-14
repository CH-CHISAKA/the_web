import 'package:flutter/material.dart';
import 'package:the_web/views/landing_page/about_page/section/about_screen.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AboutSection(),
    );
  }
}