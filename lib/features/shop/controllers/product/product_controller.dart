import 'package:e_comerce_app/common/widgets/loaders/loaders.dart';
import 'package:e_comerce_app/data/repositories/products/products_repository.dart';
import 'package:e_comerce_app/dummy_data.dart';
import 'package:e_comerce_app/features/shop/models/product_model.dart';
import 'package:e_comerce_app/utils/constants/enums.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  RxList<ProductModel> featuredProducts = <ProductModel>[].obs;
  final productRepository = Get.put(ProductRepository());
  final isLoading = false.obs;

  @override
  void onInit() {
    fetchFeaturedProducts();
    super.onInit();
  }

  void fetchFeaturedProducts() async {
    try {
      //show loader while loading products
      isLoading.value = true;

      //Fetch products
      final products = await productRepository.getFeaturedProducts();

      //Assign Products
      featuredProducts.assignAll(products);
    } catch (e) {
      JLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<List<ProductModel>> fetchAllFeaturedProducts() async {
    try {
      //Fetch products
      final products = await productRepository.getFeaturedProducts();
      return products;
    } catch (e) {
      JLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  //Get the product price or price range fro variations
  String getProductsPrice(ProductModel product) {
    double smallestPrice = double.infinity;
    double largestPrice = 0.0;

    //if there are no variations , return the simple price or sale price
    if (product.productType == ProductType.single.toString()) {
      return (product.salePrice > 0 ? product.salePrice : product.price)
          .toString();
    } else {
      //calculate the smallest and largest prices among variations
      for (var variation in product.productVariations!) {
        //Determine the price to consider (sale price if available, otherwise regular price)
        double priceToCondider =
            variation.salePrice > 0.0 ? variation.salePrice : variation.price;

        //Update smallest and largest prices
        if (priceToCondider < smallestPrice) {
          smallestPrice = priceToCondider;
        }

        if (priceToCondider > largestPrice) {
          largestPrice = priceToCondider;
        }
      }

      //if smallest and largest prices are the same , return a single price
      if (smallestPrice.isEqual(largestPrice)) {
        return largestPrice.toString();
      } else {
        //Otherwise, return a price range
        return '$smallestPrice - \$$largestPrice';
      }
    }
  }

// calculate discount percentage

  String? calculatSalePercetange(double originalPrice, double? salePrice) {
    if (salePrice == null || salePrice <= 0.0) return null;
    if (originalPrice <= 0) return null;

    double percentage = ((originalPrice - salePrice) / originalPrice) * 100;
    return percentage.toStringAsFixed(0);
  }

  //Check product Stock Status
  String getProductStockStatus(int stock) {
    return stock > 0 ? 'In Stock' : 'Out of Stock';
  }

  Future<void> uploadDummyData() async {
    try {
      await productRepository.uploadTestData(JDummyData.products);
      JLoaders.successSnackBar(title: 'Brands Succesfully Uploaded');
    } catch (e) {
      JLoaders.errorSnackBar(
          title: 'Error while uploading', message: e.toString());
    }
  }
}
