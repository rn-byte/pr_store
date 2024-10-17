import 'package:get/get.dart';

import '../../../../data/address/address_repository.dart';

class AddressController extends GetxController {
  static AddressController get instance => Get.find();

  final addressRepository = Get.put(AddressRepository());
}
