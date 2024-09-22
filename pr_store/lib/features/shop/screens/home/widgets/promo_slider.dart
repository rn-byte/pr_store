import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pr_store/features/shop/controllers/banner/banner_controller.dart';
import 'package:pr_store/utils/constants/colors.dart';
import '../../../../../common/widgets/custom_shapes/containers/circular_container.dart';
import '../../../../../common/widgets/images/pr_rounded_image.dart';
import '../../../../../utils/constants/sizes.dart';

class PrPromoSlider extends StatelessWidget {
  const PrPromoSlider({
    super.key,
    //required this.banners,
  });
  //final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());

    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1,
            onPageChanged: (index, reason) => controller.updatePageIndicator(index),
          ),
          items: controller.banners
              .map((banner) => PrRoundedImage(
                    imageUrl: banner.imageUrl,
                    height: 150,
                    width: 400,
                    fit: BoxFit.fill,
                    isNetworkImage: true,
                    onPressed: () {},
                    backgroundColor: Colors.transparent,
                  ))
              .toList(),
        ),
        const SizedBox(
          height: PrSizes.spaceBtwItems,
        ),
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < controller.banners.length; i++)
                PrCircularContainer(
                    height: 4,
                    width: 20,
                    margin: const EdgeInsets.only(right: 10),
                    backgroundColor: controller.carouselCurrentIndex.value == i
                        ? PrColor.primary
                        : PrColor.grey),
            ],
          ),
        ),
      ],
    );
  }
}
