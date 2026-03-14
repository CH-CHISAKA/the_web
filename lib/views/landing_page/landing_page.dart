
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_web/views/landing_page/about_page/about_page.dart';
import 'package:the_web/views/landing_page/home_page/home_page.dart';
import 'package:the_web/views/landing_page/widgets/navbar_widget/portfolio_navbar.dart';
import 'package:the_web/views/landing_page/widgets/section_indicator_widget/section_indicator.dart';

class LandingPage  extends StatefulWidget{
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void onSectionTap (int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }


  void onNavTap (int index) {
    onSectionTap(index );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          // Pages (Scrollable Sections)
          PageView(
            controller: _pageController,
            scrollDirection: Axis.vertical,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            children: [
              /// -----------------------------------------------------------------
              ///  Pages
              /// -----------------------------------------------------------------
              HomePage(),
              AboutPage(),
            ],
          ),

          // Navigation Bar (Overlay | Persistent)
          PortfolioNavbar(
            currentIndex: _currentPage,
            onTap : onNavTap,
          ),

          // Section Indicator (Overlay | Persistent)
          SectionIndicator(currentPage: _currentPage, itemCount: 5, onTap: onSectionTap)
        ],
      ),
    );
  }
}