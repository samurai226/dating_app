import 'package:get/get.dart';

import '../controllers/matching_discover_controller.dart';

class MatchingDiscoverBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MatchingDiscoverController>(
      () => MatchingDiscoverController(),
    );
  }
}
