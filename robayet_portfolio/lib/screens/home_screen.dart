import 'package:flutter/material.dart';
import '../data/portfolio_data.dart';
import '../widgets/about_section.dart';
import '../widgets/certificates_section.dart';
import '../widgets/contact_section.dart';
import '../widgets/development_process_section.dart';
import '../widgets/footer.dart';
import '../widgets/hero_section.dart';
import '../widgets/navbar.dart';
import '../widgets/projects_section.dart';
import '../widgets/section_wrapper.dart';
import '../widgets/skills_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Process has no nav link; Education points to the history inside About.
  static const _navSectionIndexes = [0, 1, 2, 4, 5, 6];
  final _keys = List.generate(navItems.length, (_) => GlobalKey());
  final _educationKey = GlobalKey();
  final _scrollController = ScrollController();

  void _scrollTo(int navIndex) {
    if (navIndex < 0 || navIndex >= navItems.length) return;
    final ctx = navIndex == 4
        ? _educationKey.currentContext
        : _keys[_navSectionIndexes[navIndex > 4 ? navIndex - 1 : navIndex]]
            .currentContext;
    if (ctx == null) return;
    Scrollable.ensureVisible(ctx,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOutCubic);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sections = <Widget>[
      HeroSection(
          onProjects: () => _scrollTo(3), onContact: () => _scrollTo(6)),
      AboutSection(
        onContact: () => _scrollTo(6),
        educationKey: _educationKey,
      ),
      const SkillsSection(),
      const DevelopmentProcessSection(),
      const ProjectsSection(),
      const CertificatesSection(),
      const ContactSection(),
    ];
    return Scaffold(
      appBar: Navbar(onSelect: _scrollTo),
      endDrawer: NavDrawer(onSelect: _scrollTo),
      body: ScrollRevealScope(
        controller: _scrollController,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(children: [
            for (var i = 0; i < sections.length; i++)
              KeyedSubtree(key: _keys[i], child: sections[i]),
            Footer(onSelect: _scrollTo),
          ]),
        ),
      ),
    );
  }
}
