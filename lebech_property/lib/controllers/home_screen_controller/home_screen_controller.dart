import 'package:get/get.dart';
import 'package:lebech_property/common/constant/app_images.dart';

class HomeScreenController extends GetxController {
  RxInt activeBannerIndex = 0.obs;
  RxList<String> bannerLists = RxList();

  @override
  void onInit() {
    bannerLists = [(AppImages.banner1Img), (AppImages.banner2Img),].obs;
    super.onInit();
  }
}