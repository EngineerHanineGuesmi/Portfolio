import 'package:flutter/material.dart';

/// All the real content shown on the site, in one place.
/// Edit this file to update projects, jobs, stats or skills.

class Metric {
  final String value;
  final String label;
  const Metric(this.value, this.label);
}

class Project {
  final String name;
  final String category;
  final String description;
  final List<String> tags;
  final String tech;
  final IconData icon;
  final List<Metric> metrics;
  final String? playUrl;
  final String? appStoreUrl;
  final String? webUrl;

  const Project({
    required this.name,
    required this.category,
    required this.description,
    required this.tags,
    required this.tech,
    required this.icon,
    this.metrics = const [],
    this.playUrl,
    this.appStoreUrl,
    this.webUrl,
  });

  String? get primaryUrl => playUrl ?? appStoreUrl ?? webUrl;
}

class Job {
  final String role;
  final String company;
  final String location;
  final String period;
  final List<String> points;
  const Job(this.role, this.company, this.location, this.period, this.points);
}

class Degree {
  final String title;
  final String school;
  final String location;
  final String period;
  final String note;
  const Degree(this.title, this.school, this.location, this.period, this.note);
}

class Principle {
  final IconData icon;
  final String title;
  final String description;
  const Principle(this.icon, this.title, this.description);
}

class PortfolioData {
  static const name = 'Hanine Guesmi';
  static const role = 'Mobile Engineer';
  static const location = 'Tunisia · Open to relocation';
  static const email = 'hanine.guesmi.work@gmail.com';
  static const githubUrl = 'https://github.com/hanineguesmi';
  static const linkedinUrl = 'https://linkedin.com/in/hanine-guesmi-61218a195';

  /// The CV PDF lives in web/ so it is served next to the site.
  static const cvFile = 'Hanine_Guesmi_CV.pdf';

  static const heroDescription =
      "I'm Hanine, a Mobile Engineer with 5 years of experience in Flutter and Kotlin. "
      'I build scalable, high-performance apps with Clean Architecture, with a strong '
      'focus on code quality, maintainability and UI/UX.';

  static const heroStats = [
    Metric('5', 'Years building apps'),
    Metric('8+', 'Production apps'),
    Metric('100K+', 'TakiAcademy downloads'),
    Metric('70%', 'Fewer crashes'),
  ];

  static const companies = ['NEO', 'Servini Solutions', 'Softylines', 'BinYdik', 'TakiAcademy', 'LinkFoot'];

  static const featuredProjects = [
    Project(
      name: 'TakiAcademy',
      category: "Tunisia's first e-learning app",
      description:
          'Video streaming and progress tracking over Socket.IO, in-app purchases and '
          'Click-to-Pay payments, used by students across the country.',
      tags: ['Flutter', 'E-learning', 'Softylines'],
      tech: 'Flutter · FCM · Socket.IO · VdoCipher · In-App Purchases · reCAPTCHA',
      icon: Icons.school_rounded,
      metrics: [Metric('100K+', 'Downloads'), Metric('1st', 'Tunisian e-learning app')],
      playUrl:
          'https://play.google.com/store/apps/details?id=com.softylines.takiacademy&hl=en',
    ),
    Project(
      name: 'BinYdik',
      category: 'Designed and shipped solo',
      description:
          'Built from scratch with full ownership of architecture, UI/UX (no Figma), development '
          'and testing. Real-time chat, QR and barcode scanning, and releases on both stores.',
      tags: ['Flutter', 'iOS & Android', 'Freelance'],
      tech: 'Flutter · Real-time chat · QR & barcode scanning',
      icon: Icons.storefront_rounded,
      metrics: [Metric('1K+', 'Downloads, trending on Play'), Metric('2', 'App stores')],
      playUrl:
          'https://play.google.com/store/apps/details?id=com.appilix.app1761846119&hl=en',
      appStoreUrl: 'https://apps.apple.com/tn/app/binydik/id6759522629',
    ),
    Project(
      name: 'mozn',
      category: 'Financial intelligence',
      description:
          'An advanced platform for financial intelligence, central to risk management and '
          'fraud prevention, with Moyasar payment integration. Built as a Senior Software Engineer at NEO.',
      tags: ['Flutter', 'Fintech', 'NEO'],
      tech: 'Flutter · Analytics · Security · Moyasar',
      icon: Icons.insights_rounded,
    ),
    Project(
      name: 'Servini ERP',
      category: 'Cross-platform ERP',
      description:
          'An Enterprise Resource Planning app for mobile, iPad and tablet, desktop and web, '
          'integrated with backend services through GraphQL.',
      tags: ['Flutter', 'ERP', 'Servini Solutions'],
      tech: 'Flutter · GraphQL',
      icon: Icons.dashboard_rounded,
      metrics: [Metric('4', 'Platforms: mobile, tablet, desktop, web')],
    ),
    Project(
      name: 'LinkFoot',
      category: 'Football community',
      description:
          'Team matching, reels, audio and video calls, private and group chats, '
          'and push notifications.',
      tags: ['Flutter', 'Social', 'Softylines'],
      tech: 'Flutter · FCM · WebRTC · Socket.IO · Stripe',
      icon: Icons.sports_soccer_rounded,
      playUrl:
          'https://play.google.com/store/apps/details?id=com.linkefoot.linkefootApp&hl=fr',
    ),
  ];

