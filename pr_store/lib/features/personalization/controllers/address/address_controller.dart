import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pr_store/utils/constants/image_strings.dart';
import 'package:pr_store/utils/helpers/network_manager.dart';
import 'package:pr_store/utils/popups/full_screen_loader.dart';
import 'package:pr_store/utils/popups/loaders.dart';
import '../../../../common/widgets/loaders/circular_loader.dart';
import '../../../../data/address/address_repository.dart';
import '../../../authentication/models/address_model.dart';

class AddressController extends GetxController {
  static AddressController get instance => Get.find();

  final addressRepository = Get.put(AddressRepository());

  final name = TextEditingController();
  final phoneNumber = TextEditingController();
  final street = TextEditingController();
  final postalCode = TextEditingController();
  final city = TextEditingController();
  final state = TextEditingController();
  final country = TextEditingController();
  GlobalKey<FormState> addressFormKey = GlobalKey<FormState>();

  RxBool refreshData = true.obs;

  final Rx<AddressModel> selectedAddress = AddressModel.empty().obs;

  /// Fetch all user specific addresses
  Future<List<AddressModel>> getAllUserAddress() async {
    try {
      final addresses = await addressRepository.fetchUserAddress();
      selectedAddress.value = addresses.firstWhere((element) => element.selectedAddress,
          orElse: () => AddressModel.empty());
      return addresses;
    } catch (e) {
      PrLoaders.errorSnackBar(title: 'Oh Snap !', message: e.toString());
      return [];
    }
  }

  /// select Address
  Future selectAddress(AddressModel newSelectedAddress) async {
    try {
      /// show loader
      Get.defaultDialog(
        title: '',
        onWillPop: () async {
          return false;
        },
        barrierDismissible: false,
        backgroundColor: Colors.transparent,
        content: const PrCircularLoader(),
      );

      /// Clear the 'selected' field
      if (selectedAddress.value.id.isNotEmpty) {
        await addressRepository.updateSelectedField(selectedAddress.value.id, false);
      }

      /// Assign selected address
      newSelectedAddress.selectedAddress = true;
      selectedAddress.value = newSelectedAddress;

      /// set the 'selected' field to true for the newly selected address
      await addressRepository.updateSelectedField(selectedAddress.value.id, true);

      Get.back();
    } catch (e) {
      PrLoaders.errorSnackBar(title: 'Error in Selection ', message: e.toString());
    }
  }

  /// ADD NEW ADDRESS
  Future addNewAddress() async {
    try {
      /// Start Loading
      PrFullScreenLoader.openLoadingDialog('Storing Address....', PrImage.docerAnimation);

      /// Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        PrFullScreenLoader.stopLoading();
        return;
      }

      //Form Validations
      if (!addressFormKey.currentState!.validate()) {
        PrFullScreenLoader.stopLoading();
        return;
      }

      /// Save Address Data
      final address = AddressModel(
        id: '',
        name: name.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        street: street.text.trim(),
        city: city.text.trim(),
        state: state.text.trim(),
        postalCode: postalCode.text.trim(),
        country: country.text.trim(),
        selectedAddress: true,
      );

      final id = await addressRepository.addAddress(address);

      ///update selected address status
      address.id = id;
      await selectAddress(address);

      /// remove loader
      PrFullScreenLoader.stopLoading();

      /// Show success message
      PrLoaders.successSnackBar(
          title: 'Congratulations', message: 'Your address has been saved successfully.');

      /// refresh address data
      refreshData.toggle();

      /// Reset Fields
      resetFormFields();

      /// Redirect
      Navigator.of(Get.context!).pop();
    } catch (e) {
      /// Remove Loader
      PrFullScreenLoader.stopLoading();
      PrLoaders.errorSnackBar(
          title: 'Something went wrong while adding your new address.', message: e.toString());
    }
  }

  /// Reset Form Fileds
  void resetFormFields() {
    name.clear();
    state.clear();
    street.clear();
    country.clear();
    postalCode.clear();
    phoneNumber.clear();
    city.clear();
    addressFormKey.currentState?.reset();
  }
}
