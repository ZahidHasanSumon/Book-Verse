import 'package:book_verse/utils/models/newbooks_model.dart';
import 'package:book_verse/utils/repository/new_book_repo.dart';
import 'package:get/get.dart';
import '../utils/custom_alert.dart';

class NewBookController extends GetxController {
  static NewBookController get instance => Get.find();
  final isLoading = false.obs;
  //final carouselCurrentIndex = 0.obs;
  RxList<NewBooksModel> fetchBooks = <NewBooksModel>[].obs;
 // final NewBookRepo _booksRepo = Get.find();
  final booksRepo = Get.put(NewBookRepo());

  @override
  void onInit() {
    fetchAllBooks();
    super.onInit();
  } //static BannerController get instance => Get.find();

  // void updatePageIndicator(index) {
  //   carouselCurrentIndex.value = index;
  // }

  ///Fetch banners
  Future<void> fetchAllBooks() async {
    try {
      isLoading.value = true;

    //  final booksRepo = Get.put(NewBookRepo());
      final data = await booksRepo.fetchNewBooks();
      fetchBooks.assignAll(data);
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
