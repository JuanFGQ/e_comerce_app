import 'package:e_comerce_app/common/widgets/loaders/loaders.dart';
import 'package:e_comerce_app/data/repositories/banners/banner_repository.dart';
import 'package:e_comerce_app/dummy_data.dart';
import 'package:e_comerce_app/features/shop/models/baner_model.dart';
import 'package:get/get.dart';

class BannerController extends GetxController {
  static BannerController get instance => Get.find();

  //variables
  final isLoading = false.obs;

  final carouselCurrentIndex = 0.obs;
  final RxList<BannerModel> banners = <BannerModel>[].obs;
//43
  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }

//update page navigational dots
  void updatePageIndicator(index) {
    carouselCurrentIndex.value = index;
  }

  Future<void> fetchBanners() async {
    try {
      //show loader while loading categories
      isLoading.value = true;

      //Fetch Banners
      final bannerRepo = Get.put(BannerRepository());
      final banners = await bannerRepo.fetchBanners();

      //assign banners to the vatiable banners declared above
      this.banners.assignAll(banners);

      //fetch banners
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      //remove loader
      isLoading.value = false;
    }
  }

  Future<void> uploadBanners() async {
    try {
      final bannerRepo = Get.put(BannerRepository());

      await bannerRepo.uploadBannersDummyData(TDummyData.banners);

      TLoaders.successSnackBar(title: 'Succesfully uploaded');
    } catch (e) {
      TLoaders.errorSnackBar(
          title: 'Error while uploading', message: e.toString());
    }
  }
}
