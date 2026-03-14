import 'package:flutter/material.dart';

/// ---------------------------------------------------------------------------
/// Section Indicator Widget
/// ---------------------------------------------------------------------------
class SectionIndicator extends StatelessWidget {
  final int currentPage;
  final int itemCount;
  final Function(int) onTap;

  const SectionIndicator({
    super.key,
    required this.currentPage,
    required this.itemCount,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    double indicatorRight = screenWidth > 1200 ? 60 : 25;

    return Positioned(
      right: indicatorRight,
      top: screenHeight * 0.4,
      child: Column(
        children: List.generate(
          itemCount,
          (index) => _IndicatorItem(
            index: (index + 1).toString().padLeft(2, '0'),
            isActive: currentPage == index,
            onTap: () => onTap(index),
          ),
        ),
      ),
    );
  }
}

class _IndicatorItem extends StatelessWidget {
  final String index;
  final bool isActive;
  final VoidCallback onTap;

  const _IndicatorItem({
    required this.index,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 250),
          style: TextStyle(
            fontSize: isActive ? 14 : 12,
            fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
            color: isActive ? Colors.black : Colors.black.withOpacity(0.35),
          ),
          child: Text(index),
        ),
      ),
    );
  }
}
