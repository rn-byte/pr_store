import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pr_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:pr_store/features/shop/controllers/checkout/checkout_controller.dart';
import 'package:pr_store/features/shop/models/payment_method_model.dart';
import 'package:pr_store/utils/constants/colors.dart';
import 'package:pr_store/utils/constants/sizes.dart';

class PrPaymentTile extends StatelessWidget {
  const PrPaymentTile({super.key, required this.paymentMethod});

  final PaymentMethodModel paymentMethod;

  @override
  Widget build(BuildContext context) {
    final controller = CheckoutController.instance;
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      onTap: () {
        controller.selectedPaymentMethod.value = paymentMethod;
        Get.back();
      },
      leading: PrRoundedContainer(
        width: 60,
        height: 40,
        backgroundColor: PrColor.lightGrey,
        padding: const EdgeInsets.all(PrSizes.sm),
        child: Image(
          image: AssetImage(paymentMethod.image),
          fit: BoxFit.contain,
        ),
      ),
      title: Text(paymentMethod.name),
      trailing: const Icon(Iconsax.arrow_right),
    );
  }
}
