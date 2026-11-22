import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants/portfolio_data.dart';
import '../widgets/phone_showcase.dart';
import '../widgets/site_header.dart';
import '../widgets/ui.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const _navItems = ['Home', 'Work', 'Experience', 'About', 'Contact'];

  final _scroll = ScrollController();
  final _sectionKeys = List.generate(_navItems.length, (_) => GlobalKey());
  int _active = 0;
  bool _scrolled = false;

  @override
  void initState() {
    super.initState();
    _scroll.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scroll.dispose();
    super.dispose();
  }

  void _onScroll() {
    final scrolled = _scroll.offset > 24;
    var active = 0;
    for (var i = 0; i < _sectionKeys.length; i++) {
      final box = _sectionKeys[i].currentContext?.findRenderObject() as RenderBox?;
      if (box == null || !box.attached) continue;
      if (box.localToGlobal(Offset.zero).dy <= 160) active = i;
    }
    if (_scroll.position.pixels >= _scroll.position.maxScrollExtent - 8) {
      active = _sectionKeys.length - 1;
    }
    if (scrolled != _scrolled || active != _active) {
      setState(() {
        _scrolled = scrolled;
        _active = active;
      });
    }
  }

  void _goTo(int index) {
    if (index == 0) {
      _scroll.animateTo(0, duration: const Duration(milliseconds: 700), curve: Curves.easeInOutCubic);
      return;
    }
    final context = _sectionKeys[index].currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final contactIndex = _navItems.length - 1;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: SiteHeader(
        items: _navItems,
        activeIndex: _active,
        onSelect: _goTo,
        scrolled: _scrolled,
        onContact: () => _goTo(contactIndex),
      ),
      endDrawer: SiteDrawer(items: _navItems, activeIndex: _active, onSelect: _goTo),
      body: SingleChildScrollView(
        controller: _scroll,
        child: Column(
          children: [
            KeyedSubtree(
              key: _sectionKeys[0],
              child: _Hero(onWork: () => _goTo(1), onContact: () => _goTo(contactIndex)),
            ),
            const _CompanyStrip(),
            KeyedSubtree(key: _sectionKeys[1], child: const _WorkSection()),
            const _PrinciplesSection(),
            KeyedSubtree(key: _sectionKeys[2], child: const _ExperienceSection()),
            KeyedSubtree(key: _sectionKeys[3], child: const _AboutSection()),
            KeyedSubtree(key: _sectionKeys[4], child: const _ContactSection()),
          ],
        ),
      ),
      floatingActionButton: AnimatedScale(
        scale: _scrolled ? 1 : 0,
        duration: const Duration(milliseconds: 200),
        child: FloatingActionButton.small(
          tooltip: 'Back to top',
          onPressed: () => _goTo(0),
          shape: const CircleBorder(),
          child: const Icon(Icons.arrow_upward_rounded),
        ),
      ),
    );
  }
}

// ───────────────────────────── Hero ─────────────────────────────

class _Hero extends StatelessWidget {
  const _Hero({required this.onWork, required this.onContact});

  final VoidCallback onWork;
  final VoidCallback onContact;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = MediaQuery.sizeOf(context).width;
    final narrow = isNarrow(context);
    final headline = narrow ? (width * 0.105).clamp(34.0, 54.0) : (width * 0.05).clamp(44.0, 66.0);

