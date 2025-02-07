import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orbitflow/core/services/sp_service.dart';
import 'package:orbitflow/features/auth/repositories/auth_remote_repository.dart';
import 'package:orbitflow/models/user_model.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  final authRemoteRepository = AuthRemoteRepository();
  final spService = SpService();

  void getUserData() async {}

  void signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      emit(AuthLoading());
      await authRemoteRepository.signUp(
        name: name,
        email: email,
        password: password,
      );
      emit(AuthSignUp());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  void login({
    required String email,
    required String password,
  }) async {
    try {
      emit(AuthLoading());
      final userModel = await authRemoteRepository.login(
        email: email,
        password: password,
      );
      if (userModel.token.isNotEmpty) {
        await spService.setToken(userModel.token);
      }
      emit(AuthLoggedIn(userModel));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}
