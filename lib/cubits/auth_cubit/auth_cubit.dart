import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/helper/cache_helper.dart';
import 'package:grocery_app/helper/service_locator.dart';

import '../../constants.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  String email = "";
  String password = "";
  String username = "";
  bool isPasswordVisible = false;
  final String userId = ID.unique();
  GlobalKey<FormState> signupKey = GlobalKey();
  GlobalKey<FormState> loginKey = GlobalKey();
  final account = getIt.get<Account>();
  final databases = getIt.get<Databases>();
  late User userInfo;

  changePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    emit(PasswordVisibilityChanged());
  }

  registerNewUser() async {
    emit(SignUpLoading());

    try {
      final user = await account.create(
        userId: userId,
        email: email,
        password: password,
        name: username,
      );
      getIt.get<CacheHelper>().saveUserId(kuserId, user.$id.toString());

      await databases.createDocument(
          databaseId: '6521defc672616c7689e',
          collectionId: '65627b3fd119af3d4179',
          documentId: user.$id,
          data: {
            kuserId: user.$id,
          });
      await account.createEmailSession(email: email, password: password);
      emit(SignUpSuccess());
    } on AppwriteException catch (e) {
      emit(SignUpFailure(errMessage: e.toString()));
    } catch (e) {
      emit(SignUpFailure(errMessage: e.toString()));
    }
  }

  loginUser() async {
    try {
      emit(SignInLoading());
      final account = getIt.get<Account>();

      await account.createEmailSession(email: email, password: password);

      final user = await account.get();
      getIt.get<CacheHelper>().saveUserId('userId', user.$id);

      emit(SignInSuccess());
    } on Exception catch (e) {
      emit(SignInFailure(errMessage: e.toString()));
    }
  }

  logoutUser() async {
    try {
      emit(LogoutLoading());
      await account.deleteSession(sessionId: 'current');
      emit(LogoutSuccess());
    } on Exception catch (e) {
      emit(LogoutFailure(errMessage: e.toString()));
    }
  }
}
