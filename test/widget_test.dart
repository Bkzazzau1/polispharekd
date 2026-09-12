import 'package:flutter_test/flutter_test.dart';
import 'package:polisphere_kaduna/kaduna/kaduna_app.dart';

void main() {
  testWidgets('opens Kaduna command flow', (tester) async {
    await tester.pumpWidget(const PoliSphereKadunaApp());
    await tester.pumpAndSettle();

    expect(find.text('POLISPHERE KADUNA'), findsWidgets);
    expect(find.text('Governor Uba Sani Command Centre'), findsOneWidget);

    await tester.tap(find.text('Enter Command Centre'));
    await tester.pumpAndSettle();

    expect(find.text('Choose your command role'), findsOneWidget);
    expect(find.text('Governor / Principal'), findsWidgets);

    await tester.tap(find.text('Enter as Governor / Principal'));
    await tester.pumpAndSettle();

    expect(find.text('Kaduna strategic priorities'), findsOneWidget);
    expect(find.text('Safety & Security'), findsOneWidget);
    expect(find.text('23-LGA coordination and reporting'), findsOneWidget);
  });
}
