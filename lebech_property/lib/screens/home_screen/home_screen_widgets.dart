import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebech_property/common/constant/app_colors.dart';
import 'package:lebech_property/common/constant/app_images.dart';
import 'package:lebech_property/controllers/home_screen_controller/home_screen_controller.dart';
import 'package:lebech_property/screens/category_property_screen/category_property_screen.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../models/home_screen_model/home_screen_model.dart';

class BannerModule extends StatelessWidget {
  BannerModule({Key? key}) : super(key: key);
  final screenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: screenController.bannerLists.length,
      itemBuilder: (context, index, realIndex) {
        return bannerListTile(index);
      },
      options: CarouselOptions(
          height: 150,
          autoPlay: true,
          viewportFraction: 1,
          onPageChanged: (index, reason) {
            screenController.activeBannerIndex.value = index;
          }),
    );
  }

  Widget bannerListTile(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: NetworkImage(screenController.bannerLists[index].image),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class BannerIndicatorModule extends StatelessWidget {
  BannerIndicatorModule({Key? key}) : super(key: key);
  final screenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          screenController.bannerLists.length,
          (index) => Container(
            margin: const EdgeInsets.all(4),
            width: screenController.activeBannerIndex.value == index ? 14 : 11,
            height: screenController.activeBannerIndex.value == index ? 14 : 11,
            decoration: BoxDecoration(
              color: screenController.activeBannerIndex.value == index
                  ? AppColors.mainColor
                  : Colors.grey.shade400,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}

class NewProjectsModule extends StatelessWidget {
  const NewProjectsModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          _headingTextModule(),
          const SizedBox(height: 10),
          SizedBox(
            child: GridView.builder(
              itemCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, i) {
                return _newProjectsGridTile();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _headingTextModule() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Expanded(
            flex: 20,
            child: Container(),
          ),
          const Expanded(
            flex: 60,
            child: Text(
              'New Projects',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ),
          const Expanded(
            flex: 20,
            child: Text(
              'View All',
              textAlign: TextAlign.end,
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _newProjectsGridTile() {
    return Container(
      padding: const EdgeInsets.all(5),
      child: Material(
        elevation: 10,
        shadowColor: Colors.grey.shade400,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding: const EdgeInsets.only(top: 20, right: 5, left: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.grey,
            //     blurRadius: 3,
            //     spreadRadius: 2,
            //   ),
            // ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  height: 90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: const DecorationImage(
                      image: AssetImage(AppImages.banner1Img),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'RAJHANS SYNFONIA',
                maxLines: 1,
                // overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 14),
              Text(
                'Builder, Vesu',
                style: TextStyle(
                  color: Colors.grey.shade600,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  '2BHK |3BHK |',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              const SizedBox(height: 14),
              GestureDetector(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'More Detail',
                      style: TextStyle(
                        color: AppColors.mainColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(width: 5),
                    Icon(
                      Icons.arrow_forward,
                      color: AppColors.mainColor,
                      size: 20,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}

class VideoGalleryModule extends StatelessWidget {
  VideoGalleryModule({Key? key}) : super(key: key);
  final homeScreenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _heading(),
        const SizedBox(height: 10),
        _primePropertyHeading(),
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            height: 180,
            color: Colors.grey,
            child: YoutubePlayerBuilder(
              player: YoutubePlayer(
                controller: homeScreenController.youtubePlayerController!,
                showVideoProgressIndicator: true,
              ),
              builder: (context, player) {
                return SizedBox(
                  height: 180,
                  child: player,
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _heading() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.mainLightColor,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(10),
      child: const Text(
        'Video Gallery',
        style: TextStyle(color: AppColors.mainDarkColor, fontSize: 16),
      ),
    );
  }

  Widget _primePropertyHeading() {
    return const Text(
      'Prime Property',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25,
      ),
    );
  }
}

class NewListingsModule extends StatelessWidget {
  NewListingsModule({Key? key}) : super(key: key);
  final screenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          const PropertiesTextModule(heading: "Properties"),
          const SizedBox(height: 10),
          _headingTextModule(),
          const SizedBox(height: 10),
          SizedBox(
            child: GridView.builder(
              itemCount: /*screenController.favouriteList.length*/ 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, i) {
                return _newProjectsGridTile(
                    favouriteItem: screenController.favouriteList[i]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _headingTextModule() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Expanded(
            flex: 20,
            child: Container(),
          ),
          const Expanded(
            flex: 60,
            child: Text(
              'New Listings',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ),
          Expanded(
            flex: 20,
            child: GestureDetector(
              onTap: () {
                Get.to(() => CategoryPropertyScreen());
              },
              child: const Text(
                'View All',
                textAlign: TextAlign.end,
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _newProjectsGridTile({required Favourite favouriteItem}) {
    String img = favouriteItem.propertyImages[0].image;
    return Container(
      padding: const EdgeInsets.all(5),
      child: Material(
        elevation: 10,
        shadowColor: Colors.grey.shade400,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding: const EdgeInsets.only(top: 20, right: 5, left: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 90,
                child: favouriteItem.propertyImages.isEmpty
                    ? Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(AppImages.banner1Img)),
                        ),
                      )
                    : Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(image: NetworkImage(img)),
                        ),
                      ),
              ),
              const SizedBox(height: 10),
              const Text(
                'RAJHANS SYNFONIA',
                maxLines: 1,
                // overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 14),
              Text(
                'Builder, Vesu',
                style: TextStyle(
                  color: Colors.grey.shade600,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  '2BHK |3BHK |',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              const SizedBox(height: 14),
              GestureDetector(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'More Detail',
                      style: TextStyle(
                        color: AppColors.mainColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(width: 5),
                    Icon(
                      Icons.arrow_forward,
                      color: AppColors.mainColor,
                      size: 20,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}

class FeaturedPropertiesModule extends StatelessWidget {
  const FeaturedPropertiesModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          const PropertiesTextModule(heading: "Properties"),
          const SizedBox(height: 10),
          _headingTextModule(),
          const SizedBox(height: 10),
          SizedBox(
            child: GridView.builder(
              itemCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, i) {
                return _newProjectsGridTile();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _headingTextModule() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Expanded(
            flex: 20,
            child: Container(),
          ),
          const Expanded(
            flex: 60,
            child: Text(
              'Featured Projects',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ),
          const Expanded(
            flex: 20,
            child: Text(
              'View All',
              textAlign: TextAlign.end,
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _newProjectsGridTile() {
    return Container(
      padding: const EdgeInsets.all(5),
      child: Material(
        elevation: 10,
        shadowColor: Colors.grey.shade400,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding: const EdgeInsets.only(top: 20, right: 5, left: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.grey,
            //     blurRadius: 3,
            //     spreadRadius: 2,
            //   ),
            // ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 90,
                decoration: const BoxDecoration(
                  image:
                      DecorationImage(image: AssetImage(AppImages.banner1Img)),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'RAJHANS SYNFONIA',
                maxLines: 1,
                // overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 14),
              Text(
                'Builder, Vesu',
                style: TextStyle(
                  color: Colors.grey.shade600,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  '2BHK |3BHK |',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              const SizedBox(height: 14),
              GestureDetector(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'More Detail',
                      style: TextStyle(
                        color: AppColors.mainColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(width: 5),
                    Icon(
                      Icons.arrow_forward,
                      color: AppColors.mainColor,
                      size: 20,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}

class FavouritePropertiesModule extends StatelessWidget {
  FavouritePropertiesModule({Key? key}) : super(key: key);
  final screenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          const PropertiesTextModule(heading: "Projects"),
          const SizedBox(height: 10),
          _headingTextModule(),
          const SizedBox(height: 10),
          SizedBox(
            child: GridView.builder(
              itemCount: /*screenController.favouriteList.length*/ 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, i) {
                return _newProjectsGridTile(
                    favouriteItem: screenController.favouriteList[i]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _headingTextModule() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Expanded(
            flex: 20,
            child: Container(),
          ),
          const Expanded(
            flex: 60,
            child: Text(
              'Favourite Projects',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ),
          const Expanded(
            flex: 20,
            child: Text(
              'View All',
              textAlign: TextAlign.end,
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _newProjectsGridTile({required Favourite favouriteItem}) {
    String img = favouriteItem.propertyImages[0].image;
    return Container(
      padding: const EdgeInsets.all(5),
      child: Material(
        elevation: 10,
        shadowColor: Colors.grey.shade400,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding: const EdgeInsets.only(top: 20, right: 5, left: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.grey,
            //     blurRadius: 3,
            //     spreadRadius: 2,
            //   ),
            // ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 90,
                child: favouriteItem.propertyImages.isEmpty
                    ? Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(AppImages.banner1Img)),
                        ),
                      )
                    : Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(image: NetworkImage(img)),
                        ),
                      ),
              ),
              const SizedBox(height: 10),
              Text(
                favouriteItem.title,
                maxLines: 1,
                // overflow: TextOverflow.ellipsis,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 14),
              Text(
                'Builder, Vesu',
                style: TextStyle(
                  color: Colors.grey.shade600,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  '2BHK |3BHK |',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              const SizedBox(height: 14),
              GestureDetector(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'More Detail',
                      style: TextStyle(
                        color: AppColors.mainColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(width: 5),
                    Icon(
                      Icons.arrow_forward,
                      color: AppColors.mainColor,
                      size: 20,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}

class PropertiesTextModule extends StatelessWidget {
  final String heading;

  const PropertiesTextModule({Key? key, required this.heading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.mainLightColor,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(10),
      child: Text(
        heading,
        style: const TextStyle(color: AppColors.mainDarkColor, fontSize: 16),
      ),
    );
  }
}
