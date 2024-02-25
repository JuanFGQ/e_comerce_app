import 'package:e_comerce_app/common/widgets/loaders/loaders.dart';
import 'package:e_comerce_app/data/repositories/brands/brand_repository.dart';
import 'package:e_comerce_app/data/repositories/products/products_repository.dart';
import 'package:e_comerce_app/dummy_data.dart';
import 'package:e_comerce_app/features/shop/models/brand_model.dart';
import 'package:e_comerce_app/features/shop/models/poduct_model.dart';
import 'package:get/get.dart';

class BrandController extends GetxController {
  static BrandController get instance => Get.find();

  //Variables

  RxBool isLoading = true.obs;
  final RxList<BrandModel> allBrands = <BrandModel>[].obs;
  final RxList<BrandModel> featuredBrands = <BrandModel>[].obs;
  final brandRepository = Get.put(BrandRepository());
  final productRepository = Get.put(ProductRepository());

  @override
  void onInit() {
    getFeaturedBrands();
    super.onInit();
  }

  //*Load Brands

  Future<void> getFeaturedBrands() async {
    try {
//show loader while loading prodyucts
      isLoading.value = true;

      final brands = await brandRepository.getAllBrands();
      allBrands.assignAll(brands);

      featuredBrands.assignAll(
          allBrands.where((brand) => brand.isFeatured ?? false).take(4));
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      //stop loader
      isLoading.value = false;
    }
  }

  //*Get all Brands for category

  Future<List<BrandModel>> getBrandForCategory(String categoryId) async {
    try {
      final brands = await brandRepository.getBrandsForCategory(categoryId);
      return brands;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  //*Get brand specific products from your data source
  Future<List<ProductModel>> getBrandProducts(
      {required String brandId, int limit = -1}) async {
    try {
      final products = await ProductRepository.instance
          .getProductsForBrand(brandId: brandId, limit: limit);
      return products;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  //*Upload brand dummy data
  Future<void> uploadBrandDummyData() async {
    try {
      final brandRepo = Get.put(BrandRepository());

      await brandRepo.uploadDummyData(TDummyData.brands);
      TLoaders.successSnackBar(title: 'Brands Succesfully Uploaded');
    } catch (e) {
      TLoaders.errorSnackBar(
          title: 'Error while uploading', message: e.toString());
    }
  }
}
