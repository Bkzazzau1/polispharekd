import 'package:flutter/material.dart';
import 'campaign_identity.dart';
import 'widgets.dart';

class KadunaWelcomePage extends StatelessWidget {
  const KadunaWelcomePage({super.key, required this.onEnter});
  final VoidCallback onEnter;

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: kdBg,
        body: SafeArea(
          child: LayoutBuilder(builder: (context, c) {
            final compact = c.maxWidth < 900;
            final hero = Container(
              padding: EdgeInsets.all(compact ? 26 : 42),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF061922), Color(0xFF0B4536), Color(0xFF145AA3)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      _WhitePill('KADUNA STATE'),
                      _WhitePill('GOVERNOR COMMAND'),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Text(
                    KadunaIdentity.productName,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: compact ? 34 : 49,
                      height: .95,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    KadunaIdentity.commandTitle,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 21,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Statewide command, citizen engagement, governance delivery, field coordination and election readiness in one secure workspace.',
                    style: TextStyle(
                      color: Colors.white70,
                      height: 1.5,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 30),
                  FilledButton.icon(
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: kdDark,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 22,
                        vertical: 16,
                      ),
                    ),
                    onPressed: onEnter,
                    icon: const Icon(Icons.arrow_forward_rounded),
                    label: const Text(
                      'Enter Command Centre',
                      style: TextStyle(fontWeight: FontWeight.w900),
                    ),
                  ),
                ],
              ),
            );

            final principal = Container(
              color: Colors.white,
              padding: EdgeInsets.all(compact ? 26 : 44),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: compact ? 150 : 205,
                    height: compact ? 180 : 245,
                    decoration: BoxDecoration(
                      color: const Color(0xFFEAF2ED),
                      borderRadius: BorderRadius.circular(28),
                      border: Border.all(color: const Color(0xFFD2E2D8)),
                    ),
                    child: const Icon(
                      Icons.account_circle_rounded,
                      size: 100,
                      color: kdGreen,
                    ),
                  ),
                  const SizedBox(height: 18),
                  const Text(
                    KadunaIdentity.principalName,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                      color: kdInk,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    KadunaIdentity.principalTitle,
                    style: TextStyle(
                      color: kdGreen,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            );

            return compact
                ? Column(
                    children: [
                      Expanded(child: hero),
                      SizedBox(height: 310, child: principal),
                    ],
                  )
                : Row(
                    children: [
                      Expanded(flex: 12, child: hero),
                      Expanded(flex: 8, child: principal),
                    ],
                  );
          }),
        ),
      );
}

class _WhitePill extends StatelessWidget {
  const _WhitePill(this.text);
  final String text;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: .10),
          borderRadius: BorderRadius.circular(999),
          border: Border.all(color: Colors.white24),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 10,
            fontWeight: FontWeight.w900,
            letterSpacing: .6,
          ),
        ),
      );
}
