import 'package:flutter/material.dart';
import 'command_overview.dart';
import 'role_login.dart';
import 'session.dart';
import 'welcome_page.dart';
import 'widgets.dart';

class PoliSphereKadunaApp extends StatefulWidget {
  const PoliSphereKadunaApp({super.key});

  @override
  State<PoliSphereKadunaApp> createState() => _PoliSphereKadunaAppState();
}

class _PoliSphereKadunaAppState extends State<PoliSphereKadunaApp> {
  int step = 0;
  KadunaRole? role;

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'PoliSphere Kaduna',
        theme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: kdBg,
          colorScheme: ColorScheme.fromSeed(
            seedColor: kdGreen,
            brightness: Brightness.light,
          ),
          filledButtonTheme: FilledButtonThemeData(
            style: FilledButton.styleFrom(
              backgroundColor: kdGreen,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(
                horizontal: 18,
                vertical: 15,
              ),
            ),
          ),
        ),
        home: switch (step) {
          0 => KadunaWelcomePage(onEnter: () => setState(() => step = 1)),
          1 => KadunaRoleLogin(
              onLogin: (selected) => setState(() {
                role = selected;
                step = 2;
              }),
            ),
          _ => Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                title: const Text(
                  'POLISPHERE KADUNA',
                  style: TextStyle(fontWeight: FontWeight.w900),
                ),
                actions: [
                  TextButton.icon(
                    onPressed: () => setState(() {
                      role = null;
                      step = 1;
                    }),
                    icon: const Icon(Icons.logout_rounded),
                    label: const Text('Logout'),
                  ),
                  const SizedBox(width: 10),
                ],
              ),
              body: KadunaCommandOverview(
                role: role ?? KadunaRole.executiveViewer,
              ),
            ),
        },
      );
}
