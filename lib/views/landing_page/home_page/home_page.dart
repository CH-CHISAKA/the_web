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


