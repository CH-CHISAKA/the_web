import 'package:flutter/material.dart';
import 'package:the_web/views/home_screen/components/hero_section.dart';
import 'package:the_web/views/home_screen/components/portfolio_navbar.dart';

///-------------------------------------
/// MAIN HOME SCREEN | LANDING PAGE
///-------------------------------------

class MainHomeScreen extends StatelessWidget {
  const MainHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                HeroSection(),
                // OtherSections(),

                SizedBox(height: 1800,)
              ],
            ),
          ),

          /// -----------------------------------------------------------------
          /// Background Hero Section
          /// -----------------------------------------------------------------
          ///
          /// This acts as the full-screen background or
          /// main introduction section of the landing page.

          // HeroSection(),  --- IGNORE ---

          /// -----------------------------------------------------------------
          /// Navigation Bar (Overlay)
          /// -----------------------------------------------------------------
          Positioned(top: 0, left: 0, right: 0, child: PortfolioNavbar()),
        ],
      ),
    );
  }
}