    final text = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Eyebrow('Open to new opportunities'),
        const SizedBox(height: 24),
        AccentTitle(
          const [
            ('Crafting ', false),
            ('fluid', true),
            (' mobile ', false),
            ('experiences', true),
            (' for ambitious products.', false),
          ],
          style: theme.serif(headline).copyWith(height: 1.08),
        ),
        const SizedBox(height: 22),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 540),
          child: Text(PortfolioData.heroDescription, style: theme.body(size: 17)),
        ),
        const SizedBox(height: 32),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            PillButton(label: 'Explore my work', icon: Icons.arrow_downward_rounded, onPressed: onWork),
            PillButton(label: "Let's talk", filled: false, onPressed: onContact),
          ],
        ),
        const SizedBox(height: 40),
        ResponsiveGrid(
          spacing: 12,
          columnsFor: (w) => w > 520 ? 4 : 2,
          children: [
            for (final m in PortfolioData.heroStats)
              MetricTile(value: m.value, label: m.label, outlined: true),
          ],
        ),
      ],
    )
        .animate()
        .fadeIn(duration: 600.ms)
        .slideY(begin: 0.05, end: 0, duration: 600.ms, curve: Curves.easeOutCubic);

    final visual = const PhoneShowcase()
        .animate()
        .fadeIn(delay: 150.ms, duration: 700.ms)
        .scale(begin: const Offset(0.96, 0.96), end: const Offset(1, 1), duration: 700.ms);

    return ContentWidth(
      top: narrow ? 108 : 132,
      bottom: narrow ? 56 : 80,
      child: narrow
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                text,
                const SizedBox(height: 48),
                Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 440),
                    child: visual,
                  ),
                ),
              ],
            )
          : Row(
              children: [
                Expanded(flex: 6, child: text),
                const SizedBox(width: 56),
                Expanded(flex: 5, child: visual),
              ],
            ),
    );
  }
}

// ───────────────────────────── Company strip ─────────────────────────────

class _CompanyStrip extends StatelessWidget {
  const _CompanyStrip();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final narrow = isNarrow(context);
    final label = Text("WHERE I'VE BUILT", style: theme.caps());
    final names = Wrap(
      alignment: narrow ? WrapAlignment.start : WrapAlignment.spaceBetween,
      spacing: 32,
      runSpacing: 12,
      children: [
        for (final c in PortfolioData.companies)
          Text(
            c.toUpperCase(),
            style: theme.serif(18, color: theme.muted).copyWith(letterSpacing: 2.5),
          ),
      ],
    );

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 28),
      decoration: BoxDecoration(
        border: Border.symmetric(horizontal: BorderSide(color: theme.hairline)),
      ),
      child: ContentWidth(
        child: narrow
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [label, const SizedBox(height: 14), names],
              )
            : Row(
                children: [label, const SizedBox(width: 48), Expanded(child: names)],
              ),
      ),
    );
  }
}

// ───────────────────────────── Work ─────────────────────────────

class _WorkSection extends StatelessWidget {
  const _WorkSection();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ContentWidth(
      top: 96,
      bottom: 48,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(
            eyebrow: 'Selected work',
            title: [('Selected works ', false), ('& systems', true)],
            subtitle:
                "Production apps I've designed, built and shipped, from e-learning at 100K+ "
                'downloads to fintech and restaurant ERPs.',
          ),
          const SizedBox(height: 48),
          for (var i = 0; i < PortfolioData.featuredProjects.length; i++) ...[
            if (i > 0) const SizedBox(height: 24),
            _FeaturedProjectCard(
              project: PortfolioData.featuredProjects[i],
              reversed: i.isOdd,
            ),
          ],
          const SizedBox(height: 72),
          Text('More projects', style: theme.serif(28)),
          const SizedBox(height: 24),
          ResponsiveGrid(
            columnsFor: (w) => w > 1000 ? 3 : (w > 620 ? 2 : 1),
            children: [
              for (final p in PortfolioData.moreProjects) _ProjectCard(project: p),
            ],
          ),
        ],
      ),
    );
  }
}

class _FeaturedProjectCard extends StatelessWidget {
  const _FeaturedProjectCard({required this.project, required this.reversed});

