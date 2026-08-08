import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

import '../themes/app_theme.dart';
import '../widgets/nav_bar.dart';
import '../widgets/section_title.dart';
import '../widgets/social_icons.dart';
import '../constants/strings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AutoScrollController _scrollController = AutoScrollController();
  final PageController _pageController = PageController();
  int _currentPage = 0;
  bool _isScrolled = false;
  final double _appBarHeight = 80.0;

  final List<String> _sections = [
    'home',
    'about',
    'experience',
    'education',
    'projects',
    'contact',
  ];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.offset > 100) {
      if (!_isScrolled) {
        setState(() => _isScrolled = true);
      }
    } else {
      if (_isScrolled) {
        setState(() => _isScrolled = false);
      }
    }
  }

  Future<void> _scrollToSection(int index) async {
    await _scrollController.scrollToIndex(
      index,
      duration: const Duration(milliseconds: 800),
      preferPosition: AutoScrollPosition.begin,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    final isSmallScreen = size.width < 800;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(_appBarHeight),
        child: NavBar(
          isScrolled: _isScrolled,
          onItemTap: (index) => _scrollToSection(index),
          currentIndex: _currentPage,
        ),
      ),
      body: Stack(
        children: [
          // Background Decoration
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    theme.colorScheme.background,
                    theme.colorScheme.background.withOpacity(0.9),
                    theme.colorScheme.background.withOpacity(0.8),
                  ],
                ),
              ),
            ),
          ),
          
          // Main Content
          ListView.builder(
            controller: _scrollController,
            itemCount: _sections.length,
            itemBuilder: (context, index) {
              switch (index) {
                case 0:
                  return _buildHeroSection(theme, size);
                case 1:
                  return _buildAboutSection(theme, size);
                case 2:
                  return _buildExperienceSection(theme, size);
                case 3:
                  return _buildEducationSection(theme, size);
                case 4:
                  return _buildProjectsSection(theme, size);
                case 5:
                  return _buildContactSection(theme, size);
                default:
                  return const SizedBox.shrink();
              }
            },
          ),
        ],
      ),
      floatingActionButton: _buildFloatingActionButton(theme),
    );
  }

  // Hero Section
  Widget _buildHeroSection(ThemeData theme, Size size) {
    final isSmallScreen = size.width < 800;
    
    return Container(
      height: size.height,
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(flex: 2),
          Text(
            'Hi, I\'m',
            style: theme.textTheme.headlineSmall?.copyWith(
              color: theme.colorScheme.primary,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Hanine Guesmi',
            style: theme.textTheme.displayLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.onBackground,
              height: 1.1,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Mobile Engineer',
            style: theme.textTheme.headlineMedium?.copyWith(
              color: theme.colorScheme.primary,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: isSmallScreen ? double.infinity : size.width * 0.5,
            child: Text(
              'I build exceptional digital experiences with Flutter and native Android. Currently focused on creating beautiful, responsive mobile applications.',
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.onBackground.withOpacity(0.8),
                height: 1.6,
              ),
            ),
          ),
          const SizedBox(height: 40),
          Row(
            children: [
              FilledButton(
                onPressed: () => _scrollToSection(5), // Scroll to contact
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Get In Touch'),
              ),
              const SizedBox(width: 20),
              TextButton(
                onPressed: () => _scrollToSection(4), // Scroll to projects
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                ),
                child: const Row(
                  children: [
                    Text('View My Work'),
                    SizedBox(width: 8),
                    Icon(Icons.arrow_forward, size: 18),
                  ],
                ),
              ),
            ],
          ),
          const Spacer(),
          // Social Icons
          const Padding(
            padding: EdgeInsets.only(bottom: 40.0),
            child: Row(
              children: [
                SocialIcons(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // About Section
  Widget _buildAboutSection(ThemeData theme, Size size) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 80.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(
            number: '01',
            title: 'About Me',
          ),
          const SizedBox(height: 40),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // About Text
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello! I\'m Hanine, a passionate Mobile Engineer with 4+ years of experience in building beautiful and functional mobile applications.',
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: theme.colorScheme.onBackground.withOpacity(0.8),
                        height: 1.8,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'I specialize in Flutter and native Android development, with a strong focus on creating responsive and accessible user interfaces. My goal is to build applications that not only look great but also provide a seamless user experience.',
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: theme.colorScheme.onBackground.withOpacity(0.8),
                        height: 1.8,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Here are a few technologies I\'ve been working with recently:',
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: theme.colorScheme.onBackground.withOpacity(0.8),
                        height: 1.8,
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Skills Grid
                    Wrap(
                      spacing: 16,
                      runSpacing: 8,
                      children: [
                        _buildSkillItem(theme, 'Flutter & Dart'),
                        _buildSkillItem(theme, 'Kotlin & Jetpack Compose'),
                        _buildSkillItem(theme, 'Firebase'),
                        _buildSkillItem(theme, 'REST APIs & WebSockets'),
                        _buildSkillItem(theme, 'BLoC & Riverpod'),
                        _buildSkillItem(theme, 'Clean Architecture'),
                        _buildSkillItem(theme, 'CI/CD & Git'),
                        _buildSkillItem(theme, 'SQLite / Room / Hive'),
                      ],
                    ),
                  ],
                ),
              ),
              // Profile Image - Placeholder for now
              if (size.width > 1000) ...{
                const SizedBox(width: 80),
                Expanded(
                  child: Center(
                    child: Container(
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: theme.colorScheme.primary.withOpacity(0.2),
                          width: 1,
                        ),
                      ),
                      child: const Icon(
                        Icons.person,
                        size: 100,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              },
            ],
          ),
        ],
      ),
    );
  }

  // Experience Section
  Widget _buildExperienceSection(ThemeData theme, Size size) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 80.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(
            number: '02',
            title: 'Work Experience',
          ),
          const SizedBox(height: 40),
          // Experience Timeline
          _buildExperienceItem(
            theme,
            'Developer Consultant',
            'Neo',
            'Tunisia',
            '2026 - Present',
            [
              'Provided expert technical consultancy and mobile development services, collaborating closely with diverse, international teams on key enterprise projects.',
              'Contributed to gift4You, a strategic platform that enhances customer engagement and simplifies the digital gifting experience.',
              'Worked on mozn, an advanced platform for financial intelligence crucial for robust risk management and fraud prevention, featuring Moyasar integration.',
              'Developed features for RMS (Resource Management System), playing a vital role in optimizing resource allocation and improving operational efficiency.',
            ],
          ),
          const SizedBox(height: 40),
          _buildExperienceItem(
            theme,
            'Mobile Developer – Flutter',
            'Servini',
            'Tunisia',
            '02/2026 - Present',
            [
              'Developing a comprehensive ERP system optimized for tablet and mobile devices using Flutter.',
              'Implementing key modules including Fiche Technique, Kitchen Display System (KDS), and dynamic reporting.',
              'Integrating real-time functionalities leveraging GraphQL API and Apollo client.',
            ],
          ),
          const SizedBox(height: 40),
          _buildExperienceItem(
            theme,
            'Mobile Developer – Flutter (BinYdik)',
            'Freelance',
            'Sousse, Tunisia',
            '03/2026 - Present',
            [
              'Built BinYdik from scratch, taking full ownership of the technical architecture, UI/UX design (no Figma used), development, and testing for iOS & Android.',
              'Implemented essential features such as real-time chat and robust QR/Barcode scanning capabilities.',
              'Managed end-to-end deployment to Google Play Store and Apple App Store.',
              'Successfully launched the latest Android version, reaching over 1K+ downloads and trending on the Play Store.',
              'Delivered a Flutter e-commerce app (catalog, cart, checkout, Google Maps), accelerating delivery speed by 40% with AI-assisted tools.',
            ],
          ),
          const SizedBox(height: 40),
          _buildExperienceItem(
            theme,
            'Mobile Developer – Flutter & Kotlin',
            'Softylines',
            'Sousse, Tunisia',
            '09/2021 - 09/2025',
            [
              'Built 8+ cross-platform and native production apps (e-commerce, social media, edtech) with measurable results.',
              'Collaborated with designers, back-end engineers, product owners, scrum masters, and QA teams to deliver pixel-perfect UI and meet project requirements.',
              'Led code reviews and enforced Clean Architecture while mentoring and guiding 2 junior developers in best practices for Flutter.',
              'Optimized app performance by profiling with Flutter DevTools, improving responsiveness and stability.',
              'Implemented unit and integration testing, reducing crash rates by 70% using Crashlytics.',
              'Implemented CI/CD pipelines with GitHub Actions, improving release speed by 50%.',
            ],
          ),
          const SizedBox(height: 40),
          _buildExperienceItem(
            theme,
            'Final Year Internship – Bachelor\'s',
            'Houloul',
            'Sousse, Tunisia',
            '02/2021 - 07/2021',
            [
              'Analysis, design, and development of Django/Python order-tracking web app with Raspberry Pi camera integration for automated tracking.',
            ],
          ),
        ],
      ),
    );
  }

  // Education Section
  Widget _buildEducationSection(ThemeData theme, Size size) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 80.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(
            number: '03',
            title: 'Education',
          ),
          const SizedBox(height: 40),
          _buildExperienceItem(
            theme,
            'Engineering Degree in Software Engineering',
            'Polytechnic University of Sousse',
            'Sousse, Tunisia',
            '09/2021 - 06/2025',
            [
              'Graduated with High Honors',
            ],
          ),
          const SizedBox(height: 40),
          _buildExperienceItem(
            theme,
            'Bachelor\'s in Information Technology',
            'Higher Institute of Technological Studies',
            'Kairouan, Tunisia',
            '09/2018 - 07/2021',
            [
              'Graduated with High Honors',
            ],
          ),
        ],
      ),
    );
  }

  // Projects Section
  Widget _buildProjectsSection(ThemeData theme, Size size) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 80.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(
            number: '04',
            title: 'Featured Projects',
          ),
          const SizedBox(height: 40),
          // Projects Grid
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: size.width > 1200 ? 3 : (size.width > 700 ? 2 : 1),
            crossAxisSpacing: 24,
            mainAxisSpacing: 24,
            children: [
              _buildProjectCard(
                theme,
                'gift4You',
                'A strategic platform that enhances customer engagement and simplifies the digital gifting experience.',
                'Flutter, UI/UX, REST APIs',
                '#',
                Icons.card_giftcard,
              ),
              _buildProjectCard(
                theme,
                'mozn',
                'An advanced platform for financial intelligence crucial for robust risk management and fraud prevention.',
                'Flutter, Analytics, Security, Moyasar',
                '#',
                Icons.analytics,
              ),
              _buildProjectCard(
                theme,
                'Servini ERP',
                'A comprehensive ERP system for restaurant management featuring real-time KDS, dynamic reports, and Fiche Technique capabilities.',
                'Flutter, GraphQL, Apollo',
                '#',
                Icons.dashboard,
                imageUrl: 'assets/images/servini.png',
              ),
              _buildProjectCard(
                theme,
                'BinYdik',
                'A comprehensive mobile app featuring real-time chat and QR/Barcode scanning. Designed entirely from scratch (no Figma) and reached 1K+ downloads trending on Play Store.',
                'Flutter, Chat, Scanner',
                'https://play.google.com/store/apps/details?id=com.appilix.app1761846119&hl=en',
                Icons.storefront,
                appStoreUrl: 'https://apps.apple.com/tn/app/binydik/id6759522629',
                imageUrl: 'assets/images/binydik.png',
              ),
              _buildProjectCard(
                theme,
                'TakiAcademy',
                'First Tunisian e-learning app (Flutter), achieving 100K+ downloads by implementing video streaming, video playback, progress tracking and gamified learning.',
                'Flutter, Socket.IO, vdocipher',
                'https://play.google.com/store/apps/details?id=com.softylines.takiacademy&hl=en',
                Icons.school,
              ),
              _buildProjectCard(
                theme,
                'Taki Kids',
                'Educational Mobile Game, reaching 10K+ downloads.',
                'Kotlin, Animations, FCM, ROOM',
                'https://play.google.com/store/apps/details?id=com.softylines.takikids',
                Icons.child_care,
              ),
              _buildProjectCard(
                theme,
                'Proxymabel',
                'Stock Management App with RFID SDK integration and real-time sync.',
                'Kotlin, Jetpack Compose',
                'https://www.proximabel.com/',
                Icons.inventory,
              ),
              _buildProjectCard(
                theme,
                'LinkFoot',
                'Football Community App with team matching, Reels, Voice/Video calls, private and group chat.',
                'Flutter, FCM, WebRTC, Socket.IO, Stripe',
                'https://play.google.com/store/apps/details?id=com.linkefoot.linkefootApp&hl=fr',
                Icons.sports_soccer,
              ),
              _buildProjectCard(
                theme,
                'Chichkhan - Boritos',
                'Development of two SaaS applications for restaurant management (Delivery App & Admin App).',
                'Flutter, Push Notifications FCM, Flavors',
                'https://play.google.com/store/apps/details?id=com.chichkhan.app',
                Icons.restaurant,
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Contact Section
  Widget _buildContactSection(ThemeData theme, Size size) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 80.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SectionTitle(
            number: '05',
            title: 'Get In Touch',
          ),
          const SizedBox(height: 40),
          Text(
            'Have a project in mind or want to discuss potential opportunities?',
            style: theme.textTheme.headlineSmall?.copyWith(
              color: theme.colorScheme.onBackground.withOpacity(0.9),
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Text(
            'I\'m currently looking for new opportunities, my inbox is always open. Whether you have a question or just want to say hi, I\'ll try my best to get back to you!',
            style: theme.textTheme.bodyLarge?.copyWith(
              color: theme.colorScheme.onBackground.withOpacity(0.7),
              height: 1.8,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          FilledButton(
            onPressed: () async {
              final Uri emailLaunchUri = Uri(
                scheme: 'mailto',
                path: 'hanine.guesmi.work@gmail.com',
                query: 'subject=Let\'s work together!&body=Hi Hanine,',
              );
              if (await canLaunchUrl(emailLaunchUri)) {
                await launchUrl(emailLaunchUri);
              }
            },
            style: FilledButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text('Say Hello'),
          ),
          const SizedBox(height: 80),
          // Footer
          Text(
            'Designed & Built by Hanine Guesmi',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onBackground.withOpacity(0.5),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '© ${DateTime.now().year} All Rights Reserved',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onBackground.withOpacity(0.5),
            ),
          ),
        ],
      ),
    );
  }

  // Helper Widgets
  Widget _buildSkillItem(ThemeData theme, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: theme.colorScheme.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: theme.colorScheme.primary.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Text(
        text,
        style: theme.textTheme.bodyMedium?.copyWith(
          color: theme.colorScheme.primary,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildExperienceItem(
    ThemeData theme,
    String position,
    String company,
    String location,
    String duration,
    List<String> points,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            // Timeline dot
            Container(
              width: 16,
              height: 16,
              margin: const EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                color: theme.colorScheme.primary,
                shape: BoxShape.circle,
              ),
            ),
            // Position and company
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  position,
                  style: theme.textTheme.titleLarge?.copyWith(
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '$company • $location',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: theme.colorScheme.onBackground.withOpacity(0.7),
                  ),
                ),
              ],
            ),
            const Spacer(),
            // Duration
            Text(
              duration,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onBackground.withOpacity(0.6),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        // Timeline line
        Container(
          width: 2,
          height: 40,
          margin: const EdgeInsets.only(left: 7.5),
          color: theme.colorScheme.primary.withOpacity(0.2),
        ),
        // Points
        ...points.map((point) => Padding(
          padding: const EdgeInsets.only(left: 24, bottom: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '• ',
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                child: Text(
                  point,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: theme.colorScheme.onBackground.withOpacity(0.8),
                    height: 1.6,
                  ),
                ),
              ),
            ],
          ),
        )).toList(),
      ],
    );
  }

  Widget _buildProjectCard(
    ThemeData theme,
    String title,
    String description,
    String technologies,
    String url,
    IconData icon, {
    String? appStoreUrl,
    String? imageUrl,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: theme.colorScheme.surface,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (imageUrl != null)
              Container(
                height: 180,
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                clipBehavior: Clip.antiAlias,
                child: Image.asset(
                  imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: theme.colorScheme.primary.withOpacity(0.1),
                      child: Center(
                        child: Text(
                          'Image not found\nPlease add $imageUrl',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: theme.colorScheme.primary),
                        ),
                      ),
                    );
                  },
                ),
              )
            else
              // Project icon
              Container(
                width: 48,
                height: 48,
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  color: theme.colorScheme.primary,
                  size: 24,
                ),
              ),
            // Project title
            Text(
              title,
              style: theme.textTheme.titleLarge?.copyWith(
                color: theme.colorScheme.onSurface,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            // Project description
            Text(
              description,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurface.withOpacity(0.8),
                height: 1.6,
              ),
            ),
            const Spacer(),
            // Technologies
            Text(
              technologies,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 16),
            // View Project Button
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                if (url.isNotEmpty && url != '#')
                  FilledButton.tonal(
                    onPressed: () async {
                      if (await canLaunchUrl(Uri.parse(url))) {
                        await launchUrl(Uri.parse(url));
                      }
                    },
                    style: FilledButton.styleFrom(
                      backgroundColor: theme.colorScheme.primary.withOpacity(0.1),
                      foregroundColor: theme.colorScheme.primary,
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(appStoreUrl != null ? 'Play Store' : 'View Project'),
                  ),
                if (appStoreUrl != null)
                  FilledButton.tonal(
                    onPressed: () async {
                      if (await canLaunchUrl(Uri.parse(appStoreUrl))) {
                        await launchUrl(Uri.parse(appStoreUrl));
                      }
                    },
                    style: FilledButton.styleFrom(
                      backgroundColor: theme.colorScheme.primary.withOpacity(0.1),
                      foregroundColor: theme.colorScheme.primary,
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text('App Store'),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFloatingActionButton(ThemeData theme) {
    return FloatingActionButton(
      onPressed: () {
        _scrollController.animateTo(
          0,
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOut,
        );
      },
      backgroundColor: theme.colorScheme.primary,
      foregroundColor: theme.colorScheme.onPrimary,
      child: const Icon(Icons.arrow_upward),
    );
  }
}
