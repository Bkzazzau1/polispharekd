import 'package:flutter/material.dart';
import 'campaign_identity.dart';
import 'geography.dart';
import 'session.dart';
import 'widgets.dart';

class KadunaCommandOverview extends StatelessWidget {
  const KadunaCommandOverview({super.key, required this.role});
  final KadunaRole role;

  static const priorities = <(String, IconData)>[
    ('Safety & Security', Icons.security_rounded),
    ('Strengthen Institutions', Icons.account_balance_outlined),
    ('Trade & Investment', Icons.business_center_outlined),
    ('Infrastructure', Icons.route_outlined),
    ('Human Capital', Icons.school_outlined),
    ('Citizen Engagement', Icons.forum_outlined),
    ('Agriculture', Icons.agriculture_outlined),
  ];

  @override
  Widget build(BuildContext context) => ColoredBox(
        color: kdBg,
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            _Hero(role: role),
            const SizedBox(height: 16),
            LayoutBuilder(builder: (context, c) {
              final cols = c.maxWidth >= 1000 ? 5 : c.maxWidth >= 650 ? 2 : 1;
              const gap = 12.0;
              final w = (c.maxWidth - gap * (cols - 1)) / cols;
              const cards = [
                KdMetric(label: 'LGAs', value: '23', icon: Icons.map_outlined),
                KdMetric(
                  label: 'Wards / RAs',
                  value: '255',
                  icon: Icons.grid_view_rounded,
                  color: kdBlue,
                ),
                KdMetric(
                  label: 'Polling Units',
                  value: '8,012',
                  icon: Icons.how_to_vote_outlined,
                  color: kdRed,
                ),
                KdMetric(
                  label: 'Registered Voters',
                  value: '4.34M',
                  icon: Icons.groups_2_outlined,
                  color: Color(0xFF7A4BB7),
                ),
                KdMetric(
                  label: 'PVCs Collected',
                  value: '4.16M',
                  icon: Icons.badge_outlined,
                  color: Color(0xFFD57A13),
                ),
              ];
              return Wrap(
                spacing: gap,
                runSpacing: gap,
                children: cards
                    .map((e) => SizedBox(width: w, child: e))
                    .toList(),
              );
            }),
            const SizedBox(height: 16),
            KdCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Kaduna strategic priorities',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: kdInk,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Governor command view across the administration’s seven public governance pillars.',
                    style: TextStyle(color: kdMuted),
                  ),
                  const SizedBox(height: 16),
                  LayoutBuilder(builder: (context, c) {
                    final cols = c.maxWidth >= 950 ? 4 : c.maxWidth >= 560 ? 2 : 1;
                    const gap = 10.0;
                    final w = (c.maxWidth - gap * (cols - 1)) / cols;
                    return Wrap(
                      spacing: gap,
                      runSpacing: gap,
                      children: priorities
                          .map(
                            (p) => SizedBox(
                              width: w,
                              child: _Priority(title: p.$1, icon: p.$2),
                            ),
                          )
                          .toList(),
                    );
                  }),
                ],
              ),
            ),
            const SizedBox(height: 16),
            LayoutBuilder(builder: (context, c) {
              final wide = c.maxWidth >= 900;
              const left = KdCard(
                child: _Panel(
                  title: 'Statewide command',
                  lines: [
                    '23-LGA coordination and reporting',
                    'Governor movement and stakeholder engagements',
                    'Situation Room incidents and response',
                    'Governance delivery and project tracking',
                    'Public issues and citizen engagement',
                  ],
                ),
              );
              const right = KdCard(
                child: _Panel(
                  title: 'PoliSphere workspaces',
                  lines: [
                    'Discussion Forum',
                    'Meeting Room',
                    'Media & Public Intelligence',
                    'Election Intelligence',
                    'Reports & Administration',
                  ],
                ),
              );
              return wide
                  ? const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: left),
                        SizedBox(width: 14),
                        Expanded(child: right),
                      ],
                    )
                  : const Column(
                      children: [
                        left,
                        SizedBox(height: 14),
                        right,
                      ],
                    );
            }),
          ],
        ),
      );
}

class _Hero extends StatelessWidget {
  const _Hero({required this.role});
  final KadunaRole role;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(26),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          gradient: const LinearGradient(
            colors: [Color(0xFF061922), Color(0xFF0A533B), Color(0xFF145AA3)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: const [
            BoxShadow(
              color: Color(0x22071B22),
              blurRadius: 30,
              offset: Offset(0, 13),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      const _HeroPill('KADUNA STATE'),
                      _HeroPill(role.label.toUpperCase()),
                    ],
                  ),
                  const SizedBox(height: 18),
                  const Text(
                    KadunaIdentity.commandTitle,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 34,
                      height: 1,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Statewide governance, field coordination, public engagement and campaign readiness.',
                    style: TextStyle(
                      color: Colors.white70,
                      height: 1.45,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 18),
            const CircleAvatar(
              radius: 44,
              backgroundColor: Colors.white12,
              child: Text(
                'US',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ],
        ),
      );
}

class _HeroPill extends StatelessWidget {
  const _HeroPill(this.text);
  final String text;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
        decoration: BoxDecoration(
          color: Colors.white10,
          borderRadius: BorderRadius.circular(999),
          border: Border.all(color: Colors.white24),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 9.5,
            fontWeight: FontWeight.w900,
            letterSpacing: .5,
          ),
        ),
      );
}

class _Priority extends StatelessWidget {
  const _Priority({required this.title, required this.icon});
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: const Color(0xFFF7FAF8),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFE4EBE6)),
        ),
        child: Row(
          children: [
            Icon(icon, color: kdGreen),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  color: kdInk,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ],
        ),
      );
}

class _Panel extends StatelessWidget {
  const _Panel({required this.title, required this.lines});
  final String title;
  final List<String> lines;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: kdInk,
              fontSize: 19,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 12),
          ...lines.map(
            (line) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                children: [
                  const Icon(
                    Icons.check_circle_outline_rounded,
                    color: kdGreen,
                    size: 19,
                  ),
                  const SizedBox(width: 9),
                  Expanded(
                    child: Text(
                      line,
                      style: const TextStyle(
                        color: kdInk,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
}