  final Project project;
  final bool reversed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return HoverCard(
      padding: const EdgeInsets.all(14),
      radius: 28,
      child: LayoutBuilder(builder: (context, constraints) {
        final wide = constraints.maxWidth > 760;
        final visual = _ProjectVisual(project: project, height: wide ? 360 : 220);
        final content = Padding(
          padding: EdgeInsets.all(wide ? 28 : 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(spacing: 8, runSpacing: 8, children: [for (final t in project.tags) TagChip(t)]),
              const SizedBox(height: 18),
              Text(project.name, style: theme.serif(wide ? 40 : 30)),
              const SizedBox(height: 6),
              Text(
                project.category,
                style: theme.serif(17, weight: FontWeight.w500, color: theme.colorScheme.primary)
                    .copyWith(fontStyle: FontStyle.italic),
              ),
              const SizedBox(height: 14),
              Text(project.description, style: theme.body()),
              if (project.metrics.isNotEmpty) ...[
                const SizedBox(height: 22),
                Row(
                  children: [
                    for (var i = 0; i < project.metrics.length; i++) ...[
                      if (i > 0) const SizedBox(width: 12),
                      Expanded(
                        child: MetricTile(
                          value: project.metrics[i].value,
                          label: project.metrics[i].label,
                        ),
                      ),
                    ],
                  ],
                ),
              ],
              const SizedBox(height: 18),
              Text(project.tech, style: theme.body(size: 13.5, color: theme.faint)),
              if (project.playUrl != null || project.appStoreUrl != null || project.webUrl != null) ...[
                const SizedBox(height: 8),
                Wrap(
                  spacing: 16,
                  children: [
                    if (project.playUrl != null) LinkButton(label: 'Google Play', url: project.playUrl!),
                    if (project.appStoreUrl != null) LinkButton(label: 'App Store', url: project.appStoreUrl!),
                    if (project.webUrl != null) LinkButton(label: 'Website', url: project.webUrl!),
                  ],
                ),
              ],
            ],
          ),
        );

        if (!wide) {
          return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [visual, content]);
        }
        final children = [
          Expanded(flex: 5, child: visual),
          const SizedBox(width: 8),
          Expanded(flex: 6, child: content),
        ];
        return Row(children: reversed ? children.reversed.toList() : children);
      }),
    );
  }
}

class _ProjectVisual extends StatelessWidget {
  const _ProjectVisual({required this.project, required this.height});

  final Project project;
  final double height;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final dark = theme.brightness == Brightness.dark;
    return Container(
      height: height,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            cs.primary.withValues(alpha: dark ? 0.24 : 0.20),
            cs.tertiary.withValues(alpha: dark ? 0.08 : 0.12),
            cs.secondary.withValues(alpha: dark ? 0.16 : 0.38),
          ],
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            right: -50,
            top: -50,
            child: Container(
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: cs.primary.withValues(alpha: 0.25), width: 1.5),
              ),
            ),
          ),
          Positioned(
            left: -30,
            bottom: -60,
            child: Container(
              width: 160,
              height: 160,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: cs.surface.withValues(alpha: 0.35),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 92,
                  height: 92,
                  decoration: BoxDecoration(
                    color: cs.surface,
                    borderRadius: BorderRadius.circular(26),
                    border: Border.all(color: theme.hairline),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.12),
                        blurRadius: 30,
                        offset: const Offset(0, 14),
                      ),
                    ],
                  ),
                  child: Icon(project.icon, size: 42, color: cs.primary),
                ),
                const SizedBox(height: 16),
                Text(project.name, style: theme.serif(20)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ProjectCard extends StatelessWidget {
  const _ProjectCard({required this.project});
  final Project project;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final url = project.primaryUrl;
    return HoverCard(
      onTap: url == null ? null : () => openLink(url),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: theme.tint,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(project.icon, size: 22, color: theme.colorScheme.primary),
              ),
              const Spacer(),
              if (url != null) Icon(Icons.north_east_rounded, size: 18, color: theme.faint),
            ],
          ),
          const SizedBox(height: 18),
          Text(project.name, style: theme.serif(22)),
          const SizedBox(height: 4),
          Text(
            project.category,
            style: theme.body(size: 13.5, weight: FontWeight.w600, color: theme.colorScheme.primary),
          ),
          const SizedBox(height: 10),
          Text(project.description, style: theme.body(size: 14.5)),
          const Spacer(),
          const SizedBox(height: 16),
          Text(project.tech, style: theme.body(size: 12.5, color: theme.faint)),
        ],
      ),
    );
  }
}

// ───────────────────────────── Principles ─────────────────────────────

