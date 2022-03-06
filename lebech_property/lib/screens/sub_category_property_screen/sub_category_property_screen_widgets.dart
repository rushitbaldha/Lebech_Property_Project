import 'package:flutter/material.dart';

import '../../common/constant/app_colors.dart';
import '../../common/constant/app_images.dart';

class SubCategoryListTile extends StatelessWidget {
  SubCategoryListTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 35,
          child: _imageModule(),
        ),
        const SizedBox(height: 20),
        Expanded(
          flex: 65,
          child: SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _priceModule(),
                const SizedBox(height: 5),
                _propertyHeadingModule(),
                const SizedBox(height: 5),
                _smallDetailsModule(),
                const SizedBox(height: 5),
                _placeModule(),
                const SizedBox(height: 5),
                _parkingModule(),
                const SizedBox(height: 5),
                _visitModule(),
                const SizedBox(height: 5),
                _propertyDetails(),
                const SizedBox(height: 5),
                // const SizedBox(height: 5),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _imageModule() {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.banner1Img),
          )
      ),
    );
  }

  Widget _priceModule() {
    return const Text(
      '₹ 3.10 CRORE',
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: AppColors.mainColor,
        fontSize: 18,
      ),
    );
  }

  Widget _propertyHeadingModule() {
    return const Text(
      'RAJHANS ROYALTON',
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    );
  }

  Widget _smallDetailsModule() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: const [
        Text(
          '4BHK',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        Text(
          '(₹ per sqr.F)',
          style: TextStyle(color: Colors.grey, fontSize: 15),
        ),
      ],
    );
  }

  Widget _placeModule() {
    return const Text(
      '100% vastu (North West)',
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(color: Colors.grey),
    );
  }

  Widget _parkingModule() {
    return const Text(
      '3 Car Parking',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 15,
        color: Colors.grey,
      ),
    );
  }

  Widget _visitModule() {
    return const Text(
      'Book a Visit | Buy Owner Number',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.grey,
        fontSize: 15,
      ),
    );
  }

  Widget _propertyDetails() {
    return const Text(
      'Luxurious Living',
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 16,
        color: Colors.grey,
      ),
    );
  }


}
