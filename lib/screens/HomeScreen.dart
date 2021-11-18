import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_home_app/controllers/HomeScreenController.dart';
import 'package:smart_home_app/utils/AppAssets.dart';
import 'package:smart_home_app/utils/AppSpaces.dart';
import 'package:smart_home_app/widgets/buttons.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenController>(
      init: HomeScreenController(),
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TopSelectButton(),
              AppSpaces.vertical10,
              Expanded(
                child: Row(children: [
                  HomeButton(
                    image: AppAssets.livingroom,
                    text: 'Living Room',
                    isSelected: controller.index == 0,
                    onTap: () => controller.setIndex(0),
                  ),
                  AppSpaces.horizontal20,
                  HomeButton(
                    image: AppAssets.bedroom,
                    text: 'Bedroom',
                    isSelected: controller.index == 1,
                    onTap: () => controller.setIndex(1),
                  ),
                ]),
              ),
              AppSpaces.vertical20,
              Expanded(
                child: Row(children: [
                  HomeButton(
                    image: AppAssets.kitchen,
                    text: 'Kitchen',
                    isSelected: controller.index == 2,
                    onTap: () => controller.setIndex(2),
                  ),
                  AppSpaces.horizontal20,
                  HomeButton(
                    image: AppAssets.bathroom,
                    text: 'Bathroom',
                    isSelected: controller.index == 3,
                    onTap: () => controller.setIndex(3),
                  ),
                ]),
              ),
              AppSpaces.vertical20,
              Expanded(
                child: Row(children: [
                  HomeButton(
                    image: AppAssets.studio,
                    text: 'Studio',
                    isSelected: controller.index == 4,
                    onTap: () => controller.setIndex(4),
                  ),
                  AppSpaces.horizontal20,
                  HomeButton(
                    image: AppAssets.washingroom,
                    text: 'Washing Room',
                    isSelected: controller.index == 5,
                    onTap: () => controller.setIndex(5),
                  ),
                ]),
              ),
            ],
          ),
        );
      },
    );
  }
}