class _PrinciplesSection extends StatelessWidget {
  const _PrinciplesSection();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      color: theme.colorScheme.surface.withValues(alpha: 0.5),
      child: ContentWidth(
        top: 88,
        bottom: 88,
        child: Column(
          children: [
            const SectionHeader(
              eyebrow: 'Principles',
              title: [('How I ', false), ('build', true)],
              subtitle: 'Four habits that show up in every app I ship.',
              centered: true,
            ),
            const SizedBox(height: 44),
            ResponsiveGrid(
              columnsFor: (w) => w > 1000 ? 4 : (w > 560 ? 2 : 1),
              children: [
                for (var i = 0; i < PortfolioData.principles.length; i++)
                  _PrincipleCard(index: i, principle: PortfolioData.principles[i]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _PrincipleCard extends StatelessWidget {
  const _PrincipleCard({required this.index, required this.principle});

  final int index;
  final Principle principle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return HoverCard(
      padding: const EdgeInsets.all(22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(color: theme.tint, shape: BoxShape.circle),
            child: Icon(principle.icon, size: 20, color: theme.colorScheme.primary),
          ),
          const SizedBox(height: 18),
          Text('0${index + 1} · PRINCIPLE', style: theme.caps()),
          const SizedBox(height: 6),
          Text(principle.title, style: theme.serif(21)),
          const SizedBox(height: 8),
          Text(principle.description, style: theme.body(size: 14.5)),
        ],
      ),
    );
  }
}

// ───────────────────────────── Experience ─────────────────────────────

class _ExperienceSection extends StatelessWidget {
  const _ExperienceSection();

  @override
  Widget build(BuildContext context) {
    return ContentWidth(
      top: 96,
      bottom: 48,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(
            eyebrow: 'Experience',
            title: [('Career ', false), ('journey', true)],
            subtitle: 'Shipping mobile products in product teams, as a consultant, and solo.',
          ),
          const SizedBox(height: 40),
          for (var i = 0; i < PortfolioData.jobs.length; i++) ...[
            if (i > 0) const SizedBox(height: 16),
            _JobCard(job: PortfolioData.jobs[i]),
          ],
        ],
      ),
    );
  }
}

class _JobCard extends StatelessWidget {
  const _JobCard({required this.job});
  final Job job;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return HoverCard(
      padding: const EdgeInsets.all(28),
      child: LayoutBuilder(builder: (context, constraints) {
        final wide = constraints.maxWidth > 700;
        final meta = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(job.period,
                style: theme.body(size: 14, weight: FontWeight.w700, color: theme.colorScheme.primary)),
            Text(job.location, style: theme.body(size: 13, color: theme.faint)),
          ],
        );
        final details = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(job.role, style: theme.serif(24)),
            const SizedBox(height: 2),
            Text(job.company,
                style: theme.body(size: 15.5, weight: FontWeight.w600, color: theme.colorScheme.onSurface)),
            const SizedBox(height: 14),
            for (final point in job.points)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary.withValues(alpha: 0.8),
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(child: Text(point, style: theme.body(size: 15))),
                  ],
                ),
              ),
          ],
        );
        if (!wide) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [meta, const SizedBox(height: 14), details],
          );
        }
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(width: 190, child: meta),
            const SizedBox(width: 24),
            Expanded(child: details),
          ],
        );
      }),
    );
  }
}

// ───────────────────────────── About ─────────────────────────────

