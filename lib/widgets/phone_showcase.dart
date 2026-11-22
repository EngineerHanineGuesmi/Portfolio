import 'package:flutter/material.dart';

import 'ui.dart';

/// Hero illustration: a phone drawn in code, showing mini versions of real projects.
class PhoneShowcase extends StatelessWidget {
  const PhoneShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final dark = theme.brightness == Brightness.dark;

    return AspectRatio(
      aspectRatio: 0.9,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          border: Border.all(color: theme.hairline),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              cs.primary.withValues(alpha: dark ? 0.22 : 0.20),
              cs.secondary.withValues(alpha: dark ? 0.12 : 0.40),
            ],
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            Positioned(
              right: -60,
              top: -60,
              child: _Circle(size: 220, color: cs.primary.withValues(alpha: 0.12)),
            ),
            Positioned(
              left: -40,
              bottom: -70,
              child: _Circle(size: 200, color: cs.secondary.withValues(alpha: 0.18)),
            ),
            const Center(
              child: FractionallySizedBox(
                heightFactor: 0.86,
                child: FittedBox(child: _Phone()),
              ),
            ),
            const Positioned(
              left: 14,
              bottom: 24,
              child: FittedBox(
                child: _Badge(
                  icon: Icons.school_rounded,
                  title: 'TakiAcademy',
                  subtitle: '100K+ downloads',
                ),
              ),
            ),
            const Positioned(
              right: 14,
              top: 28,
              child: FittedBox(
                child: _Badge(
                  icon: Icons.bolt_rounded,
                  title: '70% fewer crashes',
                  subtitle: 'Tests + Crashlytics',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Circle extends StatelessWidget {
  const _Circle({required this.size, required this.color});
  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) => Container(
        width: size,
        height: size,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      );
}

class _Badge extends StatelessWidget {
  const _Badge({required this.icon, required this.title, required this.subtitle});

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 10, 16, 10),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: theme.hairline),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.12),
            blurRadius: 24,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(color: theme.tint, shape: BoxShape.circle),
            child: Icon(icon, size: 18, color: theme.colorScheme.primary),
          ),
          const SizedBox(width: 10),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: theme.body(size: 13, weight: FontWeight.w700, color: theme.colorScheme.onSurface)
                      .copyWith(height: 1.2)),
              Text(subtitle, style: theme.body(size: 11.5).copyWith(height: 1.3)),
            ],
          ),
        ],
      ),
    );
  }
}

/// Fixed-size phone; the parent FittedBox scales it to fit.
class _Phone extends StatelessWidget {
  const _Phone();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final dark = theme.brightness == Brightness.dark;
    final screen = dark ? const Color(0xFF1A1518) : const Color(0xFFFDF6F8);

    return Container(
      width: 240,
      height: 500,
      padding: const EdgeInsets.all(7),
      decoration: BoxDecoration(
        color: const Color(0xFF161114),
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.25),
            blurRadius: 40,
            offset: const Offset(0, 20),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(33),
        child: Container(
          color: screen,
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('9:41', style: theme.body(size: 11, weight: FontWeight.w700, color: cs.onSurface)),
                  const Spacer(),
                  Container(
                    width: 60,
                    height: 16,
                    decoration: BoxDecoration(
                      color: const Color(0xFF161114),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  const Spacer(),
                  Icon(Icons.signal_cellular_alt_rounded, size: 13, color: cs.onSurface),
                  const SizedBox(width: 3),
                  Icon(Icons.battery_full_rounded, size: 13, color: cs.onSurface),
                ],
              ),
              const SizedBox(height: 20),
              Text('Good morning,', style: theme.body(size: 12).copyWith(height: 1.2)),
              Text('Your apps', style: theme.serif(24)),
              const SizedBox(height: 16),
              _MiniCard(
                icon: Icons.school_rounded,
                title: 'TakiAcademy',
                subtitle: 'Lesson 4 · Physics',
                progress: 0.62,
              ),
              const SizedBox(height: 10),
              _MiniCard(
                icon: Icons.storefront_rounded,
                title: 'BinYdik',
                subtitle: '2 new messages',
              ),
              const SizedBox(height: 10),
              _MiniCard(
                icon: Icons.dashboard_rounded,
                title: 'Servini KDS',
                subtitle: '3 orders ready',
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                decoration: BoxDecoration(
                  color: cs.surface,
                  borderRadius: BorderRadius.circular(999),
                  border: Border.all(color: theme.hairline),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(color: cs.primary, shape: BoxShape.circle),
                      child: Icon(Icons.home_rounded, size: 16, color: cs.onPrimary),
                    ),
                    Icon(Icons.search_rounded, size: 18, color: theme.muted),
                    Icon(Icons.person_outline_rounded, size: 18, color: theme.muted),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MiniCard extends StatelessWidget {
  const _MiniCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.progress,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final double? progress;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: cs.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: theme.hairline),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: theme.tint,
                  borderRadius: BorderRadius.circular(9),
                ),
                child: Icon(icon, size: 16, color: cs.primary),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: theme.body(size: 12, weight: FontWeight.w700, color: cs.onSurface)
                            .copyWith(height: 1.2)),
                    Text(subtitle, style: theme.body(size: 10.5).copyWith(height: 1.3)),
                  ],
                ),
              ),
            ],
          ),
          if (progress != null) ...[
            const SizedBox(height: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: progress,
                minHeight: 4,
                backgroundColor: theme.tint,
                color: cs.primary,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
