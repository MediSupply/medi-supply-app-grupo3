import 'package:flutter_test/flutter_test.dart';
import 'package:medi_supply_app_grupo3/data/repository/entity/client/client.dart';
import 'package:medi_supply_app_grupo3/presentation/clients/view_model/state/register_client_state.dart';

void main() {
  group('RegisterClientState', () {
    test('should create RegisterClientState with default values', () {
      // Arrange & Act
      const state = RegisterClientState();

      // Assert
      expect(state.client, equals(const Client()));
      expect(state.isLoading, equals(false));
    });

    test('should create RegisterClientState with custom values', () {
      // Arrange
      const client = Client(
        nombre: 'John Doe',
        email: 'john@example.com',
        telefono: '+1234567890',
        direccion: '123 Main St',
        razonSocial: 'Empresa S.A.S.',
        nit: '1234567890',
      );

      // Act
      const state = RegisterClientState(client: client, isLoading: true);

      // Assert
      expect(state.client, equals(client));
      expect(state.isLoading, equals(true));
    });

    test('should create RegisterClientState with partial custom values', () {
      // Arrange
      const client = Client(nombre: 'John Doe');

      // Act
      const state = RegisterClientState(client: client);

      // Assert
      expect(state.client, equals(client));
      expect(state.isLoading, equals(false));
    });

    test('should copy with new client', () {
      // Arrange
      const originalState = RegisterClientState();
      const newClient = Client(nombre: 'Jane Doe');

      // Act
      final newState = originalState.copyWith(client: newClient);

      // Assert
      expect(newState.client, equals(newClient));
      expect(newState.isLoading, equals(originalState.isLoading));
    });

    test('should copy with new isLoading', () {
      // Arrange
      const originalState = RegisterClientState();

      // Act
      final newState = originalState.copyWith(isLoading: true);

      // Assert
      expect(newState.client, equals(originalState.client));
      expect(newState.isLoading, equals(true));
    });

    test('should copy with multiple changes', () {
      // Arrange
      const originalState = RegisterClientState();
      const newClient = Client(
        nombre: 'John Doe',
        email: 'john@example.com',
        telefono: '+1234567890',
        direccion: '123 Main St',
        razonSocial: 'Empresa S.A.S.',
        nit: '1234567890',
      );

      // Act
      final newState = originalState.copyWith(
        client: newClient,
        isLoading: true,
      );

      // Assert
      expect(newState.client, equals(newClient));
      expect(newState.isLoading, equals(true));
    });

    test('should copy with null values (no change)', () {
      // Arrange
      const originalState = RegisterClientState(
        client: Client(nombre: 'John Doe'),
        isLoading: true,
      );

      // Act
      final newState = originalState.copyWith();

      // Assert
      expect(newState.client, equals(originalState.client));
      expect(newState.isLoading, equals(originalState.isLoading));
    });

    test('should maintain immutability', () {
      // Arrange
      const originalState = RegisterClientState();
      const newClient = Client(nombre: 'John Doe');

      // Act
      final newState = originalState.copyWith(client: newClient);

      // Assert
      expect(originalState.client, equals(const Client()));
      expect(newState.client, equals(newClient));
      expect(originalState, isNot(same(newState)));
    });

    test('should handle empty client', () {
      // Arrange
      const client = Client();

      // Act
      const state = RegisterClientState(client: client);

      // Assert
      expect(state.client.nombre, equals(''));
      expect(state.client.email, equals(''));
      expect(state.client.telefono, equals(''));
      expect(state.client.direccion, equals(''));
      expect(state.client.razonSocial, equals(''));
      expect(state.client.nit, equals(''));
    });

    test('should handle client with all fields', () {
      // Arrange
      const client = Client(
        id: 'client-123',
        nombre: 'John Doe',
        email: 'john@example.com',
        telefono: '+1234567890',
        direccion: '123 Main St',
        razonSocial: 'Empresa S.A.S.',
        nit: '1234567890',
      );

      // Act
      const state = RegisterClientState(client: client);

      // Assert
      expect(state.client.id, equals('client-123'));
      expect(state.client.nombre, equals('John Doe'));
      expect(state.client.email, equals('john@example.com'));
      expect(state.client.telefono, equals('+1234567890'));
      expect(state.client.direccion, equals('123 Main St'));
      expect(state.client.razonSocial, equals('Empresa S.A.S.'));
      expect(state.client.nit, equals('1234567890'));
    });

    test('should handle loading states', () {
      // Arrange
      const loadingState = RegisterClientState(isLoading: true);
      const notLoadingState = RegisterClientState(isLoading: false);

      // Assert
      expect(loadingState.isLoading, equals(true));
      expect(notLoadingState.isLoading, equals(false));
    });
  });
}
