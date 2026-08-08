import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class NavBar extends StatefulWidget {
  final bool isScrolled;
  final Function(int) onItemTap;
  final int currentIndex;

  const NavBar({
    super.key,
    required this.isScrolled,
    required this.onItemTap,
    required this.currentIndex,
  });

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  final List<String> _navItems = [
    'Home',
    'About',
    'Experience',
    'Education',
    'Projects',
    'Contact',
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    final isSmallScreen = size.width < 800;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 40),
      decoration: BoxDecoration(
        color: widget.isScrolled
            ? theme.colorScheme.surface.withOpacity(0.9)
            : Colors.transparent,
        boxShadow: widget.isScrolled
            ? [
                BoxShadow(
                  color: theme.colorScheme.surface.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ]
            : null,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () => widget.onItemTap(0),
              child: Text(
                'HG',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.primary,
                  letterSpacing: 1.5,
                ),
              ),
            ),
          ),

          // Navigation Items
          if (!isSmallScreen) ..._buildNavItems(theme),

          // Resume Button
          if (!isSmallScreen)
            FilledButton(
              onPressed: () {
                // TODO: Add resume download functionality
                // _launchURL('YOUR_RESUME_LINK');
              },
              style: FilledButton.styleFrom(
                backgroundColor: theme.colorScheme.primary,
                foregroundColor: theme.colorScheme.onPrimary,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text('Download CV'),
            ),

          // Mobile Menu Button
          if (isSmallScreen)
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                // TODO: Implement mobile menu drawer
                Scaffold.of(context).openEndDrawer();
              },
            ),
        ],
      ),
    );
  }

  List<Widget> _buildNavItems(ThemeData theme) {
    return _navItems.asMap().entries.map((entry) {
      final index = entry.key;
      final item = entry.value;
      final isSelected = widget.currentIndex == index;

      return MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () => widget.onItemTap(index),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              border: isSelected
                  ? Border(
                      bottom: BorderSide(
                        color: theme.colorScheme.primary,
                        width: 2,
                      ),
                    )
                  : null,
            ),
            child: Text(
              item,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: isSelected
                    ? theme.colorScheme.primary
                    : theme.colorScheme.onBackground,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ),
        ),
      );
    }).toList();
  }

  // Helper method to launch URLs
  void _launchURL(String url) async {
    // if (await canLaunch(url)) {
    //   await launch(url);
    // } else {
    //   throw 'Could not launch $url';
    // }
  }
}
