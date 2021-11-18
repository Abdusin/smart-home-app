import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_home_app/controllers/BottomNavigationController.dart';
import 'package:smart_home_app/screens/HomeScreen.dart';
import 'package:smart_home_app/screens/LightsScreen.dart';
import 'package:smart_home_app/screens/TempatureScreen.dart';

class BottomNavigationScreen extends StatelessWidget {
  const BottomNavigationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavigationController>(
        init: BottomNavigationController(),
        builder: (controller) {
          return SafeArea(
            child: Scaffold(
              body: IndexedStack(
                index: 0,
                children: [
                  [
                    HomeScreen(),
                    TempatureScreen(),
                    LightsScreen(),
                    HomeScreen(),
                  ][controller.index]
                ],
              ),
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: controller.index,
                onTap: controller.setIndex,
                selectedLabelStyle: TextStyle(fontSize: 1),
                selectedItemColor: Colors.black,
                unselectedItemColor: Colors.grey,
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.verified_user),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.signal_cellular_alt),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: '',
                  ),
                ],
              ),
            ),
          );
        });
  }
}
