import 'package:flutter/material.dart';

const kdDark = Color(0xFF071B22);
const kdGreen = Color(0xFF0A7A47);
const kdBlue = Color(0xFF145AA3);
const kdRed = Color(0xFFC93A3A);
const kdInk = Color(0xFF17211B);
const kdMuted = Color(0xFF6B746D);
const kdBg = Color(0xFFF3F6F4);

class KdPill extends StatelessWidget {
  const KdPill(this.text, {super.key, this.color = kdGreen});
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
        decoration: BoxDecoration(
          color: color.withValues(alpha: .10),
          borderRadius: BorderRadius.circular(999),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: color,
            fontSize: 10,
            fontWeight: FontWeight.w900,
            letterSpacing: .4,
          ),
        ),
      );
}

class KdCard extends StatelessWidget {
  const KdCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(18),
  });

  final Widget child;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) => Container(
        padding: padding,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xFFE2E9E4)),
          boxShadow: const [
            BoxShadow(
              color: Color(0x0B0B2B18),
              blurRadius: 20,
              offset: Offset(0, 8),
            ),
          ],
        ),
        child: child,
      );
}

class KdMetric extends StatelessWidget {
  const KdMetric({
    super.key,
    required this.label,
    required this.value,
    required this.icon,
    this.color = kdGreen,
  });

  final String label;
  final String value;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) => KdCard(
        child: Row(
          children: [
            Container(
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                color: color.withValues(alpha: .10),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(icon, color: color),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    value,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                      color: kdInk,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    label,
                    style: const TextStyle(
                      color: kdMuted,
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
