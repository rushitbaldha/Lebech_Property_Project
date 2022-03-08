import 'package:get/get.dart';
import 'package:lebech_property/common/constant/api_url.dart';
import 'package:lebech_property/common/constant/app_images.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:http/http.dart' as http;


class HomeScreenController extends GetxController {
  RxBool isLoading = false.obs;

  RxInt activeBannerIndex = 0.obs;
  RxList<String> bannerLists = RxList();
  YoutubePlayerController? youtubePlayerController;
  String ytUrl = "https://www.youtube.com/watch?v=462shM6Uoeg";

  void runYoutubeVideo() {
    youtubePlayerController = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(ytUrl)!,
      flags: const YoutubePlayerFlags(
        enableCaption: false,
        isLive: false,
        autoPlay: false,
      ),
    );
  }


  getHomeScreenDataFunction() async {
    isLoading(true);
    String url = ApiUrl.homeScreenApi;
    print('url : $url');

    try{
      http.Response response = await http.post(Uri.parse(url));
      print('response : ${response.body}');
    } catch(e) {
      print('getHomeScreenDataFunction Error1 : $e');
    } finally {
      isLoading(false);
    }

  }

  @override
  void onInit() {
    bannerLists = [(AppImages.banner1Img), (AppImages.banner2Img),].obs;
    runYoutubeVideo();
    getHomeScreenDataFunction();
    super.onInit();
  }

  @override
  void dispose() {
    youtubePlayerController!.dispose();
    super.dispose();
  }

}