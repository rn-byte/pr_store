import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../images/pr_circular_image.dart';

class PrProfileUserTile extends StatelessWidget {
  const PrProfileUserTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const PrCircularImage(
        backgroundColor: Colors.transparent,
        image: 'assets/images/user/user.png',
        height: 50,
        width: 50,
        padding: 0,
        fit: BoxFit.contain,
      ),
      title: Text(
        'Pr Store',
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .apply(color: PrColor.white),
      ),
      subtitle: Text(
        'pr_store123@gmail.com',
        style:
            Theme.of(context).textTheme.bodyMedium!.apply(color: PrColor.white),
      ),
      trailing: IconButton(
          onPressed: () {},
          icon: const Icon(
            Iconsax.edit,
            color: PrColor.white,
          )),
    );
  }
}
