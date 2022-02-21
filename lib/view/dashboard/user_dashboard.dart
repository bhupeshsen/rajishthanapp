import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rajishthanapp/constant/string_constants.dart';
import 'package:rajishthanapp/controller/dashboard-controller.dart';
import 'package:rajishthanapp/theme/theme_service.dart';
import 'package:rajishthanapp/view/favorite/favorite-list.dart';
import 'package:rajishthanapp/view/photos/images-list.dart';
import 'package:rajishthanapp/view/videos/videos-list.dart';

import '../about-me.dart';

class DashBoardView extends GetView<DashboardController> {
  const DashBoardView({Key? key}) : super(key: key);

  Future<bool> onWillPop(context) async {
    Navigator.of(context).pop();
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        titleSpacing: 0,
        title: Text(
          "Home",
          style: TextStyle(color: context.theme.primaryColor, fontSize: 20),
        ),
        leading: Icon(
          Icons.menu_rounded,
          color: context.theme.primaryColor,
        ),
        elevation: 0,
        backgroundColor: context.theme.backgroundColor,
        actions: [
          IconButton(
              onPressed: () {
                ThemeService().switchTheme();
              },
              icon: Icon(
                Icons.wb_sunny,
                color: context.theme.primaryColor,
              )),
        ],
      ),
      body: WillPopScope(
        onWillPop: () => onWillPop(context),
        child: SizedBox.expand(
          child: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: controller.pageController,
            onPageChanged: (index) {
              controller.bottomChange(index);
            },
            children: const <Widget>[
              ImagesListView(),
              VideoListView(),
              FavoriteListView(),
              AboutMeView(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Obx(() {
        return Theme(
          data: Theme.of(context).copyWith(
              // sets the background color of the `BottomNavigationBar`
              canvasColor: Colors.white,
              // sets the active color of the `BottomNavigationBar` if `Brightness` is light
              primaryColor: Colors.red,
              textTheme: Theme.of(context)
                  .textTheme
                  .copyWith(caption: new TextStyle(color: Colors.yellow))),
          // sets the inactive color of the `BottomNavigationBar`

          child: BottomNavigationBar(
            backgroundColor: context.theme.primaryColor,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.photo_camera_back,
                    color: controller.rxIndex.value == 0
                        ? context.theme.buttonColor
                        : Colors.black,
                  ),
                  title: Text(
                    'Images',
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: context.theme.buttonColor),
                  )),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.video_call_outlined,
                    color: controller.rxIndex.value == 1
                        ? context.theme.buttonColor
                        : Colors.black,
                  ),
                  title: Text('Videos',
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          color: context.theme.buttonColor))),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.favorite_border,
                    color: controller.rxIndex.value == 2
                        ? context.theme.buttonColor
                        : Colors.black,
                  ),
                  title: Text('Favorite',
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          color: context.theme.buttonColor))),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.info_outline,
                    color: controller.rxIndex.value == 3
                        ? context.theme.buttonColor
                        : Colors.black,
                  ),
                  title: Text('Profile',
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          color: context.theme.buttonColor))),
            ],
            currentIndex: controller.rxIndex.value,
            fixedColor: context.theme.primaryColor,
            onTap: (index) {
              controller.bottomChange(index);
            },
          ),
        );
      }),
    );
  }
}
