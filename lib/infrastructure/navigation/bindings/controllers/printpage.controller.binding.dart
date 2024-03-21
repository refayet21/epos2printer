import 'package:get/get.dart';

import '../../../../presentation/printpage/controllers/printpage.controller.dart';

class PrintpageControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PrintpageController>(
      () => PrintpageController(),
    );
  }
}
