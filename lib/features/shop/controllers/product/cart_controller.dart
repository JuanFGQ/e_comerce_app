import 'package:e_comerce_app/common/widgets/loaders/loaders.dart';
import 'package:e_comerce_app/features/shop/controllers/product/variation_controller.dart';
import 'package:e_comerce_app/features/shop/models/cart_item_model.dart';
import 'package:e_comerce_app/features/shop/models/product_model.dart';
import 'package:e_comerce_app/utils/constants/enums.dart';
import 'package:e_comerce_app/utils/local_storage/storage_utility.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find();

  //Variables
  RxInt noOfCartItems = 0.obs;
  RxDouble totalCartPrice = 0.0.obs;
  RxInt productQuantityInCart = 0.obs;
  RxList<CartItemModel> cartItems = <CartItemModel>[].obs;
  final variationController = VariationController.instance;

  CartController() {
    loadCartItems();
  }

  //Add Items to cart
  void addCart(ProductModel product) {
    //Quantity check
    if (productQuantityInCart.value < 1) {
      TLoaders.customToast(message: 'Select Quantity');
      return;
    }
    //variation selected?
    if (product.productType == ProductType.variable.toString() &&
        variationController.selectedVariation.value.id.isEmpty) {
      TLoaders.customToast(message: 'Select Variation');
      return;
    }
    //Out of Stock
    if (product.productType == ProductType.variable.toString()) {
      if (variationController.selectedVariation.value.stock < 1) {
        TLoaders.warningSnackBar(
            title: 'Oh Snap!', message: 'Selected variation is out of stock');
        return;
      }
    } else {
      if (product.stock < 1) {
        TLoaders.warningSnackBar(
            title: 'Oh Snap!', message: 'Selected Product is out of stock');
      }
    }
    //convert the productModel to a CartItemModel with  the given quantity
    final selectedCartItem =
        convertToCartItem(product, productQuantityInCart.value);

    //check if already added in the cartç
    int index = cartItems.indexWhere((element) =>
        element.productId == selectedCartItem.productId &&
        element.variationId == selectedCartItem.variationId);

    if (index >= 0) {
      //this quantity is already added or Update/Removed from the design (Cart)(-)
      cartItems[index].quantity = selectedCartItem.quantity;
    } else {
      cartItems.add(selectedCartItem);
    }
    updateCart();
    TLoaders.customToast(message: 'Your Product has been added to the cart ');
  }

  void addOneToCart(CartItemModel item) {
    int index = cartItems.indexWhere((element) =>
        element.productId == item.productId &&
        element.variationId == item.variationId);

    if (index >= 0) {
      cartItems[index].quantity += 1;
    } else {
      cartItems.add(item);
    }
    updateCart();
  }

  void removeOneFromChart(CartItemModel item) {
    int index = cartItems.indexWhere((element) =>
        element.productId == item.productId &&
        element.variationId == item.variationId);

    if (index >= 0) {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity -= 1;
      } else {
        //show dialoig before completly removing
        cartItems[index].quantity == 1
            ? removeFromCartDialog(index)
            : cartItems.removeAt(index);
      }
      updateCart();
    }
  }

  void removeFromCartDialog(int index) {
    Get.defaultDialog(
      title: 'Remove Product',
      middleText: 'Are you sure you want to remove this product?',
      onConfirm: () {
        //remove the item from the cart
        cartItems.removeAt(index);
        updateCart();
        TLoaders.customToast(message: 'Product removed from the cart.');
        Get.back();
      },
      onCancel: () => () => Get.back(),
    );
  }

  //this function converts a productModel to a cart Item model
  CartItemModel convertToCartItem(ProductModel product, int quantity) {
    if (product.productType == ProductType.single.toString()) {
      //reset variationin case of single product type.
      variationController.resetSelectedAttributes();
    }
    final variation = variationController.selectedVariation.value;
    final isVariation = variation.id.isNotEmpty;
    final price = isVariation
        ? variation.salePrice > 0.0
            ? variation.salePrice
            : variation.price
        : product.salePrice > 0.0
            ? product.salePrice
            : product.price;

    return CartItemModel(
        title: product.title,
        price: price,
        productId: product.id,
        quantity: quantity,
        variationId: variation.id,
        image: isVariation ? variation.image : product.thumbnail,
        brandName: product.brand != null ? product.brand!.name : '',
        selectedVariation: isVariation ? variation.attributeValues : null);
  }

//Update cart values
  void updateCart() {
    updateCartTotals();
    saveCartItems();
    cartItems.refresh();
  }

  void updateCartTotals() {
    double calculatedTotalPrice = 0.0;
    int calculateNoOfItems = 0;

    for (var item in cartItems) {
      calculatedTotalPrice += (item.price) * item.quantity.toDouble();
      calculateNoOfItems += item.quantity;
    }
    totalCartPrice.value = calculatedTotalPrice;
    noOfCartItems.value = calculateNoOfItems;
  }

  void saveCartItems() {
    final cartItemStrings = cartItems.map((item) => item.toJson()).toList();
    TLocalStorage.instace().saveData('cartItems', cartItemStrings);
  }

  void loadCartItems() {
    final cartItemsString =
        TLocalStorage.instace().readData<List<dynamic>>('cartItems');
    if (cartItemsString != null) {
      cartItems.assignAll(cartItemsString.map(
          (items) => CartItemModel.fromJson(items as Map<String, dynamic>)));
      updateCartTotals();
    }
  }

  int getProductsQuantityInCART(String productId) {
    final foundItem = cartItems
        .where((item) => item.productId == productId)
        .fold(0, (previousValue, element) => previousValue + element.quantity);
    return foundItem;
  }

  int getVariationsQuantityInCart(String productId, String variationId) {
    final foundItem = cartItems.firstWhere(
      (element) =>
          element.productId == productId && element.variationId == variationId,
      orElse: () => CartItemModel.empty(),
    );
    return foundItem.quantity;
  }

  void clearCart() {
    productQuantityInCart.value = 0;
    cartItems.clear();
    updateCart();
  }

// Initialize already added Item´s count in the cart.

  void updateAlreadyAddedProductCount(ProductModel product) {
    //if product has no variation then calculate cartEntries and display total number.
    //Else make default entries to 0 and show cartEntries when variation is selected.
    if (product.productType == ProductType.single.toString()) {
      productQuantityInCart.value = getProductsQuantityInCART(product.id);
    } else {
      //Get selected variation if any..
      final variationId = variationController.selectedVariation.value.id;
      if (variationId.isNotEmpty) {
        productQuantityInCart.value =
            getVariationsQuantityInCart(product.id, variationId);
      } else {
        productQuantityInCart.value = 0;
      }
    }
  }
}
