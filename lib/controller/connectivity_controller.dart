import 'package:get/get.dart';
import 'package:connectivity/connectivity.dart';

class ConnectivityController extends GetxController {
  var isConnected = false.obs;

  @override
  void onInit() {
    super.onInit();
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      isConnected.value = result != ConnectivityResult.none;
    });
  }
}
