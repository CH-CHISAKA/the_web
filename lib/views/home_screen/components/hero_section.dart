/// Hero section replicating the aesthetic of the attached image:
/// - Large centered title
/// - Frosted glass effect
/// - Soft blurred background image
/// - Elegant typography
import 'dart:ui';

import 'package:flutter/material.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height, // Full viewport height
      width: double.infinity, // Full width
      child: Container(
        color: const Color(0xFFB2B1B1), // Soft light grey background
        child: Stack(
          children: [
            /// Subtle Background Glow (Large EC effect simulation)
            Positioned.fill(
              child: Transform.translate(
                offset: const Offset(0, -140),
                child: Center(
                  child: Text(
                    "ec",
                    style: TextStyle(
                      fontSize: 600,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 7,
                      // color: Colors.white.withOpacity(0.95),
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),

            /// Frosted glass overlay effect
            Positioned.fill(
              child: ClipRect(
                // Prevents the blur from spreading beyond the widget's bounds
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 15,
                    sigmaY: 15,
                  ), // Adjust blur intensity
                  child: Container(
                    decoration: BoxDecoration(
                      // This color provides the "frost" tint
                      color: Colors.white.withOpacity(0.25),
                      // Optional: Add a subtle border to make it pop
                      border: Border.all(
                        color: Colors.white.withOpacity(0.25),
                        width: 1.5,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            /// Main Center Content
            Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 900),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      /// Hero Title
                      const Text(
                        "EDWARD CHISAKA",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 64,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 6,
                          height: 1.1,
                          color: Color(0xFF1C1C1E),
                        ),
                      ),

                      const SizedBox(height: 28),

                      /// Subtitle
                      const Text(
                        "Applied Machine Learning Researcher\n"
                        "Specializing in Computer Vision, Multimodal AI & Sustainable Digital Systems.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          height: 1.7,
                          color: Color.fromARGB(255, 73, 72, 72),
                        ),
                      ),

                      const SizedBox(height: 48),

                      /// CTA Button
                      ElevatedButton(
                        onPressed: () {
                           // TODO: Add scroll or routing logic
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 42,
                            vertical: 20,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          elevation: 0,
                        ),
                        child: const Text(
                          "View Research",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            /// Right Side Section Indicators
            Positioned(
              right: 40,
              top: 250,
              child: Column(
                children: const [
                  _SectionIndicator(index: "01"),
                  _SectionIndicator(index: "02"),
                  _SectionIndicator(index: "03"),
                  _SectionIndicator(index: "04"),
                  _SectionIndicator(index: "05"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Vertical side indicator numbers
class _SectionIndicator extends StatelessWidget {
  final String index;

  const _SectionIndicator({required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Text(
        index,
        style: TextStyle(
          fontSize: 12,
          color: Colors.black.withOpacity(0.35),
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
