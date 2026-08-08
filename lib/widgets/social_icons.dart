import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialIcons extends StatelessWidget {
  const SocialIcons({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildSocialIcon(
          context,
          icon: FontAwesomeIcons.github,
          url: 'https://github.com/hanineguesmi',
          tooltip: 'GitHub',
        ),
        const SizedBox(width: 16),
        _buildSocialIcon(
          context,
          icon: FontAwesomeIcons.linkedin,
          url: 'https://linkedin.com/in/hanine-guesmi-61218a195',
          tooltip: 'LinkedIn',
        ),
        const SizedBox(width: 16),
        _buildSocialIcon(
          context,
          icon: FontAwesomeIcons.envelope,
          url: 'mailto:hanine.guesmi.work@gmail.com',
          tooltip: 'Email',
        ),
      ],
    );
  }

  Widget _buildSocialIcon(
    BuildContext context, {
    required IconData icon,
    required String url,
    required String tooltip,
  }) {
    final theme = Theme.of(context);
    
    return Tooltip(
      message: tooltip,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () async {
            if (await canLaunchUrl(Uri.parse(url))) {
              await launchUrl(Uri.parse(url));
            }
          },
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: theme.colorScheme.surface,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: theme.colorScheme.onBackground.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Icon(
              icon,
              size: 18,
              color: theme.colorScheme.onBackground,
            ),
          ),
        ),
      ),
    );
  }
}
