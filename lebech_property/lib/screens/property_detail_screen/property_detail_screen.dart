import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/common_widgets.dart';
import '../../controllers/property_detail_screen_controller/property_detail_screen_controller.dart';
import 'property_detail_screen_widgets.dart';

class PropertyDetailScreen extends StatelessWidget {
  PropertyDetailScreen({Key? key}) : super(key: key);
  final propertyDetailScreenController = Get.put(PropertyDetailScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'Property Detail'),

      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ImageSliderModule(),
              const SizedBox(height: 10),
              PropertyDetailsModule(),
              const SizedBox(height: 10),
              FactNumbersModule(),
              const SizedBox(height: 10),
              FactsAndFeaturesModule(),
              const SizedBox(height: 10),
              AmenitiesModule(),
            ],
          ),
        ),
      ),
    );
  }
}
