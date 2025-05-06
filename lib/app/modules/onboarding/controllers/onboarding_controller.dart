import 'package:get/get.dart';
import '../../../routes/app_pages.dart';

class OnboardingController extends GetxController {
  // Navigation vers login
  void goToLogin() {
    Get.offNamed(Routes.LOGIN);
  }

  // Navigation vers register
  void goToRegister() {
    Get.offNamed(Routes.REGISTER);
  }
}
