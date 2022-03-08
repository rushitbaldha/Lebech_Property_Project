import 'package:get/get.dart';

import '../../common/constant/app_images.dart';

class PropertyDetailScreenController extends GetxController {
  RxInt activeBannerIndex = 0.obs;
  RxList<String> propertyBannerLists = RxList();

  @override
  void onInit() {
    propertyBannerLists = [
      (AppImages.banner1Img),
      (AppImages.banner2Img),
      (AppImages.banner1Img),
      (AppImages.banner2Img),
    ].obs;
    super.onInit();
  }
}
