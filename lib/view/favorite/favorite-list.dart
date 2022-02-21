
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rajishthanapp/controller/favorite_controller.dart';
import 'package:rajishthanapp/custom-widget/images-item.dart';
import 'package:rajishthanapp/custom-widget/video-item.dart';
import 'package:rajishthanapp/helper/sliding-segment-controller.dart';
import 'package:rajishthanapp/view/photos/view-image-details.dart';
import 'package:rajishthanapp/view/videos/video-details.dart';

class FavoriteListView extends GetView<FavoriteController> {
  const FavoriteListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children:   [
            Obx(() {
              return Center(
                child:Container(
                  margin: EdgeInsets.all(10),
                  child: CupertinoSlidingSegmentedControl(
                      padding: EdgeInsets.all(4),
                      groupValue: controller.rxIndex.value,
                      thumbColor:context.theme.primaryColor.withOpacity(0.1),
                      backgroundColor:  context.theme.buttonColor,
                      children: <int, Widget>{
                        0: Container(

                          padding: const EdgeInsets.all(0),
                          child: const Text(
                            'Images',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 14),
                          ),
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          alignment: Alignment.center,
                        ),
                        1: Container(
                          height: 50,
                          padding: const EdgeInsets.all(0),
                          child: const Text(
                            'Videos',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 14),
                          ),
                          width: MediaQuery.of(context).size.width,
                          alignment: Alignment.center,
                        )
                      },
                      onValueChanged: (value) {
                        controller.changeSegment(value);
                        if (controller.rxIndex.value == 0) {

                        } else {

                        }
                      }),
                ),
              );
            }),
            Obx((){return controller.rxIndex.value == 0 ? controller.imagesList.value.isNotEmpty?
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: controller.imagesList.length,
              itemBuilder: (context, index) {
                return Obx((){return controller.imagesList.value.isNotEmpty ? ImagesItem(
                  data: controller.imagesList[index],
                  favoriteUnFavoriteClick: (value){

                  },
                  onPressed: (value){
                    Get.to(() => ImagesView() ,arguments: [controller.imagesList[index].id.toString()]);


                  },):SizedBox();});
              },
            ):Column(
              children: [
                Text(" Favorite images list is empty ",style:Theme.of(context).textTheme.headline1,)
              ],
            ):
            controller.videoList.value.isNotEmpty ?
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: controller.videoList.length,
              itemBuilder: (context, index) {
                return Obx((){return controller.videoList.value.isNotEmpty ? VideosItem(
                  data: controller.videoList[index],
                  favoriteUnFavoriteClick: (value){

                  },
                  onPressed: (value){
                    Get.to(() => VideoDetailsView() ,arguments: [controller.videoList[index].id.toString()]);


                  },):SizedBox();});
              },
            ): Column(
              children: [
                Text(" Favorite video list is empty ",style:Theme.of(context).textTheme.headline1,)
              ],
            );})
          ],
        ),
      ),
    );
  }
}
