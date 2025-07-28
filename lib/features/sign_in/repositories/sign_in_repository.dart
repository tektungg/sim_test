import 'package:venturo_api_manager/venturo_api_manager.dart';
import 'package:venturo_core/constants/api_constant.dart';
import 'package:venturo_core/features/sign_in/models/sign_in_model.dart';
import 'package:venturo_core/utils/services/api_service.dart';

class SignInRepository {
  SignInRepository._();

  static Future<SignInModel> login(
      String phoneNumber, String password, String? fcmToken) async {
    try {
      final response = await VenturoApiManager.api.post(
        ApiConstant.login,
        data: {
          "phone": phoneNumber,
          "password": password,
          "fcm_token": fcmToken,
        },
      );
      return SignInModel.fromJson(response.data);
    } on DioException catch (e) {
      throw ApiService.apiErrorHandler(e);
    }
  }
}
