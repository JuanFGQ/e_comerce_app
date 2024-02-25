import 'dart:convert';

import 'package:e_comerce_app/common/widgets/loaders/loaders.dart';
import 'package:e_comerce_app/data/repositories/products/products_repository.dart';
import 'package:e_comerce_app/features/shop/models/poduct_model.dart';
import 'package:e_comerce_app/utils/local_storage/storage_utility.dart';
import 'package:get/get.dart';

class FavouriteController extends GetxController {
  static FavouriteController get instance => Get.find();

  //variables
  final favorites = <String, bool>{}.obs;

  // @override
  // void onInit() {
  //   initFavourites();
  //   super.onInit();
  // }

  //Method to initialize favourites by reading from storage
  Future<void> initFavourites() async {
    final json = TLocalStorage.instace().readData('favorites');
    if (json != null) {
      final storedFavorites = jsonDecode(json) as Map<String, dynamic>;
      favorites.assignAll(
          storedFavorites.map((key, value) => MapEntry(key, value as bool)));
    }
  }

  bool isFavourite(String productId) {
    return favorites[productId] ?? false;
  }

  void toggleFavoriteProduct(String productId) {
    if (!favorites.containsKey(productId)) {
      favorites[productId] = true;
      saveFavoritesToStorage();
      TLoaders.customToast(message: 'Products has been added to the wishList.');
    } else {
      TLocalStorage.instace().removeData(productId);
      favorites.remove(productId);
      saveFavoritesToStorage();
      favorites.refresh();
      TLoaders.customToast(
          message: 'Product has been removed from the WishList.');
    }
  }

  void saveFavoritesToStorage() {
    final encodedFavorites = json.encode(favorites);
    TLocalStorage.instace().saveData('favorites', encodedFavorites);
  }

  Future<List<ProductModel>> favoritesProducts() async {
    return await ProductRepository.instance
        .getFavoritesProducts(favorites.keys.toList());
  }
}
