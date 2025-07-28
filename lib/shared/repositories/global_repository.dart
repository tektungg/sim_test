import 'package:venturo_core/constants/api_constant.dart';
import 'package:venturo_core/utils/services/api_service.dart';
import 'package:vpack/vpack.dart';

class GlobalRepository {
  GlobalRepository._();

  static Future<String?> refreshToken() async {
    try {
      final result = await VenturoApiManager.api.post(ApiConstant.refreshToken);
      return result.data?["data"]?["access_token"];
    } on DioException catch (e) {
      throw ApiService.apiErrorHandler(e);
    }
  }
}
