import '../view/lecture_data/lecture_data_screen.dart';
import '../view/on_boarding/onboarding_screen.dart';
import '../view/root/app_root.dart';
import '../view/lectures/lectures_screen.dart';
import '../view/signin/sign_in_screen.dart';
import '../view/splash/splash_screen.dart';
import 'package:get/get.dart';
import 'routes.dart';

class AppPages {
  static List<GetPage> getPages() {
    return [
      GetPage(
        name: Routes.splash,
        page: () => SplashScreen(),
      ),
      GetPage(
        name: Routes.signIn,
        page: () => SignInScreen(),
      ),
      GetPage(
        name: Routes.allLecture,
        page: () => LecturesScreen(),
      ),
      GetPage(
        name: Routes.root,
        page: () => AppRoot(),
      ),
      GetPage(
        name: Routes.onBoarding,
        page: () => OnBoardingScreen(),
      ),
      GetPage(
        name: Routes.lectureData,
        page: () => LectureDataScreen(),
      ),
    ];
  }
}
