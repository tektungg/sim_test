import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:venturo_core/features/crud/controllers/crud_controller.dart';
import 'package:venturo_core/shared/widgets/custom_text_editing_widget.dart';
import 'package:vpack/components/button/v_button.dart';

class CrudFormInputComponent extends StatelessWidget {
  final int? index;
  const CrudFormInputComponent({super.key, this.index});

  @override
  Widget build(BuildContext context) {
    var c = CrudController.to;
    return Material(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Obx(
          () => Form(
            key: c.formKey.value,
            child: Column(
              children: [
                CustomTextEditingWidget(
                  label: "Username",
                  controller: c.userNameController.value,
                  hint: "username",
                  validator: (value) {
                    if (value?.isEmpty ?? false) {
                      return "Username tidak boleh kosong";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8),
                CustomTextEditingWidget(
                  label: "Address",
                  controller: c.addressController.value,
                  hint: "street .st",
                  validator: (value) {
                    if (value?.isEmpty ?? false) {
                      return "Address tidak boleh kosong";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8),
                CustomTextEditingWidget(
                  label: "Phone",
                  controller: c.phoneController.value,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  hint: "+62 8",
                  validator: (value) {
                    if (value?.isEmpty ?? false) {
                      return "Phone tidak boleh kosong";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                VButton(
                  layout: VButtonLayout.FULL,
                  onTap: index != null
                      ? () => c.updateDataMock(index ?? 0)
                      : c.addDataMock,
                  label: index != null ? "Edit Data" : "Tambah Data",
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
