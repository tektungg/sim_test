import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:venturo_api_manager/venturo_api_manager.dart';
import 'package:venturo_core/features/crud/models/crud_model.dart';
import 'package:venturo_core/features/crud/repositories/crud_repository.dart';
import 'package:venturo_core/utils/functions/dialog_utils_function.dart';
import 'package:vpack/components/button/v_button.dart';

class CrudController extends GetxController {
  static CrudController get to => Get.find();

  Rx<GlobalKey<FormState>> formKey = GlobalKey<FormState>().obs;
  Rx<TextEditingController> userNameController = TextEditingController().obs;
  Rx<TextEditingController> addressController = TextEditingController().obs;
  Rx<TextEditingController> phoneController = TextEditingController().obs;
  RxList<CrudDataModel> dataUsers = <CrudDataModel>[].obs;
  Rx<RefreshController> refreshController = RefreshController().obs;
  RxBool isRefresh = false.obs;

  /* Mock Api */
  void addDataMock() async {
    try {
      /* Check global loading */
      if (Get.isDialogOpen ?? false) return;
      /* Check validation every controller */
      if (!(formKey.value.currentState?.validate() ?? false)) return;

      /* Add your data */
      final data = (CrudDataModel(
        address: addressController.value.text,
        name: userNameController.value.text,
        phone: phoneController.value.text,
      ));

      /* Insert into repository */
      DialogUtilsFunction.showGlobalLoading();
      await CrudRepository.createDataMock(data: data);
      await getDataMock();

      /* Clear your controller */
      userNameController.value.clear();
      addressController.value.clear();
      phoneController.value.clear();
      DialogUtilsFunction.closeGlobalLoading();
      Get.back();
    } catch (e) {
      DialogUtilsFunction.closeGlobalLoading();
      Get.snackbar("Gagal", e.toString());
    }
  }

  /* Mock Api */
  void deleteDataMock(String id) async {
    try {
      /* Check global loading */
      if (Get.isDialogOpen ?? false) return;
      /* Add validation to deleted data */
      final value = await Get.defaultDialog<bool>(
        title: "Hapus Data",
        cancel: VButton(
          onTap: () => Get.back(result: false),
          label: "Tidak",
        ),
        confirm: VButton(
          type: VButtonType.OUTLINED,
          onTap: () => Get.back(result: true),
          label: "Yakin",
        ),
        middleText: "Apakah Anda yakin ingin menghapus data ini?",
      );

      /* Deleted your data */
      if (value ?? false) {
        DialogUtilsFunction.showGlobalLoading();
        await CrudRepository.deleteDataMock(id: id);
        await getDataMock();
        DialogUtilsFunction.closeGlobalLoading();
      }
    } catch (e) {
      DialogUtilsFunction.closeGlobalLoading();
      Get.snackbar("Gagal Hapus Data", e.toString());
    }
  }

  /* Mock Api */
  void updateDataMock(int index) async {
    try {
      /* Check global loading */
      if (Get.isDialogOpen ?? false) return;
      /* Defind your data with new updated */
      final payload = CrudDataModel(
        id: dataUsers[index].id,
        address: addressController.value.text,
        name: userNameController.value.text,
        phone: phoneController.value.text,
        createdAt: dataUsers[index].createdAt,
      );

      /* Updated your data */
      DialogUtilsFunction.showGlobalLoading();
      await CrudRepository.updateDataMock(payload: payload);
      await getDataMock();

      /* Clear your controller after updated */
      userNameController.value.clear();
      addressController.value.clear();
      phoneController.value.clear();
      DialogUtilsFunction.closeGlobalLoading();
      Get.back();
    } catch (e) {
      DialogUtilsFunction.closeGlobalLoading();
      Get.snackbar("Gagal Update Data", e.toString());
    }
  }

  /* Mock Api */
  Future<void> getDataMock() async {
    try {
      isRefresh.value = true;
      /* Get data user */
      dataUsers.value = await CrudRepository.getDataMock() ?? [];
      refreshController.value.refreshCompleted();
    } catch (e) {
      logger.e(e);
      refreshController.value.refreshFailed();
    } finally {
      isRefresh.value = false;
    }
  }

  /* Use Local Storage */
  Future<void> getDataUsers() async {
    try {
      isRefresh.value = true;
      /* Get data user */
      dataUsers.value = await CrudRepository.getData() ?? [];
      refreshController.value.refreshCompleted();
    } catch (e) {
      logger.e(e);
      refreshController.value.refreshFailed();
    } finally {
      isRefresh.value = false;
    }
  }

  /* Use Local Storage */
  void addData() async {
    /* Check validation every controller */
    if (!(formKey.value.currentState?.validate() ?? false)) return;

    /* Add your data */
    final data = (CrudDataModel(
      address: addressController.value.text,
      name: userNameController.value.text,
      phone: phoneController.value.text,
    ));

    /* Insert into repository */
    await CrudRepository.createdData(data);
    await getDataUsers();

    /* Clear your controller */
    userNameController.value.clear();
    addressController.value.clear();
    phoneController.value.clear();
    Get.back();
  }

  /* Use Local Storage */
  void deleteData(int index) async {
    /* Add validation to deleted data */
    final value = await Get.defaultDialog<bool>(
      title: "Hapus Data",
      cancel: VButton(
        onTap: () => Get.back(result: false),
        label: "Tidak",
      ),
      confirm: VButton(
        type: VButtonType.OUTLINED,
        onTap: () => Get.back(result: true),
        label: "Yakin",
      ),
      middleText: "Apakah Anda yakin ingin menghapus data ini?",
    );

    /* Deleted your data */
    if (value ?? false) {
      await CrudRepository.deletedData(dataUsers[index]);
      await getDataUsers();
    }
  }

  /* Use Local Storage */
  void updateData(int index) async {
    /* Defind your data with new updated */
    final payload = CrudDataModel(
      id: dataUsers[index].id,
      address: addressController.value.text,
      name: userNameController.value.text,
      phone: phoneController.value.text,
    );

    /* Updated your data */
    await CrudRepository.updatedData(payload);
    await getDataUsers();

    /* Clear your controller after updated */
    userNameController.value.clear();
    addressController.value.clear();
    phoneController.value.clear();
    Get.back();
  }

  /* Example Real Api for trigger Refresh Token */
  Future<void> getProfile() async {
    try {
      /* Get data profile */
      await CrudRepository.getProfile();
    } catch (e) {
      logger.e(e);
    }
  }

  @override
  void onInit() {
    super.onInit();
    getDataMock();
    getProfile();
  }
}
