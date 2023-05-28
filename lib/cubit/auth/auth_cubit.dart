import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  Future<void> registerUser(
      {required String email, required String password}) async {
    emit(RegisterLoading());
  }

  Future<void> loginUser(
      {required String email, required String password}) async {
    emit(LoginLoading());
  }
}
