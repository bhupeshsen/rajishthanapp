import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rajishthanapp/controller/images_list_controller.dart';
import 'package:rajishthanapp/controller/videos_list_controller.dart';

import 'favorite_controller.dart';

class DashboardController extends GetxController{
  PageController?  pageController;
  RxInt rxIndex= 0.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Get.put(FavoriteController(),permanent: true);
    Get.put(ImagesController(Get.find()));

    Get.put(VideosController(Get.find()));
    pageController = PageController();

  //bottomChange(0);
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();

    pageController!.dispose();
  }

  void bottomChange(index){
      pageController!.jumpToPage(index);
      rxIndex.value = index;

  }

}