import 'package:e_comerce_app/features/shop/controllers/product/images_controller.dart';
import 'package:e_comerce_app/features/shop/models/poduct_model.dart';
import 'package:e_comerce_app/features/shop/models/product_variation_model.dart';
import 'package:get/get.dart';

class VariationController extends GetxController {
  static VariationController get instance => Get.find();

  //variables

  RxMap selectedAttributes = {}.obs;
  RxString variationStockStatus = ''.obs;
  Rx<ProductVariationModel> selectedVariation =
      ProductVariationModel.empty().obs;

  //Select Attribute , and Variation
  void onAttributeSelected(
      ProductModel product, attributeName, attributeValue) {
    //When attribute is selected we will first add that attribute to the selecetdAttributes
    final selectedAttributes =
        Map<String, dynamic>.from(this.selectedAttributes);
    selectedAttributes[attributeName] = attributeValue;
    this.selectedAttributes[attributeName] = attributeValue;

    final selectedVariation = product.productVariatiosn!.firstWhere(
        (element) => _isSameAttributesValues(
            element.attributeValues, selectedAttributes),
        orElse: () => ProductVariationModel.empty());

    //show the selected variation image as a main Image
    if (selectedVariation.image.isNotEmpty) {
      ImagesController.instance.selectedProductImage.value =
          selectedVariation.image;
    }
    //Assign Selected Variation
    this.selectedVariation.value = selectedVariation;

    //update selected product variation status
    getProductVariationStockStatus();
  }

  //check if selected Attributes matches any variation attributes
  bool _isSameAttributesValues(Map<String, dynamic> variationAttributes,
      Map<String, dynamic> selectedAttributes) {
    //if selectedAttributes containes 3 attributes and current cariation containes 2 the return.
    if (variationAttributes.length != selectedAttributes.length) return false;
    //if ant of the attributes is different then return. e.g [green,large] x [green , small]
    for (final key in variationAttributes.keys) {
      //Attributes[key]= values which could  be [Green,Small,Cotton] etc
      if (variationAttributes[key] != selectedAttributes[key]) return false;
    }
    return true;
  }

  //Check attribute availability /Stock in variation
  Set<String?> getAttributesAvailabilityVariation(
      List<ProductVariationModel> variations, String attributeName) {}

  ///Check Product variation Stock status
  void getProductVariationStockStatus() {
    variationStockStatus.value =
        selectedVariation.value.stock > 0 ? 'In Stock' : 'Out of Stock';
  }

  /// Reset Selected Attributes when switching products
  void resetSelectedAttributes() {
    selectedAttributes.clear();
    variationStockStatus.value = '';
    selectedVariation.value = ProductVariationModel.empty();
  }
}
