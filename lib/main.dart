import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/cubits/auth_cubit/auth_cubit.dart';
import 'package:grocery_app/cubits/check_user_if_exists/check_user_if_exists_cubit.dart';
import 'package:grocery_app/cubits/checking_connexion/checking_connexion_cubit.dart';
import 'package:grocery_app/helper/cache_helper.dart';
import 'package:grocery_app/views/home_view.dart';
import 'package:grocery_app/views/sign_up_view.dart';
import 'cubits/check_user_if_exists/check_user_if_exists_state.dart';
import 'helper/service_locator.dart';
import 'simple_bloc_observer.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  Bloc.observer = SimpleBlocObserver();
  setupAppwrite();
  setupSharedPrefrences();

  getIt.get<CacheHelper>().init();

  runApp(const GroceryApp());
}

class GroceryApp extends StatelessWidget {
  const GroceryApp({
    super.key,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(414, 896),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => AuthCubit(),
                ),
                BlocProvider(
                  create: (context) =>
                      CheckUserIfExistsCubit()..getUserIfExists(),
                ),
              ],
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Flutter Demo',
                theme: ThemeData(
                  textSelectionTheme: const TextSelectionThemeData(
                    selectionHandleColor:
                        Colors.black, // Color of the text selection handles
                  ),
                  fontFamily: "Gilroy",
                  useMaterial3: true,
                  textTheme: TextTheme(
                    titleLarge: TextStyle(
                      fontSize: 26.sp,
                      fontWeight: FontWeight.w700,
                      fontFamily: "Gilroy",
                    ),
                    titleSmall: TextStyle(
                      color: const Color(0xFF7C7C7C),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      fontFamily: "Gilroy",
                    ),
                    titleMedium: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      fontFamily: "Gilroy",
                    ),
                  ),
                ),
                home: BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state is LogoutSuccess) {
                      // Navigator.of(context).pop();

                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => const SignUpView()),
                          ));
                    }
                  },
                  builder: (context, state) {
                    return const UserExisting();
                  },
                ),
              ));
        });
  }
}

class UserExisting extends StatelessWidget {
  const UserExisting({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CheckUserIfExistsCubit, CheckUserIfExistsState>(
      listener: (context, state) {
        FlutterNativeSplash.remove();
      },
      builder: (context, state) {
        if (state is UserExists) {
          return BlocProvider(
            create: (context) => CheckingConnexionCubit(),
            child: const HomeCheckerConnexion(),
          );
        } else {
          return const SignUpView();
        }
      },
    );
  }
}
