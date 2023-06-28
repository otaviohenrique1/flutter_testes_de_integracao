import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_testes_de_integracao/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("Integration Test", (tester) async {
    app.main();
    await tester.pumpAndSettle(); // Pedir para esperar

    // Testando tela inicial
    expect(find.text('Clientes'), findsOneWidget);
    expect(find.byIcon(Icons.menu), findsOneWidget);
    expect(find.byType(FloatingActionButton), findsOneWidget);

    // Testando Drawer
    await tester.tap(find.byIcon(Icons.menu));
    await tester.pumpAndSettle(); // Pedir para esperar

    expect(find.text('Menu'), findsOneWidget);
    expect(find.text('Gerenciar clientes'), findsOneWidget);
    expect(find.text('Tipos de clientes'), findsOneWidget);
    expect(find.text('Sair'), findsOneWidget);

    // Testando a Navegação e a Tela de Tipos
    await tester.tap(find.text('Tipos de clientes'));
    await tester.pumpAndSettle(); // Pedir para esperar

    expect(find.text('Tipos de cliente'), findsOneWidget);
    expect(find.byType(FloatingActionButton), findsOneWidget);
    expect(find.byIcon(Icons.menu), findsOneWidget);
    expect(find.text('Platinum'), findsOneWidget);
    expect(find.text('Golden'), findsOneWidget);
    expect(find.text('Titanium'), findsOneWidget);
    expect(find.text('Diamond'), findsOneWidget);

    // Testando a criação de um Tipo de Cliente
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle(); // Pedir para esperar
    expect(find.byType(AlertDialog), findsOneWidget);
    await tester.enterText(find.byType(TextFormField), "Ferro");

    await tester.tap(find.text('Selecionar icone'));
    await tester.pumpAndSettle(); // Pedir para esperar

    await tester.tap(find.byIcon(Icons.card_giftcard));
    await tester.pumpAndSettle(); // Pedir para esperar

    await tester.tap(find.text('Salvar'));
    await tester.pumpAndSettle(); // Pedir para esperar

    expect(find.text('Ferro'), findsOneWidget);
    expect(find.byIcon(Icons.card_giftcard), findsOneWidget);
  });

  /*
    testWidgets("Integration Test", (tester) async {
      app.main();
      await tester.pumpAndSettle();
      expect(find.text('Menu'), findsNothing);
      await tester.tap(find.byIcon(Icons.menu));
      await tester.pumpAndSettle();
      expect(find.text('Menu'), findsOneWidget);
    });
  */
}
