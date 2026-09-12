import 'package:flutter/material.dart';
import 'campaign_identity.dart';
import 'session.dart';
import 'widgets.dart';

class KadunaRoleLogin extends StatefulWidget {
  const KadunaRoleLogin({super.key, required this.onLogin});
  final ValueChanged<KadunaRole> onLogin;

  @override
  State<KadunaRoleLogin> createState() => _KadunaRoleLoginState();
}

class _KadunaRoleLoginState extends State<KadunaRoleLogin> {
  KadunaRole role = KadunaRole.governor;

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: kdBg,
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 920),
                child: KdCard(
                  padding: EdgeInsets.zero,
                  child: LayoutBuilder(builder: (context, c) {
                    final compact = c.maxWidth < 760;
                    final brand = Container(
                      padding: const EdgeInsets.all(28),
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFF071B22), Color(0xFF0A6B45)],
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                        ),
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          KdPill('POLISPHERE KADUNA', color: Colors.white),
                          SizedBox(height: 18),
                          Text(
                            KadunaIdentity.principalName,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            KadunaIdentity.principalTitle,
                            style: TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    );

                    final form = Padding(
                      padding: const EdgeInsets.all(28),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            'Choose your command role',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w900,
                              color: kdInk,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Your role determines the command view, modules and geographic responsibilities available to you.',
                            style: TextStyle(color: kdMuted, height: 1.4),
                          ),
                          const SizedBox(height: 22),
                          DropdownButtonFormField<KadunaRole>(
                            initialValue: role,
                            decoration: const InputDecoration(
                              labelText: 'Role',
                              border: OutlineInputBorder(),
                            ),
                            items: KadunaRole.values
                                .map(
                                  (r) => DropdownMenuItem(
                                    value: r,
                                    child: Text(r.label),
                                  ),
                                )
                                .toList(),
                            onChanged: (v) {
                              if (v != null) setState(() => role = v);
                            },
                          ),
                          const SizedBox(height: 16),
                          const TextField(
                            decoration: InputDecoration(
                              labelText: 'Access ID / phone',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 14),
                          const TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 22),
                          SizedBox(
                            width: double.infinity,
                            child: FilledButton(
                              onPressed: () => widget.onLogin(role),
                              child: Text(
                                'Enter as ${role.label}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );

                    return compact
                        ? Column(
                            children: [
                              SizedBox(height: 220, child: brand),
                              form,
                            ],
                          )
                        : Row(
                            children: [
                              Expanded(flex: 4, child: brand),
                              Expanded(flex: 6, child: form),
                            ],
                          );
                  }),
                ),
              ),
            ),
          ),
        ),
      );
}
