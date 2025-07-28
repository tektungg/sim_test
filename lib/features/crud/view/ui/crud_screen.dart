import 'package:flutter/material.dart';
import "package:get/get.dart";
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:venturo_core/constants/asset_constant.dart';
import 'package:venturo_core/features/crud/controllers/crud_controller.dart';
import 'package:venturo_core/features/crud/view/components/crud_form_input_component.dart';
import 'package:venturo_core/shared/widgets/custom_empty_widget.dart';
import 'package:venturo_core/shared/widgets/custom_shimmer_widget.dart';

class CrudView extends GetView<CrudController> {
  const CrudView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Crud"),
      ),
      body: Obx(
        () => SmartRefresher(
          controller: controller.refreshController.value,
          onRefresh: controller.getDataMock,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(8),
            child: Obx(() {
              if (controller.isRefresh.value) {
                return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: CustomShimmerWidget(
                    width: double.infinity,
                    height: 80,
                  ),
                );
              } else {
                return controller.dataUsers.isEmpty
                    ? const CustomEmptyWidget(
                        message: "Data list masih kosong",
                        imagePath: AssetConstants.emptyWidget,
                      )
                    : ListView.separated(
                        itemCount: controller.dataUsers.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) => ListTile(
                          onTap: () {
                            final data = controller.dataUsers[index];
                            controller.addressController.value.text = data.address ?? "";
                            controller.userNameController.value.text = data.name ?? "";
                            controller.phoneController.value.text = data.phone ?? "";
                            Get.bottomSheet(CrudFormInputComponent(
                              index: index,
                            ));
                          },
                          title: Text(controller.dataUsers[index].name ?? ""),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(controller.dataUsers[index].address ?? ""),
                              Text(controller.dataUsers[index].phone ?? ""),
                            ],
                          ),
                          trailing: IconButton(
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                            onPressed: () =>
                                controller.deleteDataMock(controller.dataUsers[index].id ?? ""),
                          ),
                        ),
                        separatorBuilder: (_, __) => const Divider(),
                      );
              }
            }),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            controller.userNameController.value.clear();
            controller.addressController.value.clear();
            controller.phoneController.value.clear();
            Get.bottomSheet(const CrudFormInputComponent());
          }),
    );
  }
}
