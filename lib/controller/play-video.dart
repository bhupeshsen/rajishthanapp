import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rajishthanapp/api-handler/api-repo.dart';
import 'package:rajishthanapp/api-handler/api-extention.dart';
import 'package:rajishthanapp/model/videos.dart';
import 'package:video_player/video_player.dart';
class PlayVideoController  extends GetxController{
  RxString videosUrl="".obs;
  TargetPlatform?  platform;
  VideoPlayerController?  videoPlayerController1;
  ChewieController?  chewieController;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    var data = Get.arguments;

    if(data!=null){
      videosUrl.value=data[0];
      print("url ${ videosUrl.value}");
      videoInit(videosUrl.value);
    }
  }

  void videoInit(videoUrl){

    videoPlayerController1 = VideoPlayerController.network(videosUrl.value);
     chewieController = ChewieController(
       showOptions: false,
       materialProgressColors: ChewieProgressColors(handleColor: Color(0xffd08400),backgroundColor: Colors.white,bufferedColor: Colors.white),
      videoPlayerController:  videoPlayerController1!,
      aspectRatio: 3 / 2,
      autoPlay: true,
      looping: true,


    );
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
     videoPlayerController1!.dispose();
    chewieController!.dispose();
  }


}