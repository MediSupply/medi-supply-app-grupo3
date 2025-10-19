import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../application/networking/networking.dart';
import '../../../data/data_source/remote/auth/auth_data_source_remote.dart';
import '../../../data/repository/entity/session/session.dart';
import '../../../data/repository/entity/user/user.dart';
import '../../../data/repository/remote/auth/auth_repository_remote.dart';
import '../../../data/repository/remote/auth/auth_repository_remote_interface.dart';
import 'state/register_state.dart';

final NotifierProvider<RegisterViewModel, RegisterState>
registerViewModelProvider = NotifierProvider<RegisterViewModel, RegisterState>(
  () => RegisterViewModel(),
);

class RegisterViewModel extends Notifier<RegisterState> {
  late AuthRepositoryRemoteInterface _authRepositoryRemote;

  @override
  RegisterState build() {
    _authRepositoryRemote = AuthRepositoryRemote(
      AuthDataSourceRemote(Networking.instance.dio),
    );
    return RegisterState();
  }

  // Campos individuales
  void setName(String name) {
    final User user = User(
      name: name,
      documentType: state.user.documentType,
      documentNumber: state.user.documentNumber,
      address: state.user.address,
      phone: state.user.phone,
      email: state.user.email,
      password: state.user.password,
    );
    state = state.copyWith(user: user);
  }

  void setDocumentType(String documentType) {
    final User user = User(
      name: state.user.name,
      documentType: documentType,
      documentNumber: state.user.documentNumber,
      address: state.user.address,
      phone: state.user.phone,
      email: state.user.email,
      password: state.user.password,
    );
    state = state.copyWith(user: user);
  }

  void setDocumentNumber(int documentNumber) {
    final User user = User(
      name: state.user.name,
      documentType: state.user.documentType,
      documentNumber: documentNumber,
      address: state.user.address,
      phone: state.user.phone,
      email: state.user.email,
      password: state.user.password,
    );
    state = state.copyWith(user: user);
  }

  void setAddress(String address) {
    final User user = User(
      name: state.user.name,
      documentType: state.user.documentType,
      documentNumber: state.user.documentNumber,
      address: address,
      phone: state.user.phone,
      email: state.user.email,
      password: state.user.password,
    );
    state = state.copyWith(user: user);
  }

  void setPhone(String phone) {
    final User user = User(
      name: state.user.name,
      documentType: state.user.documentType,
      documentNumber: state.user.documentNumber,
      address: state.user.address,
      phone: phone,
      email: state.user.email,
      password: state.user.password,
    );
    state = state.copyWith(user: user);
  }

  void setEmail(String email) {
    final User user = User(
      name: state.user.name,
      documentType: state.user.documentType,
      documentNumber: state.user.documentNumber,
      address: state.user.address,
      phone: state.user.phone,
      email: email,
      password: state.user.password,
    );
    state = state.copyWith(user: user);
  }

  void setPassword(String password) {
    final User user = User(
      name: state.user.name,
      documentType: state.user.documentType,
      documentNumber: state.user.documentNumber,
      address: state.user.address,
      phone: state.user.phone,
      email: state.user.email,
      password: password,
    );
    state = state.copyWith(user: user);
  }

  Future<bool> register() async {
    state = state.copyWith(isLoading: true);
    final AsyncValue<Session> session = await AsyncValue.guard(
      () => _authRepositoryRemote.register(state.user),
    );
    session.when(
      data: (session) =>
          state = state.copyWith(isLoading: false, session: session),
      error: (error, stackTrace) => state = state.copyWith(isLoading: false),
      loading: () => state = state.copyWith(isLoading: true),
    );

    return !session.hasError;
  }

  String? validateUserName() {
    return state.user.validateName();
  }

  String? validateUserDocumentType() {
    return state.user.validateDocumentType();
  }

  String? validateUserDocumentNumber() {
    return state.user.validateDocumentNumber();
  }

  String? validateUserAddress() {
    return state.user.validateAddress();
  }

  String? validateUserPhone() {
    return state.user.validatePhone();
  }

  String? validateUserEmail() {
    return state.user.validateEmail();
  }

  String? validateUserPassword() {
    return state.user.validatePassword();
  }
}
