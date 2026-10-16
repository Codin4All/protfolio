import 'package:flutter/material.dart';
import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import 'gradient_button.dart';
import 'profile_console.dart';
import 'section_wrapper.dart';
import 'social_links.dart';

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

class _FloatingPanel extends StatefulWidget {
  final Widget child;
  const _FloatingPanel({required this.child});

  @override
  State<_FloatingPanel> createState() => _FloatingPanelState();
}

class _FloatingPanelState extends State<_FloatingPanel>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _offset;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3400),
    )..repeat(reverse: true);
    _offset = Tween<double>(begin: -5, end: 5).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutSine),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
        animation: _offset,
        child: widget.child,
        builder: (context, child) => Transform.translate(
          offset: Offset(0, _offset.value),
          child: child,
        ),
      );
}

class _HeroText extends StatelessWidget {
  final VoidCallback onProjects;
  final VoidCallback onContact;
  final bool wide;

  const _HeroText({
    required this.onProjects,
    required this.onContact,
    required this.wide,
  });

  @override
  Widget build(BuildContext context) {
    final titleSize = wide ? 64.0 : 44.0;
    final leadSize = wide ? 30.0 : 25.0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.035),
            borderRadius: BorderRadius.circular(40),
            border: Border.all(color: AppColors.border),
          ),
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 11,
            runSpacing: 8,
            children: [
              const Text('Hello there',
                  style: TextStyle(
                      color: AppColors.text,
                      fontWeight: FontWeight.w700,
                      fontSize: 13)),
              Container(
                  width: 4,
                  height: 4,
                  decoration: const BoxDecoration(
                      color: AppColors.muted, shape: BoxShape.circle)),
              const _StatusDot(),
              Text(
                availabilityBadge.toUpperCase(),
                style: const TextStyle(
                  color: AppColors.success,
                  fontSize: 11,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.5,
                ),
              ),
              const Icon(Icons.auto_awesome, size: 15, color: AppColors.violet),
            ],
          ),
        ),
        const SizedBox(height: 31),
        const Text(
          '<HELLO WORLD, I AM />',
          style: TextStyle(
            color: AppColors.accent,
            fontFamily: 'monospace',
            fontWeight: FontWeight.w800,
            fontSize: 14,
            letterSpacing: 1.5,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          ownerName,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: AppColors.text,
            fontSize: titleSize,
            fontWeight: FontWeight.w900,
            height: 1.06,
            letterSpacing: wide ? -2.3 : -1.3,
          ),
        ),
        const SizedBox(height: 20),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text('I build ',
                style: TextStyle(
                    color: AppColors.muted,
                    fontSize: leadSize,
                    fontWeight: FontWeight.w500)),
            _GradientText(
              'Flutter apps',
              style: TextStyle(
                fontSize: leadSize,
                fontWeight: FontWeight.w800,
                letterSpacing: -0.5,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          heroIntro,
          style: const TextStyle(
            color: AppColors.muted,
            fontSize: 16,
            height: 1.75,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          '$ownerSubtitle  •  ${aboutCards.firstWhere((item) => item[0] == 'Location')[1]}',
          style: const TextStyle(
            color: AppColors.muted,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 26),
        Wrap(spacing: 13, runSpacing: 12, children: [
          GradientButton(
            label: 'Explore Featured Work',
            icon: Icons.arrow_downward_rounded,
            onPressed: onProjects,
          ),
          OutlinedButton.icon(
            onPressed: onContact,
            icon: const Icon(Icons.rocket_launch_rounded, size: 17),
            label: const Text('Hire Me'),
            style: OutlinedButton.styleFrom(
              foregroundColor: AppColors.text,
              side: const BorderSide(color: AppColors.border),
              minimumSize: const Size(48, 54),
              padding: const EdgeInsets.symmetric(horizontal: 22),
              shape: const StadiumBorder(),
              textStyle: const TextStyle(fontWeight: FontWeight.w700),
            ),
          ),
        ]),
        const SizedBox(height: 27),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 13,
          runSpacing: 14,
          children: [
            const Text('NETWORK',
                style: TextStyle(
                    color: AppColors.muted,
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.7)),
            const SocialLinks(),
            Container(width: 1, height: 30, color: AppColors.border),
            for (final skill in const ['Flutter', 'Dart', 'Firebase'])
              _TechTag(skill),
          ],
        ),
      ],
    );
  }
}

class _GradientText extends StatelessWidget {
  final String text;
  final TextStyle style;

  const _GradientText(this.text, {required this.style});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => AppColors.accentGradient.createShader(bounds),
      child: Text(text, style: style.copyWith(color: Colors.white)),
    );
  }
}

class _TechTag extends StatelessWidget {
  final String label;
  const _TechTag(this.label);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.025),
        borderRadius: BorderRadius.circular(9),
        border: Border.all(color: AppColors.border),
      ),
      child: Text(label,
          style: const TextStyle(
              color: AppColors.muted,
              fontSize: 11,
              fontFamily: 'monospace',
              fontWeight: FontWeight.w600)),
    );
  }
}

class _StatusDot extends StatelessWidget {
  const _StatusDot();

  @override
  Widget build(BuildContext context) => Container(
        width: 8,
        height: 8,
        decoration: BoxDecoration(
          color: AppColors.success,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                color: AppColors.success.withValues(alpha: 0.5), blurRadius: 9),
          ],
        ),
      );
}
