
import 'package:book_verse/utils/models/topbooks_model.dart';
import 'package:book_verse/utils/repository/top_book_repo.dart';
import 'package:get/get.dart';
import '../utils/custom_alert.dart';

class TopBookController extends GetxController {
  static TopBookController get instance => Get.find();
  final isLoading = false.obs;
  //final carouselCurrentIndex = 0.obs;
  RxList<TopBooksModel> fetchBooks = <TopBooksModel>[].obs;
  // final NewBookRepo _booksRepo = Get.find();
  final booksRepo = Get.put(TopBookRepo());

  @override
  void onInit() {
    fetchTopBooks();
    super.onInit();
  } //static BannerController get instance => Get.find();

  ///Fetch books
  Future<void> fetchTopBooks() async {
    try {
      isLoading.value = true;

      //data for top books
      final topBooks = await booksRepo.fetchTopBooks();
     // fetchBooks.assignAll(topBooks);
      fetchBooks.assignAll(topBooks);

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
