import 'dart:async';
import 'package:flutter/material.dart';

class AboutSection extends StatefulWidget {
  const AboutSection({super.key});

  @override
  State<AboutSection> createState() => _AboutSectionState();
}

class _AboutSectionState extends State<AboutSection> {
  late final PageController _mobileController;
  Timer? _timer;

  final List<String> productImages = [
    'assets/images/about_images/about_1.jpeg',
    'assets/images/about_images/about_2.jpeg',
    'assets/images/about_images/about_3.jpeg',
    'assets/images/about_images/about_4.jpeg',
    'assets/images/about_images/about_5.jpeg',
    'assets/images/about_images/about_6.jpeg',
    'assets/images/about_images/about_7.jpeg',
    'assets/images/about_images/about_8.jpeg',
  ];

  int currentRightIndex = 1;
  int currentLeftIndex = 0;

  @override
  void initState() {
    super.initState();

    _mobileController = PageController(viewportFraction: 0.92);

    /// Precache images for smooth switching
    WidgetsBinding.instance.addPostFrameCallback((_) {
      for (final image in productImages) {
        precacheImage(AssetImage(image), context);
      }
    });

    _startAutoSwap();
  }

  void _startAutoSwap() {
    _timer = Timer.periodic(const Duration(seconds: 4), (_) {
      if (!mounted) return;

      setState(() {
        currentLeftIndex = currentRightIndex;
        currentRightIndex = (currentRightIndex + 1) % productImages.length;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _mobileController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final bool isDesktop = width >= 1100;
    final bool isTablet = width >= 700 && width < 1100;
    final bool isMobile = width < 700;

    final double horizontalPadding = isDesktop
        ? 56
        : isTablet
        ? 32
        : 18;

    final double topSpacing = isDesktop ? 60 : 40;

    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Container(
              width: double.infinity,
              color: Colors.grey[300],
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                      horizontalPadding,
                      topSpacing,
                      horizontalPadding,
                      20, //60
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _SectionHeader(
                          title: 'About Us',
                          subtitle: 'Who we are and how to reach us',
                          isMobile: isMobile,
                        ),
                        const SizedBox(height: 12),

                        if (isMobile)
                          _buildMobileLayout()
                        else
                          _buildWideLayout(isDesktop: isDesktop),

                        const SizedBox(height: 16),

                        if (isMobile)
                          _buildBottomStackedInfo()
                        else
                          _buildBottomInfoGrid(isDesktop: isDesktop),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildWideLayout({required bool isDesktop}) {
    final double height = MediaQuery.of(context).size.height;
    final double cardHeight = height * 0.38;
    final double gap = isDesktop ? 24 : 18;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 700),
            child: _AboutImageCard(
              key: ValueKey('left_$currentLeftIndex'),
              label: 'INSIGHTS',
              imagePath: productImages[currentLeftIndex],
              description: 'Join the Effort to Save Our Forests. Conserving forests is key to the survival of all natural ecosystems on earth',
              height: cardHeight,
            ),
          ),
        ),
        SizedBox(width: gap),
        Flexible(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 700),
            child: _AboutImageCard(
              key: ValueKey('right_$currentRightIndex'),
              label: 'LEARN MORE',
              imagePath: productImages[currentRightIndex],
              description:
                  'Preserving Kenya\'s forests for the future. Get involved today.',
              height: cardHeight,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      children: [
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 700),
          child: _AboutImageCard(
            key: ValueKey('mobile_top_$currentRightIndex'),
            label: 'LEARN MORE',
            imagePath: productImages[currentRightIndex],
            description:
                'Preserving Kenya\'s forests for the future. Get involved today',
            height: 320,
          ),
        ),
        const SizedBox(height: 18),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 700),
          child: _AboutImageCard(
            key: ValueKey('mobile_bottom_$currentLeftIndex'),
            label: 'INSIGHTS',
            imagePath: productImages[currentLeftIndex],
            description:
                'Our platform combines intelligent monitoring with real-time insights.',
            height: 320,
          ),
        ),
      ],
    );
  }

  Widget _buildBottomInfoGrid({required bool isDesktop}) {
    return Row(
      children: [
        Flexible(
          child: _InfoBlock(
            title: 'About Us',
            content:
                'Building smart monitoring experiences combining real-time data, responsive interfaces, and practical reporting tools. Contact us to learn how you can help protect our environment.',
          ),
        ),
        SizedBox(width: isDesktop ? 42 : 24),
        Flexible(
          child: _InfoBlock(
            title: 'Contact Information',
            content:
                'Email: support@rtildlog.com\nPhone: +254 700 000 000\nLocation: Nairobi, Kenya\nHours: Mon - Fri, 8:00 AM - 5:00 PM',
          ),
        ),
      ],
    );
  }

  Widget _buildBottomStackedInfo() {
    return Column(
      children: const [
        _InfoBlock(
          title: 'About Us',
          content:
              'Building smart monitoring experiences combining real-time data, responsive interfaces, and practical reporting tools. Contact us to learn how you can help protect our environment.',
        ),
        SizedBox(height: 22),
        _InfoBlock(
          title: 'Contact Information',
          content:
              'Email: support@rtildlog.com\nPhone: +254 700 000 000\nLocation: Nairobi, Kenya\nHours: Mon - Fri, 8:00 AM - 5:00 PM',
        ),
      ],
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isMobile;

  const _SectionHeader({
    required this.title,
    required this.subtitle,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: isMobile ? 16 : 32,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          subtitle,
          style: TextStyle(fontSize: isMobile ? 14 : 16, color: Colors.black54),
        ),
      ],
    );
  }
}

class _AboutImageCard extends StatelessWidget {
  final String label;
  final String imagePath;
  final String description;
  final double height;

  const _AboutImageCard({
    super.key,
    required this.label,
    required this.imagePath,
    required this.description,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: height,
          width: double.infinity,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(42),
            color: Colors.white70,
          ),
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,

                  /// Loading state
                  frameBuilder:
                      (context, child, frame, wasSynchronouslyLoaded) {
                        if (wasSynchronouslyLoaded) return child;

                        if (frame == null) {
                          return Container(
                            color: Colors.white70,
                            alignment: Alignment.center,
                            child: const SizedBox(
                              width: 28,
                              height: 28,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            ),
                          );
                        }

                        return child;
                      },

                  /// Error fallback
                  errorBuilder: (context, error, stackTrace) {
                    debugPrint('Image failed to load: $imagePath');

                    return Container(
                      color: Colors.white70,
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.broken_image_outlined,
                        size: 48,
                        color: Colors.grey,
                      ),
                    );
                  },
                ),
              ),
              Positioned(
                top: 14,
                left: 14,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black45,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    label,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Text(
          description,
          style: TextStyle(
            fontSize: 13,
            height: 1.55,
            color: Colors.black.withOpacity(0.75),
          ),
        ),
      ],
    );
  }
}

class _InfoBlock extends StatelessWidget {
  final String title;
  final String content;

  const _InfoBlock({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16), //22
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.75),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.black.withOpacity(0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: Color(0xFF202020),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            content,
            style: TextStyle(
              fontSize: 14,
              height: 1.7,
              color: Colors.black.withOpacity(0.72),
            ),
          ),
        ],
      ),
    );
  }
}