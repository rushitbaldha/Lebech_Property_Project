import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/common_widgets.dart';
import '../../controllers/home_screen_controller/home_screen_controller.dart';
import 'home_screen_widgets.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final homeScreenController = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    // return YoutubePlayerBuilder(
    //   player: YoutubePlayer(
    //     controller: homeScreenController.youtubePlayerController!,
    //     showVideoProgressIndicator: true,
    //   ),
    //
    //   builder: (context, player) {
    //     return Scaffold(
    //       appBar: customAppBar(title: 'Home'),
    //       // drawer: CustomAppDrawer(),
    //
    //       body: Obx(
    //           () => homeScreenController.isLoading.value
    //           ? const Center(child: CircularProgressIndicator())
    //           : Padding(
    //             padding: const EdgeInsets.only(top: 5),
    //             child: SingleChildScrollView(
    //               child: Column(
    //                 children: [
    //                   BannerModule(),
    //                   const SizedBox(height: 5),
    //                   BannerIndicatorModule(),
    //                   const SizedBox(height: 10),
    //                   const NewProjectsModule(),
    //                   const SizedBox(height: 20),
    //                   VideoGalleryModule(player: player),
    //                   const SizedBox(height: 20),
    //                   const NewListingsModule(),
    //                   const SizedBox(height: 20),
    //                   const FeaturedPropertiesModule(),
    //                   const SizedBox(height: 20),
    //                   const FavouritePropertiesModule(),
    //                   const SizedBox(height: 20),
    //                 ],
    //               ),
    //             ),
    //           ),
    //       ),
    //     );
    //   },
    // );
    return Scaffold(
      appBar: customAppBar(title: 'Home'),
      // drawer: CustomAppDrawer(),

      body: Obx(
            () => homeScreenController.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : Padding(
          padding: const EdgeInsets.only(top: 5),
          child: SingleChildScrollView(
            child: Column(
              children: [
                BannerModule(),
                const SizedBox(height: 5),
                BannerIndicatorModule(),
                const SizedBox(height: 10),
                const NewProjectsModule(),
                const SizedBox(height: 20),
                VideoGalleryModule(/*player: player*/),
                const SizedBox(height: 20),
                NewListingsModule(),
                const SizedBox(height: 20),
                const FeaturedPropertiesModule(),
                const SizedBox(height: 20),
                FavouritePropertiesModule(),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
