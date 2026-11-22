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
  static const email = 'hanine.guesmi.work@gmail.com';
  static const githubUrl = 'https://github.com/hanineguesmi';
  static const linkedinUrl = 'https://linkedin.com/in/hanine-guesmi-61218a195';

  static const heroDescription =
      "I'm Hanine, a Mobile Engineer specializing in Flutter and native Android. "
      'I design, build and ship production apps end to end: clean architecture, '
      'smooth performance and pixel-perfect interfaces.';

  static const heroStats = [
    Metric('4+', 'Years building apps'),
    Metric('8+', 'Production apps'),
    Metric('100K+', 'TakiAcademy downloads'),
    Metric('70%', 'Fewer crashes'),
  ];

  static const companies = ['Neo', 'Servini', 'Softylines', 'BinYdik', 'Houloul'];

  static const featuredProjects = [
    Project(
      name: 'TakiAcademy',
      category: 'E-learning at national scale',
      description:
          'The first Tunisian e-learning app. I built video streaming and playback, '
          'progress tracking and gamified learning modules used by students across the country.',
      tags: ['Flutter', 'E-learning', 'Softylines'],
      tech: 'Flutter · Socket.IO · VdoCipher',
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
      tech: 'Flutter · Real-time chat · Scanner',
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
          'fraud prevention, with Moyasar payment integration. Built as a consultant at Neo.',
      tags: ['Flutter', 'Fintech', 'Neo'],
      tech: 'Flutter · Analytics · Security · Moyasar',
      icon: Icons.insights_rounded,
    ),
    Project(
      name: 'Servini ERP',
      category: 'Restaurant operations, real time',
      description:
          'A comprehensive ERP for tablet and mobile: Kitchen Display System, Fiche Technique '
          'and dynamic reporting, with real-time data through GraphQL and Apollo.',
      tags: ['Flutter', 'ERP', 'Servini'],
      tech: 'Flutter · GraphQL · Apollo',
      icon: Icons.dashboard_rounded,
      metrics: [Metric('KDS', 'Real-time kitchen display'), Metric('Tablet', 'and mobile layouts')],
    ),
  ];

  static const moreProjects = [
    Project(
      name: 'gift4You',
      category: 'Digital gifting',
      description:
          'A strategic platform that boosts customer engagement and simplifies digital gifting.',
      tags: [],
      tech: 'Flutter · UI/UX · REST APIs',
      icon: Icons.card_giftcard_rounded,
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
    Project(
      name: 'LinkFoot',
      category: 'Football community',
      description:
          'Team matching, Reels, voice and video calls, private and group chat.',
      tags: [],
      tech: 'Flutter · FCM · WebRTC · Socket.IO · Stripe',
      icon: Icons.sports_soccer_rounded,
      playUrl:
          'https://play.google.com/store/apps/details?id=com.linkefoot.linkefootApp&hl=fr',
    ),
    Project(
      name: 'Chichkhan & Boritos',
      category: 'Restaurant SaaS',
      description:
          'Two SaaS apps for restaurant management: a delivery app and an admin app.',
      tags: [],
      tech: 'Flutter · FCM · Flavors',
      icon: Icons.restaurant_rounded,
      playUrl: 'https://play.google.com/store/apps/details?id=com.chichkhan.app',
    ),
  ];

  static const principles = [
    Principle(
      Icons.account_tree_outlined,
      'Clean architecture',
      'Layered, testable code and thorough code reviews that keep teams moving fast.',
    ),
    Principle(
      Icons.speed_rounded,
      'Performance first',
      'Profiling with Flutter DevTools so every screen stays smooth and responsive.',
    ),
    Principle(
      Icons.verified_outlined,
      'Tested and shipped',
      'Unit and integration tests, Crashlytics and CI/CD: 70% fewer crashes, 50% faster releases.',
    ),
    Principle(
      Icons.auto_awesome_outlined,
      'Pixel-perfect UI',
      'Close work with designers, product and QA to deliver interfaces that feel right.',
    ),
  ];

  static const jobs = [
    Job('Developer Consultant', 'Neo', 'Tunisia', '2026 – Present', [
      'Expert technical consultancy and mobile development with international teams on key enterprise projects.',
      'Contributed to gift4You, a platform that boosts customer engagement and simplifies digital gifting.',
      'Worked on mozn, a financial intelligence platform for risk management and fraud prevention, with Moyasar integration.',
      'Built features for RMS (Resource Management System) to optimize resource allocation and efficiency.',
    ]),
    Job('Mobile Developer – Flutter', 'Servini', 'Tunisia', '02/2026 – Present', [
      'Developing a comprehensive ERP optimized for tablet and mobile with Flutter.',
      'Implementing Fiche Technique, Kitchen Display System (KDS) and dynamic reporting.',
      'Integrating real-time features with GraphQL and the Apollo client.',
    ]),
    Job('Mobile Developer – Flutter (BinYdik)', 'Freelance', 'Sousse, Tunisia', '03/2026 – Present', [
      'Built BinYdik from scratch: architecture, UI/UX (no Figma), development and testing for iOS and Android.',
      'Implemented real-time chat and robust QR and barcode scanning.',
      'Managed end-to-end releases on Google Play and the App Store; the Android app passed 1K+ downloads and trended on Play.',
      'Delivered a Flutter e-commerce app (catalog, cart, checkout, Google Maps), 40% faster with AI-assisted tooling.',
    ]),
    Job('Mobile Developer – Flutter & Kotlin', 'Softylines', 'Sousse, Tunisia', '09/2021 – 09/2025', [
      'Built 8+ cross-platform and native production apps (e-commerce, social, edtech) with measurable results.',
      'Worked with designers, back-end engineers, product owners, scrum masters and QA to deliver pixel-perfect UI.',
      'Led code reviews, enforced Clean Architecture and mentored 2 junior Flutter developers.',
      'Improved responsiveness and stability by profiling with Flutter DevTools.',
      'Cut crash rates by 70% with unit and integration tests and Crashlytics.',
      'Set up CI/CD with GitHub Actions, making releases 50% faster.',
    ]),
    Job("Final Year Internship – Bachelor's", 'Houloul', 'Sousse, Tunisia', '02/2021 – 07/2021', [
      'Analysis, design and development of a Django/Python order-tracking web app with Raspberry Pi camera integration.',
    ]),
  ];

  static const degrees = [
    Degree('Engineering Degree in Software Engineering', 'Polytechnic University of Sousse',
        'Sousse, Tunisia', '2021 – 2025', 'High honors'),
    Degree("Bachelor's in Information Technology", 'Higher Institute of Technological Studies',
        'Kairouan, Tunisia', '2018 – 2021', 'High honors'),
  ];

  static const about = [
    "Hello! I'm Hanine, a passionate Mobile Engineer with 4+ years of experience "
        'building beautiful and functional mobile applications.',
    'I specialize in Flutter and native Android, with a strong focus on responsive, '
        'accessible interfaces. My goal is to build apps that not only look great but '
        'also feel effortless to use.',
  ];

  static const skills = [
    'Flutter & Dart',
    'Kotlin & Jetpack Compose',
    'BLoC & Riverpod',
    'Clean Architecture',
    'Firebase',
    'REST APIs & WebSockets',
    'GraphQL & Apollo',
    'SQLite / Room / Hive',
    'CI/CD & Git',
    'Crashlytics & testing',
  ];

  static const contactText =
      "I'm currently open to new opportunities and my inbox is always open. "
      "Whether you have a project in mind or just want to say hi, I'll get back to you.";
}
