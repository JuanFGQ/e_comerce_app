import 'package:get/get.dart';

class BannerController extends GetxController {
  //variables
  final isLoading = false.obs;

  final carouselCurrentIndex = 0.obs;

//update page navigational dots
  void updatePageIndicator(index) {
    carouselCurrentIndex.value = index;
  }

//   //Fetch Banners
//   //Load category data
//   Future<void> fetchBanner() async {
//     try {
//       //show loader while loading categories
//       isLoading.value = true;

//       //fetch categories from data source (Firestore, API)

//       //Update the categories list

// //if something goes wrong check this one and follow the error 42  17:00
//       allCategories.assignAll(categories as Iterable<CategoryModel>);

//       //Filter featured categories
//       featuredCategories.assignAll(allCategories
//           .where((category) => category.isFeatured && category.parentId.isEmpty)
//           .take(8)
//           .toList());
//     } catch (e) {
//       TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
//     } finally {
//       //remove loader
//       isLoading.value = false;
//     }
//   }
}
