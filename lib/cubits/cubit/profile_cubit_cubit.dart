import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../helper/service_locator.dart';

part 'profile_cubit_state.dart';

class ProfileCubitCubit extends Cubit<ProfileCubitState> {
  ProfileCubitCubit() : super(ProfileCubitInitial());

  final account = getIt.get<Account>();
  final databases = getIt.get<Databases>();
  late User userInfo;

  getUserInformations() async {
    try {
      emit(GetUserLoading());
      final user = await account.get();
      userInfo = user;
      emit(UserFetched());
    } on Exception catch (e) {
      print(e.toString());
    }
  }
}
