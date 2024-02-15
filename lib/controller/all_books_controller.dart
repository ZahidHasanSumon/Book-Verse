import 'package:book_verse/utils/models/newbooks_model.dart';
import 'package:book_verse/utils/repository/all_book_repo.dart';
import 'package:get/get.dart';
import '../utils/custom_alert.dart';

class AllBookController extends GetxController {
  static AllBookController get instance => Get.find();
  final isLoading = false.obs;
  //final carouselCurrentIndex = 0.obs;
  RxList<NewBooksModel> fetchBooks = <NewBooksModel>[].obs;
  RxList<NewBooksModel> fetchBooks1 = <NewBooksModel>[].obs;
  // final NewBookRepo _booksRepo = Get.find();
  final booksRepo = Get.put(AllBookRepo());

  @override
  void onInit() {
    fetchAllBooks();
    super.onInit();
  } //static BannerController get instance => Get.find();

  ///Fetch books
  Future<void> fetchAllBooks() async {
    try {
      isLoading.value = true;
      final data = await booksRepo.fetchAllBooks();
      fetchBooks.assignAll(data);

      // List<NewBooksModel> list = data[0];
      // fetchBooks.assignAll(list);
      //
      // List<NewBooksModel> list1 = data[1];
      // fetchBooks1.assignAll(list1);


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
