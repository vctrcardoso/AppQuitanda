import 'package:get/get.dart';
import 'package:greengrocer/src/pages/auth/view/sign_in_screen.dart';
import 'package:greengrocer/src/pages/auth/view/sign_up_screen.dart';
import 'package:greengrocer/src/pages/base/base_screen.dart';
import 'package:greengrocer/src/pages/splash/splash_screen.dart';

abstract class AppPages {
  static final pages = <GetPage>[
    GetPage(name: PagesRoutes.splashRoute, page: () => const SplashScreen()),
    GetPage(name: PagesRoutes.signInRoute, page: () => SignInScreen()),
    GetPage(name: PagesRoutes.signUpRoute, page: () => const SignUpScreen()),
    GetPage(name: PagesRoutes.baseRoute, page: () => const BaseScreen()),
    // GetPage(name: '/splash', page: () => const SplashScreen()),
    // GetPage(name: '/splash', page: () => const SplashScreen()),
    // GetPage(name: '/splash', page: () => const SplashScreen()),
    // GetPage(name: '/splash', page: () => const SplashScreen()),
  ];
}

abstract class PagesRoutes {
  static const String signInRoute = '/signin';
  static const String signUpRoute = '/signup';
  static const String splashRoute = '/splash';
  static const String baseRoute = '/';
}
