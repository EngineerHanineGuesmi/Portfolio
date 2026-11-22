import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/portfolio_data.dart';

/// Shared building blocks for the portfolio layout.

const double kMaxContentWidth = 1180;

Future<void> openLink(String url) async {
  await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
}

/// Opens the CV PDF served next to the site (works under any base path).
Future<void> openCv() => openLink(Uri.base.resolve(PortfolioData.cvFile).toString());

bool isNarrow(BuildContext context) => MediaQuery.sizeOf(context).width < 900;

extension SiteTheme on ThemeData {
  Color get muted => colorScheme.onSurface.withValues(alpha: 0.70);
  Color get faint => colorScheme.onSurface.withValues(alpha: 0.48);
  Color get hairline => colorScheme.outline;
  Color get tint => colorScheme.primary
      .withValues(alpha: brightness == Brightness.dark ? 0.14 : 0.10);

  /// Playfair Display heading style.
  TextStyle serif(double size, {FontWeight weight = FontWeight.w600, Color? color}) =>
      textTheme.displaySmall!.copyWith(
        fontSize: size,
        fontWeight: weight,
        color: color ?? colorScheme.onSurface,
        height: 1.15,
        letterSpacing: size > 30 ? -0.6 : -0.2,
      );

  /// Small uppercase label.
  TextStyle caps({Color? color, double size = 10.5}) => textTheme.labelSmall!.copyWith(
        fontSize: size,
        fontWeight: FontWeight.w700,
        letterSpacing: 1.5,
        color: color ?? faint,
      );

  TextStyle body({double size = 16, Color? color, FontWeight weight = FontWeight.w400}) =>
      textTheme.bodyLarge!.copyWith(
        fontSize: size,
        height: 1.65,
        letterSpacing: 0.1,
        fontWeight: weight,
        color: color ?? muted,
      );
}

/// Centers content and caps its width, with page gutters.
class ContentWidth extends StatelessWidget {
  const ContentWidth({super.key, required this.child, this.top = 0, this.bottom = 0});

  final Widget child;
  final double top;
  final double bottom;

  @override
  Widget build(BuildContext context) {
    final gutter = MediaQuery.sizeOf(context).width < 600 ? 20.0 : 40.0;
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: kMaxContentWidth + gutter * 2),
        child: Padding(
          padding: EdgeInsets.fromLTRB(gutter, top, gutter, bottom),
          child: child,
        ),
      ),
    );
  }
}

/// Small rounded label with a dot, used above headings.
class Eyebrow extends StatelessWidget {
  const Eyebrow(this.text, {super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: theme.tint,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: theme.colorScheme.primary,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 8),
          Text(text.toUpperCase(), style: theme.caps(color: theme.colorScheme.primary)),
        ],
      ),
    );
  }
}

/// A heading where some words are set in rose italics.
class AccentTitle extends StatelessWidget {
  const AccentTitle(this.parts, {super.key, required this.style, this.textAlign = TextAlign.start});

  final List<(String, bool)> parts;
  final TextStyle style;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;
    return Text.rich(
      TextSpan(children: [
        for (final (text, accent) in parts)
          TextSpan(
            text: text,
            style: accent
                ? style.copyWith(fontStyle: FontStyle.italic, color: primary)
                : style,
          ),
      ]),
      textAlign: textAlign,
    );
  }
}

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.eyebrow,
    required this.title,
    this.subtitle,
    this.centered = false,
  });

  final String eyebrow;
  final List<(String, bool)> title;
  final String? subtitle;
  final bool centered;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final narrow = isNarrow(context);
    return Column(
      crossAxisAlignment: centered ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Eyebrow(eyebrow),
        const SizedBox(height: 16),
        AccentTitle(
          title,
          style: theme.serif(narrow ? 32 : 44),
          textAlign: centered ? TextAlign.center : TextAlign.start,
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 12),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 620),
            child: Text(
              subtitle!,
              style: theme.body(),
              textAlign: centered ? TextAlign.center : TextAlign.start,
            ),
          ),
        ],
      ],
    );
  }
}

/// A bordered card that lifts slightly on hover.
class HoverCard extends StatefulWidget {
  const HoverCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(24),
    this.radius = 24,
    this.onTap,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final double radius;
  final VoidCallback? onTap;

