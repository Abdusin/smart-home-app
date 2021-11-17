import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:smart_home_app/controllers/HomeScreenController.dart';
import 'package:smart_home_app/utils/AppAssets.dart';
import 'package:smart_home_app/utils/AppSpaces.dart';

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
              DropdownButton<String>(
                items: [
                  DropdownMenuItem<String>(
                    child: Text('All Rooms', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    value: 'All Rooms',
                  ),
                  DropdownMenuItem<String>(
                    child: Text('Living Room'),
                    value: 'Living Room',
                  ),
                ],
                value: 'All Rooms',
                icon: Icon(Icons.expand_more_outlined),
                underline: SizedBox.shrink(),
                onChanged: (value) {},
              ),
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

class HomeButton extends StatelessWidget {
  const HomeButton({
    Key? key,
    required this.image,
    required this.text,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);
  final String image;
  final String text;
  final bool isSelected;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: isSelected
                ? LinearGradient(
                    colors: [
                      Get.theme.primaryColor,
                      Get.theme.colorScheme.secondary,
                    ],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  )
                : null,
            color: !isSelected ? Get.theme.backgroundColor : null,
          ),
          child: Column(children: [
            AppSpaces.vertical15,
            Expanded(
              child: Center(
                child: Container(
                  width: Get.width / 5,
                  height: Get.height / 10,
                  child: Image.asset(
                    image,
                    color: isSelected ? Colors.white : Get.theme.primaryColor,
                  ),
                ),
              ),
            ),
            AppSpaces.vertical15,
            Text(
              text,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontSize: 18,
              ),
            ),
            AppSpaces.vertical15,
          ]),
        ),
      ),
    );
  }
}
