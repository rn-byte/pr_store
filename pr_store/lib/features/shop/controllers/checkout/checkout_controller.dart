import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pr_store/common/widgets/texts/section_heading.dart';
import 'package:pr_store/utils/constants/image_strings.dart';
import 'package:pr_store/utils/constants/sizes.dart';

import '../../../../common/widgets/payment/payment_tile.dart';
import '../../models/payment_method_model.dart';

class CheckoutController extends GetxController {
  static CheckoutController get instance => Get.find();

  final Rx<PaymentMethodModel> selectedPaymentMethod =
      PaymentMethodModel.empty().obs;

  @override
  void onInit() {
    selectedPaymentMethod.value =
        PaymentMethodModel(image: PrImage.khalti, name: 'Khalti');
    super.onInit();
  }

  Future<dynamic> selectPaymentMethod(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (_) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(PrSizes.lg),
                child: Column(
                  children: [
                    PrSectionHeading(
                      title: 'Select Payment Method',
                      showActionButton: false,
                    ),
                    SizedBox(height: PrSizes.spaceBtwSections),
                    PrPaymentTile
                  ],
                ),
              ),
            ));
  }
}
