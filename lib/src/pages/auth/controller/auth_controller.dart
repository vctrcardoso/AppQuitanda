import 'package:get/get.dart';
import 'package:greengrocer/src/constants/storage_keys.dart';
import 'package:greengrocer/src/pages/auth/repository/auth_repository.dart';
import 'package:greengrocer/src/pages/auth/result/auth_result.dart';
import 'package:greengrocer/src/pages_routes/app_pages.dart';
import 'package:greengrocer/src/services/utils_services.dart';

import '../../../models/user_model.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;

  final authRepository = AuthRepository();
  final utilsServices = UtilsServices();
  UserModel user = UserModel();

  @override
  void onInit() {
    validateToken();
    super.onInit();
  }

  void saveTokenAndProceedToBase() {
    utilsServices.saveLocalData(key: StorageKeys.token, data: user.token!);

    Get.offAllNamed(PagesRoutes.baseRoute);
  }

  Future<void> validateToken() async {
    String? token = await utilsServices.getLocalData(key: StorageKeys.token);

    if (token == null) {
      Get.offAllNamed(PagesRoutes.signInRoute);
      return;
    }
    AuthResult result = await authRepository.validateToken(token);

    result.when(success: (user) {
      this.user = user;
      saveTokenAndProceedToBase();
    }, error: (message) {
      signOut();
    });
  }

  Future<void> signOut() async {
    user = UserModel();
    await utilsServices.removeLocalData(key: StorageKeys.token);

    Get.offAllNamed(PagesRoutes.signInRoute);
  }

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    isLoading.value = true;

    AuthResult result =
        await authRepository.signIn(email: email, password: password);

    isLoading.value = false;

    result.when(success: (user) {
      this.user = user;
      saveTokenAndProceedToBase();
    }, error: (message) {
      utilsServices.showToast(message: message, isError: true);
    });
  }
}
