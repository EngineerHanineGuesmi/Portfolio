import 'package:flutter/material.dart';

import '../constants/portfolio_data.dart';
import 'ui.dart';

class SiteHeader extends StatelessWidget implements PreferredSizeWidget {
  const SiteHeader({
    super.key,
    required this.items,
    required this.activeIndex,
    required this.onSelect,
    required this.scrolled,
    required this.onContact,
  });

  final List<String> items;
  final int activeIndex;
  final ValueChanged<int> onSelect;
  final bool scrolled;
  final VoidCallback onContact;

  @override
  Size get preferredSize => const Size.fromHeight(76);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final narrow = isNarrow(context);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      height: 76,
      decoration: BoxDecoration(
        color: scrolled ? theme.scaffoldBackgroundColor : Colors.transparent,
        border: Border(
          bottom: BorderSide(color: scrolled ? theme.hairline : Colors.transparent),
        ),
      ),
      child: ContentWidth(
        child: Row(
          children: [
            Brand(onTap: () => onSelect(0)),
            const Spacer(),
            if (!narrow) ...[
              _NavPills(items: items, activeIndex: activeIndex, onSelect: onSelect),
              const Spacer(),
              PillButton(label: "Let's talk", onPressed: onContact, compact: true),
            ] else
              Builder(
                builder: (context) => IconButton(
                  tooltip: 'Menu',
                  icon: const Icon(Icons.menu_rounded),
                  onPressed: () => Scaffold.of(context).openEndDrawer(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class Brand extends StatelessWidget {
  const Brand({super.key, this.onTap});
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(PortfolioData.name, style: theme.serif(20, weight: FontWeight.w700)),
            const SizedBox(height: 2),
            Text('MOBILE ENGINEER · FLUTTER & ANDROID', style: theme.caps(size: 8.5)),
          ],
        ),
      ),
    );
  }
}

class _NavPills extends StatelessWidget {
  const _NavPills({required this.items, required this.activeIndex, required this.onSelect});

  final List<String> items;
  final int activeIndex;
  final ValueChanged<int> onSelect;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface.withValues(alpha: 0.8),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: theme.hairline),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (var i = 0; i < items.length; i++)
            _NavPill(label: items[i], active: i == activeIndex, onTap: () => onSelect(i)),
        ],
      ),
    );
  }
}

class _NavPill extends StatelessWidget {
  const _NavPill({required this.label, required this.active, required this.onTap});

  final String label;
  final bool active;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: active ? cs.primary : Colors.transparent,
            borderRadius: BorderRadius.circular(999),
          ),
          child: Text(
            label,
            style: theme.body(
              size: 13.5,
              weight: FontWeight.w600,
              color: active ? cs.onPrimary : theme.muted,
            ).copyWith(height: 1.2),
          ),
        ),
      ),
    );
  }
}

/// Slide-in menu for phones.
class SiteDrawer extends StatelessWidget {
  const SiteDrawer({
    super.key,
    required this.items,
    required this.activeIndex,
    required this.onSelect,
  });

  final List<String> items;
  final int activeIndex;
  final ValueChanged<int> onSelect;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Drawer(
      backgroundColor: theme.scaffoldBackgroundColor,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Brand(),
                  const Spacer(),
                  IconButton(
                    tooltip: 'Close menu',
                    icon: const Icon(Icons.close_rounded),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              for (var i = 0; i < items.length; i++)
                InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () {
                    Navigator.of(context).pop();
                    onSelect(i);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
                    child: Text(
                      items[i],
                      style: theme.serif(
                        28,
                        color: i == activeIndex ? theme.colorScheme.primary : null,
                      ),
                    ),
                  ),
                ),
              const Spacer(),
              PillButton(
                label: "Let's talk",
                icon: Icons.arrow_forward_rounded,
                onPressed: () {
                  Navigator.of(context).pop();
                  onSelect(items.length - 1);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
