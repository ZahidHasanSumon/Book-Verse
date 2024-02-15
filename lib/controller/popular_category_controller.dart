import 'package:book_verse/utils/models/newbooks_model.dart';
import 'package:book_verse/utils/repository/popular_category_repo.dart';
import 'package:get/get.dart';
import '../utils/custom_alert.dart';

class PopularCategoryController extends GetxController {
  PopularCategoryController(this.name);
  final String? name;

  static PopularCategoryController get instance => Get.find();
  final isLoading = false.obs;
  RxList<NewBooksModel> fetchBooks = <NewBooksModel>[].obs;
  late final PopularCategoryRepo booksRepo;

  @override
  void onInit() {
    booksRepo = Get.put(PopularCategoryRepo(name));
    fetchAllBooks();
    super.onInit();
  } //static BannerController get instance => Get.find();

  ///Fetch books
  Future<void> fetchAllBooks() async {
    try {
      isLoading.value = true;

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
