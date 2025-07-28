import 'package:venturo_core/constants/api_constant.dart';
import 'package:venturo_core/constants/hive_constant.dart';
import 'package:venturo_core/features/crud/models/crud_model.dart';
import 'package:venturo_core/features/crud/models/profile_model.dart';
import 'package:venturo_core/utils/services/api_service.dart';
import 'package:venturo_core/utils/services/hive_service.dart';
import 'package:vpack/vpack.dart';

class CrudRepository {
  CrudRepository._();

  /* Mock Api */
  static Future<List<CrudDataModel>?> getDataMock() async {
    try {
      final response = await VenturoApiManager.api.get(
        ApiConstant.user,
        baseUrl: ApiConstant.mockApiUrl,
      );
      final List<dynamic> data = response.data;
      return List<CrudDataModel>.from(
          data.map((e) => CrudDataModel.fromJson(e)));
    } on DioException catch (_) {
      rethrow;
    }
  }

  /* Mock Api */
  static Future<void> createDataMock({required CrudDataModel data}) async {
    try {
      await VenturoApiManager.api
          .post(ApiConstant.user, baseUrl: ApiConstant.mockApiUrl, data: {
        "name": data.name,
        "address": data.address,
        "phone": data.phone,
      });
    } on DioException catch (e) {
      throw ApiService.apiErrorHandler(e);
    }
  }

  /* Mock Api */
  static Future<void> updateDataMock({required CrudDataModel payload}) async {
    try {
      await VenturoApiManager.api.put("${ApiConstant.user}/${payload.id}",
          baseUrl: ApiConstant.mockApiUrl,
          data: {
            "createdAt": payload.createdAt,
            "address": payload.address,
            "name": payload.name,
            "phone": payload.phone,
          });
    } on DioException catch (e) {
      throw ApiService.apiErrorHandler(e);
    }
  }

  /* Mock Api */
  static Future<void> deleteDataMock({required String id}) async {
    try {
      await VenturoApiManager.api.delete(
        "${ApiConstant.user}/$id",
        baseUrl: ApiConstant.mockApiUrl,
      );
    } on DioException catch (e) {
      throw ApiService.apiErrorHandler(e);
    }
  }

  /* Use Local Storage */
  static Future<List<CrudDataModel>?> getData() async {
    try {
      final hiveBox = HiveService.generalBox;
      CrudModel currentListModel =
          hiveBox.get(HiveConstant.listCrudDataModel) ?? CrudModel(data: []);
      return currentListModel.data;
    } on DioException catch (_) {
      rethrow;
    }
  }

  /* Use Local Storage */
  static Future<void> updatedData(CrudDataModel data) async {
    try {
      final hiveBox = HiveService.generalBox;
      CrudModel currentListModel =
          hiveBox.get(HiveConstant.listCrudDataModel) ?? CrudModel(data: []);
      final index =
          currentListModel.data!.indexWhere((element) => element.id == data.id);
      currentListModel.data![index] = data;
      await hiveBox.put(HiveConstant.listCrudDataModel, currentListModel);
    } catch (_) {
      rethrow;
    }
  }

  /* Use Local Storage */
  static Future<void> createdData(CrudDataModel data) async {
    try {
      final hiveBox = HiveService.generalBox;
      CrudModel currentListModel =
          hiveBox.get(HiveConstant.listCrudDataModel) ?? CrudModel(data: []);

      /* Cek for incement Id */
      if (currentListModel.data?.isNotEmpty ?? false) {
        final lastId = currentListModel.data!
            .map((e) => int.tryParse(e.id ?? '0') ?? 0)
            .fold<int>(0, (prev, element) => element > prev ? element : prev);
        data.id = (lastId + 1).toString();
      } else {
        data.id = 0.toString();
      }
      currentListModel.data?.add(data);
      await hiveBox.put(HiveConstant.listCrudDataModel, currentListModel);
    } catch (_) {
      rethrow;
    }
  }

  /* Use Local Storage */
  static Future<void> deletedData(CrudDataModel data) async {
    try {
      final hiveBox = HiveService.generalBox;
      CrudModel currentListModel =
          hiveBox.get(HiveConstant.listCrudDataModel) ?? CrudModel(data: []);
      currentListModel.data?.removeWhere((element) => element.id == data.id);
      await hiveBox.put(HiveConstant.listCrudDataModel, currentListModel);
    } catch (_) {
      rethrow;
    }
  }

  /* Example Real Api */
  static Future<ProfileData?> getProfile() async {
    try {
      final result = await VenturoApiManager.api.get(
        "${ApiConstant.profile}/me",
      );
      return ProfileData.fromJson(result.data["data"]);
    } on DioException catch (e) {
      throw ApiService.apiErrorHandler(e);
    }
  }
}
