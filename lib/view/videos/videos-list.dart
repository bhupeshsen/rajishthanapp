
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rajishthanapp/controller/videos_list_controller.dart';
import 'package:rajishthanapp/custom-widget/video-item.dart';
import 'package:rajishthanapp/view/videos/video-details.dart';
import 'package:rajishthanapp/view/videos/play-video-view.dart';

class VideoListView extends GetView<VideosController> {
  const VideoListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Column(
        children:   [

          Expanded(
            child: Obx(() {
              if (controller.isLoading.value)
                return Center(child: CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(context.theme.buttonColor),));
              else {
                return ListView.builder(
                  controller: controller.scrollController,

                  scrollDirection: Axis.vertical,

                  itemCount: controller.videoList.length,
                  itemBuilder: (context, index) {

                    if (index == controller.videoList.length - 1 &&
                        controller.isMoreDataAvailable.value == true) {
                      return   Center(child: CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(context.theme.buttonColor),));
                    }
                    return Obx((){return controller.videoList.value.isNotEmpty ? VideosItem(
                      favoriteUnFavoriteClick: (value){
                        controller.videoList[index].favorite=value;
                        if(value=="0" && controller.favoriteController.videoList.isNotEmpty ){
                          controller.favoriteController.videoList.removeWhere((item) => item.id == controller.videoList[index].id);
                        }else{
                          controller.favoriteController.videoList.add(controller.videoList[index]);
                        }
                      },
                      data: controller.videoList[index],
                      onPressed: (value){

                        Get.to(() => VideoDetailsView() ,arguments: [controller.videoList[index].id.toString()]);

                      },):SizedBox(); });
                  },
                );
              }
            }),
          )

        ],
      ),

    );
  }
}
