import 'package:e_comerce_app/common/widgets/loaders/loaders.dart';
import 'package:e_comerce_app/data/categories/category_repository.dart';
import 'package:e_comerce_app/features/shop/screens/models/category_model.dart';
import 'package:e_comerce_app/utils/popups/full_screen_loader.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  //Load category data
  Future<void> fetchCategories() async {
    try {
      //show loader while loading categories
      isLoading.value = true;

      //fetch categories from data source (Firestore, API)

      final categories = await _categoryRepository.getAllCategories();

      //Update the categories list

//if something goes wrong check this one and follow the error 42  17:00
      allCategories.assignAll(categories as Iterable<CategoryModel>);

      //Filter featured categories
      featuredCategories.assignAll(allCategories
          .where((category) => category.isFeatured && category.parentId.isEmpty)
          .take(8)
          .toList());
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      //remove loader
      isLoading.value = false;
    }
  }

  //Load selected category data

  //get category or sub-category products
}
