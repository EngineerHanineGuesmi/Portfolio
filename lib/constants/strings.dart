import 'package:flutter/material.dart';

class AppStrings {
  // App Info
  static const String appName = 'Hanine Guesmi';
  static const String appTagline = 'Mobile Engineer';

  // Navigation
  static const String home = 'Home';
  static const String about = 'About';
  static const String experience = 'Experience';
  static const String projects = 'Projects';
  static const String contact = 'Contact';

  // Hero Section
  static const String heroGreeting = 'Hi, I\'m';
  static const String heroName = 'Hanine Guesmi';
  static const String heroTitle = 'Mobile Engineer';
  static const String heroDescription =
      'I build exceptional digital experiences with Flutter and native Android. '
      'Currently focused on creating beautiful, responsive mobile applications.';
  static const String getInTouch = 'Get In Touch';
  static const String viewWork = 'View My Work';

  // About Section
  static const String aboutMe = 'About Me';
  static const String aboutDescription1 =
      'Hello! I\'m Hanine, a passionate Mobile Engineer with 4+ years of experience '
      'in building beautiful and functional mobile applications.';
  static const String aboutDescription2 =
      'I specialize in Flutter and native Android development, with a strong focus '
      'on creating responsive and accessible user interfaces. My goal is to build '
      'applications that not only look great but also provide a seamless user experience.';
  static const String technologiesTitle =
      'Here are a few technologies I\'ve been working with recently:';

  // Experience Section
  static const String workExperience = 'Work Experience';

  // Projects Section
  static const String featuredProjects = 'Featured Projects';

  // Contact Section
  static const String getInTouchTitle = 'Get In Touch';
  static const String contactDescription1 =
      'Have a project in mind or want to discuss potential opportunities?';
  static const String contactDescription2 =
      'I\'m currently looking for new opportunities, my inbox is always open. '
      'Whether you have a question or just want to say hi, I\'ll try my best to get back to you!';
  static const String sayHello = 'Say Hello';

  // Footer
  static String copyrightYear = '© ${DateTime.now().year} All Rights Reserved';
  static const String designedBy = 'Designed & Built by Hanine Guesmi';

  // Social Media
  static const String githubUrl = 'https://github.com/hanineguesmi';
  static const String linkedinUrl =
      'https://linkedin.com/in/hanine-guesmi-61218a195';
  static const String email = 'hanine.guesmi.work@gmail.com';

  // Experience Items
  static const List<Map<String, dynamic>> experiences = [
    {
      'position': 'Mobile Developer – Flutter',
      'company': 'Freelance',
      'location': 'Sousse, Tunisia',
      'duration': '09/2025 - Present',
      'points': [
        'Led the technical architecture of Flutter mobile applications, defining project structure and best practices.',
        'Supervised and mentored a small mobile development team, supporting code quality and delivery.',
        'Conducted code reviews and enforced Clean Architecture and best coding practices.',
        'Collaborated with backend and design teams to ensure consistent app performance and user experience.',
        'Defined the mobile development roadmap and ensured alignment with project goals.',
        'Optimized app performance using Flutter DevTools and profiling techniques.',
      ],
    },
    {
      'position': 'Mobile Developer – Flutter & Kotlin',
      'company': 'Softylines',
      'location': 'Sousse, Tunisia',
      'duration': '09/2021 - 09/2025',
      'points': [
        'Developed and maintained 8+ production apps (e-commerce, social media, edtech) with measurable performance improvements.',
        'Collaborated with designers, back-end engineers, product owners, and QA teams to deliver pixel-perfect UI.',
        'Participated in sprint planning and Agile ceremonies.',
        'Debugged and fixed app crashes, improving stability and user satisfaction.',
        'Implemented unit and integration testing; reduced crash rates by 70% using Crashlytics.',
        'Optimized app responsiveness and led code reviews.',
      ],
    },
  ];

  // Project Items
  static const List<Map<String, dynamic>> projectss = [
    {
      'title': 'TakiAcademy',
      'description':
          'First Tunisian e-learning app with 100K+ downloads featuring video streaming, progress tracking, and gamified learning modules.',
      'technologies': 'Flutter, Firebase, Socket.IO',
      'url':
          'https://play.google.com/store/apps/details?id=com.softylines.takiacademy&hl=en',
      'icon': Icons.school,
    },
    {
      'title': 'TakiKids',
      'description':
          'Educational Play Application for Kids, with interactive games modules including Drag and Drop, Arrow Link, Flip Flop, and other and learning activities.',
      'technologies': 'Kotlin, Jetpack Compose, Firebase',
      'url': 'https://www.proximabel.com/',
      'icon': Icons.gamepad_outlined,
    },
    {
      'title': 'LinkFoot',
      'description':
          'Football Community App with team matching, Reels, Voice/Video calls, private and group chat and FCM notifications.',
      'technologies': 'Flutter, WebRTC, Socket.IO, Stripe',
      'url':
          'https://play.google.com/store/apps/details?id=com.linkefoot.linkefootApp&hl=fr',
      'icon': Icons.sports_soccer,
    },
    {
      'title': 'Proxymabel',
      'description':
          'Stock Management App with RFID SDK integration and real-time sync for efficient inventory management.',
      'technologies': 'Kotlin, Jetpack Compose',
      'url': 'https://www.proximabel.com/',
      'icon': Icons.inventory,
    },
    {
      'title':
          'Delivery Boy App for Tunisian Restaurants (Chichkhan & Boritos)',
      'description': 'Mobile SaaS Application for Delivery Personnel,',
      'technologies': 'Flutter, WebRTC, Socket.IO, Stripe',
      'url':
          'https://play.google.com/store/apps/details?id=com.linkefoot.linkefootApp&hl=fr',
      'icon': Icons.delivery_dining,
    },
    {
      'title':
          'Delivery Boy App for Tunisian Restaurants (Chichkhan & Boritos)',
      'description': 'Mobile SaaS Application for Delivery Personnel,',
      'technologies': 'Flutter, WebRTC, Socket.IO, Stripe',
      'url':
          'https://play.google.com/store/apps/details?id=com.linkefoot.linkefootApp&hl=fr',
      'icon': Icons.fastfood,
    },
    {
      'title': 'Sulltan E-commerce App',
      'description':
          'A full-featured e-commerce mobile application with product browsing, cart management, and secure checkout.',
      'technologies': 'Flutter, Firebase FCM, Stripe',
      'url':
          'https://play.google.com/store/apps/details?id=com.softylines.takiacademy&hl=en',
      'icon': Icons.shopping_cart,
    }
  ];
}
