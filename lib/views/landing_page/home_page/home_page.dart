import 'package:flutter/material.dart';
import 'package:the_web/views/landing_page/home_page/components/hero_section.dart';
import 'package:the_web/views/landing_page/widgets/navbar_widget/portfolio_navbar.dart';

///-------------------------------------
/// MAIN HOME SCREEN | LANDING PAGE
///-------------------------------------

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                HeroSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


