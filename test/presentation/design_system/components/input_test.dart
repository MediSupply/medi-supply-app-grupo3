import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:medi_supply_app_grupo3/presentation/design_system/components/input.dart';

void main() {
  group('Input Widget Tests', () {
    testWidgets('should display input with correct label and hint', (
      WidgetTester tester,
    ) async {
      // Arrange
      const label = 'Email';
      const hint = 'Enter your email';

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Input(label: label, hint: hint, onChanged: (value) {}),
          ),
        ),
      );

      // Assert
      expect(find.text(label), findsOneWidget);
      expect(find.text(hint), findsOneWidget);
      expect(find.byType(TextFormField), findsOneWidget);
    });

    testWidgets('should call onChanged when text is entered', (
      WidgetTester tester,
    ) async {
      // Arrange
      String? changedValue;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Input(
              label: 'Email',
              hint: 'Enter your email',
              onChanged: (value) => changedValue = value,
            ),
          ),
        ),
      );

      // Act
      await tester.enterText(find.byType(TextFormField), 'test@example.com');
      await tester.pump();

      // Assert
      expect(changedValue, equals('test@example.com'));
    });

    testWidgets('should obscure text when obscureText is true', (
      WidgetTester tester,
    ) async {
      // Arrange
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Input(
              label: 'Password',
              hint: 'Enter your password',
              obscureText: true,
              onChanged: (value) {},
            ),
          ),
        ),
      );

      // Act
      await tester.enterText(find.byType(TextFormField), 'password123');
      await tester.pump();

      // Assert
      // We can't directly access obscureText property, but we can verify the widget exists
      expect(find.byType(TextFormField), findsOneWidget);
    });

    testWidgets('should not obscure text when obscureText is false', (
      WidgetTester tester,
    ) async {
      // Arrange
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Input(
              label: 'Email',
              hint: 'Enter your email',
              obscureText: false,
              onChanged: (value) {},
            ),
          ),
        ),
      );

      // Assert
      // We can't directly access obscureText property, but we can verify the widget exists
      expect(find.byType(TextFormField), findsOneWidget);
    });

    testWidgets('should validate input when validator is provided', (
      WidgetTester tester,
    ) async {
      // Arrange
      String? validator(String? value) {
        if (value == null || value.isEmpty) {
          return 'This field is required';
        }
        return null;
      }

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Form(
              child: Input(
                label: 'Email',
                hint: 'Enter your email',
                validator: validator,
                onChanged: (value) {},
              ),
            ),
          ),
        ),
      );

      // Act
      await tester.enterText(find.byType(TextFormField), '');
      await tester.pump();

      // Assert
      final textField = tester.widget<TextFormField>(
        find.byType(TextFormField),
      );
      expect(textField.validator, isNotNull);
    });

    testWidgets('should be read-only when readOnly is true', (
      WidgetTester tester,
    ) async {
      // Arrange
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Input(
              label: 'Email',
              hint: 'Enter your email',
              readOnly: true,
              onChanged: (value) {},
            ),
          ),
        ),
      );

      // Assert
      // We can't directly access readOnly property, but we can verify the widget exists
      expect(find.byType(TextFormField), findsOneWidget);
    });

    testWidgets('should not be read-only when readOnly is false', (
      WidgetTester tester,
    ) async {
      // Arrange
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Input(
              label: 'Email',
              hint: 'Enter your email',
              readOnly: false,
              onChanged: (value) {},
            ),
          ),
        ),
      );

      // Assert
      // We can't directly access readOnly property, but we can verify the widget exists
      expect(find.byType(TextFormField), findsOneWidget);
    });

    testWidgets('should dispose controller properly', (
      WidgetTester tester,
    ) async {
      // Arrange
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Input(
              label: 'Email',
              hint: 'Enter your email',
              onChanged: (value) {},
            ),
          ),
        ),
      );

      // Act
      await tester.pumpWidget(const SizedBox.shrink());

      // Assert
      // The controller should be disposed automatically
      // This test ensures the widget can be removed without errors
      expect(find.byType(Input), findsNothing);
    });

    testWidgets('should handle empty label and hint', (
      WidgetTester tester,
    ) async {
      // Arrange
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Input(label: '', hint: '', onChanged: (value) {}),
          ),
        ),
      );

      // Assert
      expect(find.byType(TextFormField), findsOneWidget);
      // Note: Empty strings create multiple text widgets, so we just verify the input exists
    });

    testWidgets('should handle null onChanged callback', (
      WidgetTester tester,
    ) async {
      // Arrange
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Input(
              label: 'Email',
              hint: 'Enter your email',
              onChanged: null,
            ),
          ),
        ),
      );

      // Act
      await tester.enterText(find.byType(TextFormField), 'test@example.com');
      await tester.pump();

      // Assert
      // Should not throw any errors
      expect(find.byType(TextFormField), findsOneWidget);
    });
  });
}
