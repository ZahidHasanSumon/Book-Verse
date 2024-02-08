import 'package:book_verse/utils/models/banner_model.dart';
import 'package:get/get.dart';
import '../utils/custom_alert.dart';
import '../utils/repository/banner_repo.dart';

class BannerController extends GetxController {
  final isLoading = false.obs;
  final carouselCurrentIndex = 0.obs;
  RxList<BannerModel> banners = <BannerModel>[].obs;

  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  } //static BannerController get instance => Get.find();

  void updatePageIndicator(index) {
    carouselCurrentIndex.value = index;
  }

  ///Fetch banners
  Future<void> fetchBanners() async {
    try {
      isLoading.value = true;

      final bannerRepo = Get.put(BannerRepo());
      final banners = await bannerRepo.fetchBanners();
      this.banners.assignAll(banners);
    } catch (e) {
      CustomAlert(
        title: "Error",
        message: e.toString(),
      );
    } finally {
      isLoading.value = false;
    }
  }
}
