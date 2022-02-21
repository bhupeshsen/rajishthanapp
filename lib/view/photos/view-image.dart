import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:pinch_zoom/pinch_zoom.dart';
import 'package:rajishthanapp/controller/images-view.dart';

class ViewImagesView extends StatelessWidget {
  ViewImagesView({Key? key}) : super(key: key);
  ImagesViewController controller = Get.put(ImagesViewController());

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
        title: Text("Images View",
            style: TextStyle(color: context.theme.primaryColor, fontSize: 20)),
      ),
      body: PinchZoom(
        child: CachedNetworkImage(
          imageUrl: controller.imageUrl.value,
          placeholder: (context, url) => Center(
              child: SizedBox(
                  height: 100,
                  width: 100,
                  child: CircularProgressIndicator(
                      valueColor: new AlwaysStoppedAnimation<Color>(
                          context.theme.primaryColor)))),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
        resetDuration: const Duration(milliseconds: 100),
        maxScale: 3.5,
        onZoomStart: () {
          print('Start zooming');
        },
        onZoomEnd: () {
          print('Stop zooming');
        },
      ),
    );
  }
}
