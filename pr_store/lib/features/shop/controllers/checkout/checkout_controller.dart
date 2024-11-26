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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PrSectionHeading(
                      title: 'Select Payment Method',
                      showActionButton: false,
                    ),
                    SizedBox(height: PrSizes.spaceBtwSections),
                    PrPaymentTile(
                        paymentMethod: PaymentMethodModel(
                            image: PrImage.khalti, name: 'Khalti')),
                    const SizedBox(height: PrSizes.spaceBtwItems / 2),
                    PrPaymentTile(
                        paymentMethod: PaymentMethodModel(
                            image: PrImage.esewa, name: 'Esewa')),
                    const SizedBox(height: PrSizes.spaceBtwItems / 2),
                    PrPaymentTile(
                        paymentMethod: PaymentMethodModel(
                            image: PrImage.googlePay, name: 'Google Pay')),
                    const SizedBox(height: PrSizes.spaceBtwItems / 2),
                    PrPaymentTile(
                        paymentMethod: PaymentMethodModel(
                            image: PrImage.applePay, name: 'Apple Pay')),
                    const SizedBox(height: PrSizes.spaceBtwItems / 2),
                    PrPaymentTile(
                        paymentMethod: PaymentMethodModel(
                            image: PrImage.masterCard, name: 'Master Card')),
                    const SizedBox(height: PrSizes.spaceBtwItems / 2),
                    PrPaymentTile(
                        paymentMethod: PaymentMethodModel(
                            image: PrImage.visa, name: 'Visa Card')),
                    const SizedBox(height: PrSizes.spaceBtwItems / 2),
                    PrPaymentTile(
                        paymentMethod: PaymentMethodModel(
                            image: PrImage.creditCard, name: 'Credit Card')),
                    const SizedBox(height: PrSizes.spaceBtwItems / 2),
                    PrPaymentTile(
                        paymentMethod: PaymentMethodModel(
                            image: PrImage.paytm, name: 'Paytm')),
                    const SizedBox(height: PrSizes.spaceBtwItems / 2),
                    PrPaymentTile(
                        paymentMethod: PaymentMethodModel(
                            image: PrImage.paypal, name: 'PayPal')),
                    const SizedBox(height: PrSizes.spaceBtwItems / 2),
                  ],
                ),
              ),
            ));
  }
}
