part of '../hero_section.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onProjects;
  final VoidCallback onContact;
  const HeroSection(
      {super.key, required this.onProjects, required this.onContact});

  @override
  Widget build(BuildContext context) {
    return SectionReveal(
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(-0.8, 0.1),
            radius: 1.55,
            colors: [Color(0xFF241034), Color(0xFF100A20), AppColors.bg],
            stops: [0, 0.52, 1],
          ),
        ),
        padding: const EdgeInsets.only(bottom: 28),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1528),
            child: LayoutBuilder(builder: (context, constraints) {
              final wide = constraints.maxWidth >= 1080;
              final text = _HeroText(
                  onProjects: onProjects, onContact: onContact, wide: wide);
              return Padding(
                padding: EdgeInsets.fromLTRB(
                  constraints.maxWidth < 600 ? 22 : 36,
                  wide ? 82 : 48,
                  constraints.maxWidth < 600 ? 22 : 36,
                  wide ? 88 : 64,
                ),
                child: wide
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(flex: 6, child: text),
                          const SizedBox(width: 56),
                          const Expanded(
                              flex: 5,
                              child: _FloatingPanel(child: ProfileConsole())),
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          text,
                          const SizedBox(height: 44),
                          const _FloatingPanel(child: ProfileConsole()),
                        ],
                      ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
