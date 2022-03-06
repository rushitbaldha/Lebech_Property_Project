import 'package:flutter/material.dart';

import '../../common/common_widgets.dart';
import 'sub_category_property_screen_widgets.dart';

class SubCategoryPropertyScreen extends StatelessWidget {
  SubCategoryPropertyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'Sub Category Property'),

      body: Container(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          itemCount: 5,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1/2,
          ),
          itemBuilder: (context, i){
            return SubCategoryListTile();
          },
        ),
      ),
    );
  }
}
