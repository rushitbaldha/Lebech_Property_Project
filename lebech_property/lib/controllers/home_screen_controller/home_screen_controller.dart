import 'dart:convert';

import 'package:get/get.dart';
import 'package:lebech_property/common/constant/api_url.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:http/http.dart' as http;
import '../../models/home_screen_model/home_screen_model.dart';


class HomeScreenController extends GetxController {
  RxBool isLoading = false.obs;

  RxInt activeBannerIndex = 0.obs;
  List<Banner> bannerLists = [];
  YoutubePlayerController? youtubePlayerController;
  // String ytUrl = "https://www.youtube.com/watch?v=462shM6Uoeg";

  RxList<Favourite> favouriteList = RxList();
  // RxList<>
  String youtubeLink = "";



  getHomeScreenDataFunction() async {
    isLoading(true);
    String url = ApiUrl.homeScreenApi;
    print('url : $url');

    try{
      http.Response response = await http.post(Uri.parse(url));
      print('response : ${response.body}');

      HomeScreenModel homeScreenModel = HomeScreenModel.fromJson(json.decode(response.body));

      if(homeScreenModel.status == "Success") {
        bannerLists = homeScreenModel.data.banner;
        youtubeLink = homeScreenModel.data.youtube[0].link;
        runYoutubeVideo(ytLink: youtubeLink);
        favouriteList = homeScreenModel.data.favourite.obs;
        print('favouriteList : $favouriteList');
      } else {
        print('getHomeScreenDataFunction Else Else');
      }

    } catch(e) {
      print('getHomeScreenDataFunction Error1 : $e');
    } finally {
      isLoading(false);
    }

  }

  @override
  void onInit() {
    getHomeScreenDataFunction();

    super.onInit();
  }

  @override
  void dispose() {
    youtubePlayerController!.dispose();
    super.dispose();
  }

  /// Get Youtube Video URL
  void runYoutubeVideo({required String ytLink}) {
    youtubePlayerController = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(ytLink)!,
      flags: const YoutubePlayerFlags(
        enableCaption: false,
        isLive: false,
        autoPlay: false,
      ),
    );
  }

}