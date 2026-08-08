import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String number;
  final String title;
  final Color? color;

  const SectionTitle({
    super.key,
    required this.number,
    required this.title,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          number,
          style: theme.textTheme.headlineLarge?.copyWith(
            color: color ?? theme.colorScheme.primary.withOpacity(0.2),
            fontWeight: FontWeight.bold,
            height: 0.8,
          ),
        ),
        const SizedBox(width: 16),
        Text(
          title,
          style: theme.textTheme.headlineSmall?.copyWith(
            color: color ?? theme.colorScheme.onBackground,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Divider(
            color: color ?? theme.colorScheme.onBackground.withOpacity(0.2),
            thickness: 1,
            height: 1,
          ),
        ),
      ],
    );
  }
}
