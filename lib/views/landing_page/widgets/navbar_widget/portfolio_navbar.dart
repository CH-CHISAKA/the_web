

import 'package:flutter/material.dart';

/// ---------------------------------------------------------------------------
/// PortfolioNavBar (Enhanced Premium Interactive Version)
/// ---------------------------------------------------------------------------

class PortfolioNavbar extends StatefulWidget {
  const PortfolioNavbar({super.key});

  @override
  State<PortfolioNavbar> createState() => _PortfolioNavbarState();
}

class _PortfolioNavbarState extends State<PortfolioNavbar> {
  int? activeIndex; // No default highlight on landing page

  final List<String> navItems = [
    "Home",
    "Research",
    "Projects",
    "Publications",
    "About Me",
  ];

  void _onNavTap(int index) {
    setState(() {
      activeIndex = index;
    });

    debugPrint("Tapped: ${navItems[index]}");

    // TODO: Add scroll-to-section logic here
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// -----------------------------------------------------------------
          /// Personal Logo / Initials
          /// -----------------------------------------------------------------
          const Text(
            'EC',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),

          Row(
            children: List.generate(
              navItems.length,
              (index) => _NavItem(
                title: navItems[index],
                isActive: activeIndex == index,
                onTap: () => _onNavTap(index),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// ---------------------------------------------------------------------------
/// _NavItem Widget (Premium Hover + Active + Smooth Underline Animation)
/// ---------------------------------------------------------------------------

class _NavItem extends StatefulWidget {
  final String title;
  final bool isActive;
  final VoidCallback onTap;

  const _NavItem({
    required this.title,
    required this.isActive,
    required this.onTap,
  });

  @override
  State<_NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<_NavItem> {
  bool isHovered = false;

  /// Increase/reduce underline width
  static const double underlineWidth = 35;

  /// Increase/reduce underline thickness
  static const double underlineHeight = 2;

  @override
  Widget build(BuildContext context) {
    final bool highlight = isHovered || widget.isActive;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => isHovered = true),
        onExit: (_) => setState(() => isHovered = false),
        child: InkWell(
          onTap: widget.onTap,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: AnimatedScale(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOut,
            scale: highlight ? 1.08 : 1.0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                /// Text Animation
                AnimatedDefaultTextStyle(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeOut,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight:
                        widget.isActive ? FontWeight.w600 : FontWeight.w400,
                    color: highlight
                        ? const Color(0xFF3D4450) //414B55
                        : Colors.black.withOpacity(0.7),
                  ),
                  child: Text(widget.title),
                ),

                const SizedBox(height: 8),

                /// Premium Fade + Slide Underline (Hover Only)
                Center(
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 180),
                    opacity: isHovered ? 1 : 0,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 220),
                      curve: Curves.easeOutCubic,
                      height: underlineHeight,
                      width: isHovered ? underlineWidth : 0,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 43, 48, 57),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}