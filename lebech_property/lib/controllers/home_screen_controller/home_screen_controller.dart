import 'package:get/get.dart';
import 'package:lebech_property/common/constant/app_images.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HomeScreenController extends GetxController {
  RxInt activeBannerIndex = 0.obs;
  RxList<String> bannerLists = RxList();
  YoutubePlayerController? youtubePlayerController;
  String ytUrl = "https://www.youtube.com/watch?v=462shM6Uoeg";

  void runYoutubeVideo() {
    print('runYoutubeVideo Start :::::');
    youtubePlayerController = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(ytUrl)!,
      flags: const YoutubePlayerFlags(
        enableCaption: false,
        isLive: false,
        autoPlay: false,
      ),
    );
    print('runYoutubeVideo End :::::');
  }

  @override
  void onInit() {
    bannerLists = [(AppImages.banner1Img), (AppImages.banner2Img),].obs;
    runYoutubeVideo();
    super.onInit();
  }

  @override
  void dispose() {
    youtubePlayerController!.dispose();
    super.dispose();
  }

}