class _AboutSection extends StatelessWidget {
  const _AboutSection();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final intro = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(
          eyebrow: 'About',
          title: [('Engineering with ', false), ('care', true)],
        ),
        const SizedBox(height: 20),
        for (final p in PortfolioData.about) ...[
          Text(p, style: theme.body(size: 17)),
          const SizedBox(height: 14),
        ],
        const SizedBox(height: 10),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            PillButton(
              label: 'LinkedIn',
              icon: FontAwesomeIcons.linkedinIn,
              filled: false,
              onPressed: () => openLink(PortfolioData.linkedinUrl),
            ),
            PillButton(
              label: 'GitHub',
              icon: FontAwesomeIcons.github,
              filled: false,
              onPressed: () => openLink(PortfolioData.githubUrl),
            ),
          ],
        ),
      ],
    );

    final side = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Education', style: theme.serif(26)),
        const SizedBox(height: 16),
        for (final d in PortfolioData.degrees) ...[
          HoverCard(
            padding: const EdgeInsets.all(20),
            radius: 20,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: theme.tint,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(Icons.school_outlined, size: 22, color: theme.colorScheme.primary),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(d.title, style: theme.serif(19)),
                      const SizedBox(height: 4),
                      Text(d.school,
                          style: theme.body(size: 14.5, weight: FontWeight.w600, color: theme.colorScheme.primary)),
                      Text('${d.location} · ${d.period}', style: theme.body(size: 13, color: theme.faint)),
                      const SizedBox(height: 10),
                      TagChip(d.note),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
        ],
        const SizedBox(height: 24),
        Text('Toolkit', style: theme.serif(26)),
        const SizedBox(height: 16),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            for (final s in PortfolioData.skills)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                decoration: BoxDecoration(
                  color: theme.colorScheme.surface,
                  borderRadius: BorderRadius.circular(999),
                  border: Border.all(color: theme.hairline),
                ),
                child: Text(s,
                    style: theme.body(size: 13.5, weight: FontWeight.w600, color: theme.colorScheme.onSurface)
                        .copyWith(height: 1.3)),
              ),
          ],
        ),
      ],
    );

    return ContentWidth(
      top: 96,
      bottom: 48,
      child: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth < 900) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [intro, const SizedBox(height: 48), side],
          );
        }
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(flex: 5, child: intro),
            const SizedBox(width: 64),
            Expanded(flex: 6, child: side),
          ],
        );
      }),
    );
  }
}

// ───────────────────────────── Contact ─────────────────────────────

class _ContactSection extends StatelessWidget {
  const _ContactSection();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final narrow = isNarrow(context);
    final footerStyle = theme.body(size: 13, color: theme.faint);

    return ContentWidth(
      top: 96,
      bottom: 32,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: narrow ? 24 : 56, vertical: narrow ? 40 : 64),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              border: Border.all(color: cs.primary.withValues(alpha: 0.25)),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  cs.primary.withValues(alpha: 0.16),
                  cs.secondary.withValues(alpha: 0.14),
                ],
              ),
            ),
            child: Column(
              children: [
                const Eyebrow('Contact'),
                const SizedBox(height: 20),
                AccentTitle(
                  const [
                    ("Let's build something ", false),
                    ('remarkable', true),
                    (' together.', false),
                  ],
                  style: theme.serif(narrow ? 34 : 52).copyWith(height: 1.1),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 560),
                  child: Text(PortfolioData.contactText,
                      style: theme.body(size: 17), textAlign: TextAlign.center),
                ),
                const SizedBox(height: 28),
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    PillButton(
                      label: 'Email me',
                      icon: Icons.mail_outline_rounded,
                      onPressed: () => openLink(
                          "mailto:${PortfolioData.email}?subject=Let's%20work%20together"),
                    ),
                    PillButton(
                      label: 'LinkedIn',
                      icon: FontAwesomeIcons.linkedinIn,
                      filled: false,
                      onPressed: () => openLink(PortfolioData.linkedinUrl),
                    ),
                    PillButton(
                      label: 'GitHub',
                      icon: FontAwesomeIcons.github,
                      filled: false,
                      onPressed: () => openLink(PortfolioData.githubUrl),
                    ),
                  ],
                ),
                const SizedBox(height: 18),
                SelectableText(PortfolioData.email, style: theme.body(size: 14, color: theme.faint)),
              ],
            ),
          ),
          const SizedBox(height: 40),
          if (narrow)
            Column(
              children: [
                Text('© ${DateTime.now().year} ${PortfolioData.name}', style: footerStyle),
                Text('Designed and built with Flutter', style: footerStyle),
              ],
            )
          else
            Row(
              children: [
                Text('© ${DateTime.now().year} ${PortfolioData.name}', style: footerStyle),
                const Spacer(),
                Text('Designed and built with Flutter', style: footerStyle),
              ],
            ),
        ],
      ),
    );
  }
}
