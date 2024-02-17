import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_comerce_app/common/widgets/images/circular_images.dart';
import 'package:e_comerce_app/common/widgets/loaders/loaders.dart';
import 'package:e_comerce_app/data/repositories/address/addres_respository.dart';
import 'package:e_comerce_app/data/repositories/autentication/authentication_repository.dart';
import 'package:e_comerce_app/features/authentication/controllers/network/network_manager.dart';
import 'package:e_comerce_app/features/personalization/models/address_model.dart';
import 'package:e_comerce_app/utils/constants/image_strings.dart';
import 'package:e_comerce_app/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class AddressController extends GetxController {
  static AddressController get instance => Get.find();

  RxBool refreshData = true.obs;
  final Rx<AddressModel> selectedAddress = AddressModel.empty().obs;
  final addressRepository = Get.put(AddressRepository());

  final name = TextEditingController();
  final phoneNumber = TextEditingController();
  final street = TextEditingController();
  final postalCode = TextEditingController();
  final city = TextEditingController();
  final state = TextEditingController();
  final country = TextEditingController();
  GlobalKey<FormState> addressFormKey = GlobalKey<FormState>();

  //fetch all user specific addresses
  Future<List<AddressModel>> getAllUserAddresses() async {
    try {
      final addresses = await addressRepository.fetchUserAddresses();
      selectedAddress.value = addresses.firstWhere(
          (element) => element.selectedAddress,
          orElse: () => AddressModel.empty());
      return addresses;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Address not found', message: e.toString());
      return [];
    }
  }

  //this allows to select one or othe of the availables addresses
  Future selectAddress(AddressModel newSelectedAddress) async {
    Get.defaultDialog(
        title: '',
        onWillPop: () async {
          return false;
        },
        barrierDismissible: false,
        backgroundColor: Colors.transparent,
        content: CircularProgressIndicator());

    try {
      //clear the "selected" field
      if (selectedAddress.value.id.isNotEmpty) {
        await addressRepository.updateSelectedField(
            selectedAddress.value.id, false);
      }

      //Assign selected address
      newSelectedAddress.selectedAddress = true;
      selectedAddress.value = newSelectedAddress;

      //set the "selected" field to true for the newly selected address
      await addressRepository.updateSelectedField(
          selectedAddress.value.id, true);

      Get.back();
    } catch (e) {
      TLoaders.errorSnackBar(
          title: 'Error in selection', message: e.toString());
    }
  }

  ///Add new Address
  Future addNewAddress() async {
    try {
      //start loading
      TFullScreenLoader.openLoadingDialog(
          'Storing Addres...', TImages.handLoading);

      //check internet connectivity
      final isConneted = await NetworkManager.instance.isConnected();
      if (!isConneted) {
        TFullScreenLoader.stopLoading();
        return;
      }
      //form validation
      if (!addressFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      //save address data
      final address = AddressModel(
          id: '',
          name: name.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          street: street.text.trim(),
          city: city.text.trim(),
          state: state.text.trim(),
          postalCode: postalCode.text.trim(),
          country: country.text.trim());

      final id = await addressRepository.addAddress(address);

      //Update selected Address Status
      address.id = id;
      await selectAddress(address);

      //remove loader
      TFullScreenLoader.stopLoading();

      //show succes message
      TLoaders.successSnackBar(
          title: 'Congratulations',
          message: 'Your address has been saved succesfully');

      //refresh address data
      refreshData.toggle();

      //reset fields
      resetFormFields();

      //redirect
      Navigator.of(Get.context!).pop();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Address not found', message: e.toString());
    }
  }

  //Function to reset form fields
  void resetFormFields() {
    name.clear();
    phoneNumber.clear();
    street.clear();
    postalCode.clear();
    city.clear();
    state.clear();
    addressFormKey.currentState?.reset();
  }
}
