import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rajishthanapp/controller/play-video.dart';

class PlayVideoView extends StatelessWidget {
  PlayVideoView({Key? key}) : super(key: key);
  PlayVideoController controller = Get.put(PlayVideoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back, color: context.theme.primaryColor),
        ),
        backgroundColor: context.theme.backgroundColor,
        title: Text("Watching Video",
            style: TextStyle(color: context.theme.primaryColor, fontSize: 20)),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Chewie(
                controller: controller.chewieController!,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
