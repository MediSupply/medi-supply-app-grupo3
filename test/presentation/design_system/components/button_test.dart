import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:medi_supply_app_grupo3/presentation/design_system/components/button.dart';

void main() {
  group('Button Widget Tests', () {
    testWidgets('should display button with correct label', (
      WidgetTester tester,
    ) async {
      // Arrange
      const buttonLabel = 'Test Button';
      bool onPressedCalled = false;

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Button(
              label: buttonLabel,
              onPressed: () => onPressedCalled = !onPressedCalled,
            ),
          ),
        ),
      );

      // Assert
      expect(find.text(buttonLabel), findsOneWidget);
      expect(find.byType(ElevatedButton), findsOneWidget);
    });

    testWidgets('should call onPressed when tapped', (
      WidgetTester tester,
    ) async {
      // Arrange
      bool onPressedCalled = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Button(
              label: 'Test Button',
              onPressed: () => onPressedCalled = true,
            ),
          ),
        ),
      );

      // Act
      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();

      // Assert
      expect(onPressedCalled, isTrue);
    });

    testWidgets('should show loading indicator when isLoading is true', (
      WidgetTester tester,
    ) async {
      // Arrange
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Button(
              label: 'Test Button',
              onPressed: () {},
              isLoading: true,
            ),
          ),
        ),
      );

      // Assert
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.text('Test Button'), findsOneWidget);
    });

    testWidgets('should not show loading indicator when isLoading is false', (
      WidgetTester tester,
    ) async {
      // Arrange
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Button(
              label: 'Test Button',
              onPressed: () {},
              isLoading: false,
            ),
          ),
        ),
      );

      // Assert
      expect(find.byType(CircularProgressIndicator), findsNothing);
      expect(find.text('Test Button'), findsOneWidget);
    });

    testWidgets('should disable button when isLoading is true', (
      WidgetTester tester,
    ) async {
      // Arrange
      bool onPressedCalled = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Button(
              label: 'Test Button',
              onPressed: () => onPressedCalled = true,
              isLoading: true,
            ),
          ),
        ),
      );

      // Act
      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();

      // Assert
      expect(onPressedCalled, isFalse);
    });

    testWidgets('should have correct styling', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Button(label: 'Test Button', onPressed: () {}),
          ),
        ),
      );

      // Assert
      final elevatedButton = tester.widget<ElevatedButton>(
        find.byType(ElevatedButton),
      );
      expect(elevatedButton, isNotNull);

      // Check if the button has the expected structure
      expect(find.byType(Row), findsOneWidget);
      expect(find.text('Test Button'), findsOneWidget);
    });

    testWidgets('should handle empty label', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Button(label: '', onPressed: () {}),
          ),
        ),
      );

      // Assert
      expect(find.byType(ElevatedButton), findsOneWidget);
      expect(find.text(''), findsOneWidget);
    });
  });
}
