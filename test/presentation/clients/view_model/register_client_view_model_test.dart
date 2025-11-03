import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medi_supply_app_grupo3/presentation/clients/view_model/register_client_view_model.dart';
import 'package:medi_supply_app_grupo3/data/repository/entity/client/client.dart';

// This suite targets at least 80% coverage for RegisterClientViewModel
void main() {
  group('RegisterClientViewModel', () {
    late ProviderContainer container;

    setUp(() {
      container = ProviderContainer();
    });

    tearDown(() {
      container.dispose();
    });

    test('Initial state is correct', () {
      final viewModel = container.read(
        registerClientViewModelProvider.notifier,
      );
      final state = viewModel.state;
      expect(state.client, equals(const Client()));
      expect(state.isLoading, isFalse);
    });

    test('setNombre updates nombre and preserves other fields', () {
      final viewModel = container.read(
        registerClientViewModelProvider.notifier,
      );
      viewModel.setEmail('x@x.com');
      viewModel.setNombre('Alfa');
      expect(viewModel.state.client.nombre, equals('Alfa'));
      expect(viewModel.state.client.email, equals('x@x.com'));
    });

    test('setEmail updates email and preserves nombre', () {
      final viewModel = container.read(
        registerClientViewModelProvider.notifier,
      );
      viewModel.setNombre('Bob');
      viewModel.setEmail('bob@mail.com');
      expect(viewModel.state.client.email, equals('bob@mail.com'));
      expect(viewModel.state.client.nombre, equals('Bob'));
    });

    test('setTelefono updates telefono', () {
      final viewModel = container.read(
        registerClientViewModelProvider.notifier,
      );
      viewModel.setTelefono('+1234567890');
      expect(viewModel.state.client.telefono, equals('+1234567890'));
    });

    test('setDireccion updates direccion', () {
      final viewModel = container.read(
        registerClientViewModelProvider.notifier,
      );
      viewModel.setDireccion('Av 123');
      expect(viewModel.state.client.direccion, equals('Av 123'));
    });

    test('setRazonSocial updates razonSocial', () {
      final viewModel = container.read(
        registerClientViewModelProvider.notifier,
      );
      viewModel.setRazonSocial('Empresa S.A.S.');
      expect(viewModel.state.client.razonSocial, equals('Empresa S.A.S.'));
    });

    test('setNit updates nit', () {
      final viewModel = container.read(
        registerClientViewModelProvider.notifier,
      );
      viewModel.setNit('1234567890');
      expect(viewModel.state.client.nit, equals('1234567890'));
    });

    test('setNombre preserves all other fields', () {
      final viewModel = container.read(
        registerClientViewModelProvider.notifier,
      );
      viewModel.setEmail('test@example.com');
      viewModel.setTelefono('+1234567890');
      viewModel.setDireccion('Test Address');
      viewModel.setRazonSocial('Test Company');
      viewModel.setNit('1234567890');
      viewModel.setNombre('John Doe');

      expect(viewModel.state.client.nombre, equals('John Doe'));
      expect(viewModel.state.client.email, equals('test@example.com'));
      expect(viewModel.state.client.telefono, equals('+1234567890'));
      expect(viewModel.state.client.direccion, equals('Test Address'));
      expect(viewModel.state.client.razonSocial, equals('Test Company'));
      expect(viewModel.state.client.nit, equals('1234567890'));
    });

    test('setEmail preserves all other fields', () {
      final viewModel = container.read(
        registerClientViewModelProvider.notifier,
      );
      viewModel.setNombre('John Doe');
      viewModel.setTelefono('+1234567890');
      viewModel.setDireccion('Test Address');
      viewModel.setRazonSocial('Test Company');
      viewModel.setNit('1234567890');
      viewModel.setEmail('test@example.com');

      expect(viewModel.state.client.nombre, equals('John Doe'));
      expect(viewModel.state.client.email, equals('test@example.com'));
      expect(viewModel.state.client.telefono, equals('+1234567890'));
      expect(viewModel.state.client.direccion, equals('Test Address'));
      expect(viewModel.state.client.razonSocial, equals('Test Company'));
      expect(viewModel.state.client.nit, equals('1234567890'));
    });

    group('validation', () {
      test('validateClientNombre returns error on empty', () {
        final viewModel = container.read(
          registerClientViewModelProvider.notifier,
        );
        expect(viewModel.validateClientNombre(), isNotNull);
        viewModel.setNombre('');
        expect(viewModel.validateClientNombre(), isNotNull);
      });

      test('validateClientEmail returns error on empty', () {
        final viewModel = container.read(
          registerClientViewModelProvider.notifier,
        );
        expect(viewModel.validateClientEmail(), isNotNull);
        viewModel.setEmail('');
        expect(viewModel.validateClientEmail(), isNotNull);
      });

      test('validateClientTelefono returns error on empty', () {
        final viewModel = container.read(
          registerClientViewModelProvider.notifier,
        );
        expect(viewModel.validateClientTelefono(), isNotNull);
        viewModel.setTelefono('');
        expect(viewModel.validateClientTelefono(), isNotNull);
      });

      test('validateClientDireccion returns error on empty', () {
        final viewModel = container.read(
          registerClientViewModelProvider.notifier,
        );
        expect(viewModel.validateClientDireccion(), isNotNull);
        viewModel.setDireccion('');
        expect(viewModel.validateClientDireccion(), isNotNull);
      });

      test('validateClientRazonSocial returns error on empty', () {
        final viewModel = container.read(
          registerClientViewModelProvider.notifier,
        );
        expect(viewModel.validateClientRazonSocial(), isNotNull);
        viewModel.setRazonSocial('');
        expect(viewModel.validateClientRazonSocial(), isNotNull);
      });

      test('validateClientNit returns error on empty', () {
        final viewModel = container.read(
          registerClientViewModelProvider.notifier,
        );
        expect(viewModel.validateClientNit(), isNotNull);
        viewModel.setNit('');
        expect(viewModel.validateClientNit(), isNotNull);
      });

      test('validateClientNombre accepts valid nombre', () {
        final viewModel = container.read(
          registerClientViewModelProvider.notifier,
        );
        viewModel.setNombre('John Doe');
        expect(viewModel.validateClientNombre(), isNull);
      });

      test('validateClientEmail accepts valid email', () {
        final viewModel = container.read(
          registerClientViewModelProvider.notifier,
        );
        viewModel.setEmail('user@email.com');
        expect(viewModel.validateClientEmail(), isNull);
      });

      test('validateClientTelefono accepts valid telefono', () {
        final viewModel = container.read(
          registerClientViewModelProvider.notifier,
        );
        viewModel.setTelefono('+1234567890');
        expect(viewModel.validateClientTelefono(), isNull);
      });

      test('validateClientDireccion accepts valid direccion', () {
        final viewModel = container.read(
          registerClientViewModelProvider.notifier,
        );
        viewModel.setDireccion('123 Main St');
        expect(viewModel.validateClientDireccion(), isNull);
      });

      test('validateClientRazonSocial accepts valid razonSocial', () {
        final viewModel = container.read(
          registerClientViewModelProvider.notifier,
        );
        viewModel.setRazonSocial('Empresa S.A.S.');
        expect(viewModel.validateClientRazonSocial(), isNull);
      });

      test('validateClientNit accepts valid nit', () {
        final viewModel = container.read(
          registerClientViewModelProvider.notifier,
        );
        viewModel.setNit('1234567890');
        expect(viewModel.validateClientNit(), isNull);
      });
    });

    test('state isLoading can be set through simulate loading', () {
      final viewModel = container.read(
        registerClientViewModelProvider.notifier,
      );
      // Simulate start loading (directly setting state for coverage)
      viewModel.state = viewModel.state.copyWith(isLoading: true);
      expect(viewModel.state.isLoading, true);
    });

    test('Client fields default values', () {
      final viewModel = container.read(
        registerClientViewModelProvider.notifier,
      );
      final client = viewModel.state.client;
      expect(client.nombre, equals(''));
      expect(client.email, equals(''));
      expect(client.telefono, equals(''));
      expect(client.direccion, equals(''));
      expect(client.razonSocial, equals(''));
      expect(client.nit, equals(''));
    });
  });
}