  @override
  State<HoverCard> createState() => _HoverCardState();
}

class _HoverCardState extends State<HoverCard> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primary = theme.colorScheme.primary;
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      cursor: widget.onTap != null ? SystemMouseCursors.click : MouseCursor.defer,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          curve: Curves.easeOut,
          transform: Matrix4.translationValues(0, _hover ? -4 : 0, 0),
          padding: widget.padding,
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(widget.radius),
            border: Border.all(
              color: _hover ? primary.withValues(alpha: 0.45) : theme.hairline,
            ),
            boxShadow: [
              BoxShadow(
                color: primary.withValues(alpha: _hover ? 0.12 : 0.0),
                blurRadius: 30,
                offset: const Offset(0, 12),
              ),
            ],
          ),
          child: widget.child,
        ),
      ),
    );
  }
}

class PillButton extends StatelessWidget {
  const PillButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.filled = true,
    this.compact = false,
  });

  final String label;
  final VoidCallback onPressed;
  final IconData? icon;
  final bool filled;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final padding = compact
        ? const EdgeInsets.symmetric(horizontal: 18, vertical: 12)
        : const EdgeInsets.symmetric(horizontal: 24, vertical: 18);
    final text = theme.textTheme.labelLarge!.copyWith(
      fontSize: compact ? 13.5 : 15,
      fontWeight: FontWeight.w700,
      letterSpacing: 0.2,
    );
    final child = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(label),
        if (icon != null) ...[const SizedBox(width: 8), Icon(icon, size: 17)],
      ],
    );
    if (filled) {
      return FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          shape: const StadiumBorder(),
          padding: padding,
          textStyle: text,
          elevation: 0,
        ),
        child: child,
      );
    }
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        shape: const StadiumBorder(),
        padding: padding,
        textStyle: text,
        foregroundColor: theme.colorScheme.onSurface,
        side: BorderSide(color: theme.colorScheme.onSurface.withValues(alpha: 0.22)),
      ),
      child: child,
    );
  }
}

class TagChip extends StatelessWidget {
  const TagChip(this.text, {super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: theme.tint,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(text.toUpperCase(),
          style: theme.caps(color: theme.colorScheme.primary, size: 10)),
    );
  }
}

class MetricTile extends StatelessWidget {
  const MetricTile({super.key, required this.value, required this.label, this.outlined = false});

  final String value;
  final String label;
  final bool outlined;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
      decoration: BoxDecoration(
        color: outlined ? theme.colorScheme.surface : theme.tint,
        borderRadius: BorderRadius.circular(16),
        border: outlined ? Border.all(color: theme.hairline) : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(value, style: theme.serif(26, color: theme.colorScheme.primary)),
          const SizedBox(height: 4),
          Text(label.toUpperCase(), style: theme.caps(size: 9.5)),
        ],
      ),
    );
  }
}

/// Lays children out in equal-height rows with a column count based on width.
class ResponsiveGrid extends StatelessWidget {
  const ResponsiveGrid({
    super.key,
    required this.children,
    required this.columnsFor,
    this.spacing = 20,
  });

  final List<Widget> children;
  final int Function(double width) columnsFor;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final cols = columnsFor(constraints.maxWidth).clamp(1, 6);
      final rows = <Widget>[];
      for (var i = 0; i < children.length; i += cols) {
        final cells = <Widget>[];
        for (var j = 0; j < cols; j++) {
          if (j > 0) cells.add(SizedBox(width: spacing));
          final index = i + j;
          cells.add(Expanded(
            child: index < children.length ? children[index] : const SizedBox(),
          ));
        }
        if (rows.isNotEmpty) rows.add(SizedBox(height: spacing));
        rows.add(IntrinsicHeight(
          child: Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: cells),
        ));
      }
      return Column(children: rows);
    });
  }
}

class LinkButton extends StatelessWidget {
  const LinkButton({super.key, required this.label, required this.url});
  final String label;
  final String url;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextButton(
      onPressed: () => openLink(url),
      style: TextButton.styleFrom(
        foregroundColor: theme.colorScheme.primary,
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(label, style: theme.body(size: 14.5, color: theme.colorScheme.primary, weight: FontWeight.w700)),
          const SizedBox(width: 6),
          const Icon(Icons.north_east_rounded, size: 16),
        ],
      ),
    );
  }
}