  static const moreProjects = [
    Project(
      name: 'gift4You',
      category: 'Digital gifting · NEO',
      description:
          'A platform that boosts customer engagement and simplifies digital gifting.',
      tags: [],
      tech: 'Flutter · UI/UX · REST APIs',
      icon: Icons.card_giftcard_rounded,
    ),
    Project(
      name: 'Sultan',
      category: 'Online grocery store',
      description: 'Grocery shopping with payments, maps and rich media, on both stores.',
      tags: [],
      tech: 'Flutter · FCM · Stripe · Google Maps · Animations',
      icon: Icons.shopping_basket_rounded,
    ),
    Project(
      name: 'Chichkhan & Boritos',
      category: 'Restaurant management',
      description: 'Two restaurant apps: a delivery app and an admin app.',
      tags: [],
      tech: 'Flutter · FCM · Flavors · Geolocator',
      icon: Icons.restaurant_rounded,
      playUrl: 'https://play.google.com/store/apps/details?id=com.chichkhan.app',
    ),
    Project(
      name: 'Taki Kids',
      category: 'Educational game · 10K+ downloads',
      description:
          'An educational game for kids with drag-and-drop, matching and flip-card activities.',
      tags: [],
      tech: 'Kotlin · Animations · FCM · Room',
      icon: Icons.child_care_rounded,
      playUrl: 'https://play.google.com/store/apps/details?id=com.softylines.takikids',
    ),
    Project(
      name: 'Proxymabel',
      category: 'Inventory management',
      description: 'Stock management with RFID SDK integration and real-time sync.',
      tags: [],
      tech: 'Kotlin · Jetpack Compose',
      icon: Icons.inventory_2_rounded,
      webUrl: 'https://www.proximabel.com/',
    ),
  ];

  static const principles = [
    Principle(
      Icons.account_tree_outlined,
      'Clean architecture',
      'Clean Architecture, MVVM and dependency injection for code that stays maintainable.',
    ),
    Principle(
      Icons.speed_rounded,
      'Performance first',
      'Profiling with Flutter DevTools so every screen stays smooth and responsive.',
    ),
    Principle(
      Icons.verified_outlined,
      'Tested and stable',
      'Unit, widget and integration tests with Crashlytics: 70% fewer crashes.',
    ),
    Principle(
      Icons.groups_outlined,
      'Team player',
      'Agile and Scrum work with designers, backend developers, product owners and QA.',
    ),
  ];

  static const jobs = [
    Job('Senior Software Engineer', 'NEO', 'Riyadh, Saudi Arabia · Remote', '04/2026 – Present', [
      'Full-time mobile app development with international teams on key enterprise projects.',
      'Worked on mozn, a financial intelligence platform for risk management and fraud prevention, with Moyasar integration.',
      'Contributed to gift4You, a platform that boosts customer engagement and simplifies digital gifting.',
      'Built features for RMS (Resource Management System) to optimize resource allocation and efficiency.',
    ]),
    Job('Flutter Developer', 'Servini Solutions', 'Sousse, Tunisia', '02/2026 – Present', [
      'Developed a cross-platform ERP application for mobile, iPad/tablet, desktop and web.',
      'Worked with cross-functional teams on high-quality deliverables and smooth backend integration using GraphQL.',
    ]),
    Job('Mobile Developer – Flutter (BinYdik)', 'Freelance', 'Sousse, Tunisia', '12/2025 – 02/2026', [
      'Built BinYdik from scratch, owning the architecture, UI/UX design (no Figma), development and testing.',
      'Launched the latest Android version, which passed 1K+ downloads and trended on the Play Store.',
      'Implemented real-time chat and robust QR and barcode scanning.',
      'Managed end-to-end releases on Google Play and the App Store.',
    ]),
    Job('Mobile Developer – Flutter & Android (Kotlin)', 'Softylines', 'Sousse, Tunisia', '09/2021 – 11/2025', [
      'Developed and maintained 8+ production apps (e-commerce, social networking, edtech).',
      'Collaborated with designers, backend developers, product owners, Scrum Masters and QA.',
      'Took part in Agile ceremonies and sprint planning.',
      'Cut crash rates by 70% with unit and integration tests and Firebase Crashlytics.',
      'Improved responsiveness and performance with Flutter DevTools.',
    ]),
  ];

  static const degrees = [
    Degree('National Software Engineering Degree', 'Polytechnic School of Sousse',
        'Sousse, Tunisia', '2021 – 2025', 'High honors'),
    Degree("Bachelor's in Information Technology", 'Higher Institute of Technological Studies',
        'Kairouan, Tunisia', '2018 – 2021', 'High honors'),
  ];

  static const about = [
    "Hello! I'm Hanine, a Mobile Engineer with 5 years of experience in Flutter and "
        'Kotlin, based in Tunisia and open to relocation.',
    'I build scalable, high-performance apps with Clean Architecture, with solid '
        'experience in API integration and Agile/Scrum teams. I care about code quality, '
        'maintainability and interfaces that feel effortless to use.',
  ];

  static const skills = [
    'Flutter & Dart',
    'Kotlin & Jetpack Compose',
    'BLoC · Riverpod · Provider',
    'Clean Architecture · MVVM',
    'GetIt · Injectable · Hilt',
    'GraphQL & REST (Dio, Retrofit)',
    'Firebase · FCM · Crashlytics',
    'SQLite · Hive · Room',
    'SSL pinning · Secure storage',
    'Unit, widget & integration tests',
    'Fastlane · TestFlight · Play Console',
  ];

  static const spokenLanguages = 'Arabic (native) · English (fluent) · French (advanced)';

  static const contactText =
      "I'm currently open to new opportunities, including relocation. "
      "Whether you have a project in mind or just want to say hi, I'll get back to you.";
}
