import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rajishthanapp/controller/video-details.dart';
import 'package:rajishthanapp/style/widget-style.dart';
import 'package:rajishthanapp/view/videos/play-video-view.dart';

class VideoDetailsView extends StatelessWidget {
  VideoDetailsView({Key? key}) : super(key: key);

  VideosDetailsController controller =
      Get.put(VideosDetailsController(Get.find()));

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
        title: Text("Video Details",
            style: TextStyle(color: context.theme.primaryColor, fontSize: 20)),
      ),
      body: Obx(() {
        return controller.isLoading.value
            ? Center(
                child: CircularProgressIndicator(
                valueColor: new AlwaysStoppedAnimation<Color>(
                    context.theme.primaryColor),
              ))
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Obx(() {
                      return controller
                              .detailResponse.value.user!.name!.isNotEmpty
                          ? Container(
                              padding: EdgeInsets.only(bottom: 20),
                              width: MediaQuery.of(context).size.width,
                              decoration:
                                  ContainerStyle.wholeBorderRoundedContainer(
                                      color: context.theme.backgroundColor),
                              margin: const EdgeInsets.all(5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        height: 250.0,
                                        child: ClipRRect(
                                          borderRadius: const BorderRadius.only(
                                              bottomRight:
                                                  Radius.circular(20.0),
                                              bottomLeft: Radius.circular(20.0),
                                              topLeft: Radius.circular(20.0),
                                              topRight: Radius.circular(20.0)),
                                          child: controller.detailResponse.value
                                                      .url !=
                                                  null
                                              ? Image.network(
                                                  controller.detailResponse
                                                      .value.image!,
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  fit: BoxFit.fill,
                                                )
                                              : SizedBox(),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20,
                                        right: 25,
                                        top: 15,
                                        bottom: 0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 0,
                                              right: 0,
                                              top: 0,
                                              bottom: 0),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.person,
                                                color:
                                                    context.theme.primaryColor,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                child: Text(
                                                  controller.detailResponse
                                                          .value.user!.name ??
                                                      "",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline5,
                                                ),
                                              )
                                            ],
                                          ),
                                        )),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : SizedBox();
                    }),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        "Videos Size List",
                        style: Theme.of(context).textTheme.headline1,
                      ),
                    ),
                    ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount:
                          controller.detailResponse.value.videoFiles!.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Get.to(() => PlayVideoView(), arguments: [
                              controller
                                  .detailResponse.value.videoFiles![index].link
                            ]);
                          },
                          child: Container(
                            margin: EdgeInsets.all(5),
                            padding: EdgeInsets.all(10),
                            decoration:
                                ContainerStyle.wholeBorderRoundedContainer(
                                    color: context.theme.backgroundColor),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.play_circle_filled,
                                  size: 70,
                                  color: context.theme.primaryColor,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          'Quality : ${controller.detailResponse.value.videoFiles![index].quality ?? ""}',
                                          style: TextStyle(
                                              color: context.theme.primaryColor,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold)),
                                      Text(
                                          'Width : ${controller.detailResponse.value.videoFiles![index].width ?? ""} x height : ${controller.detailResponse.value.videoFiles![index].height ?? ""}',
                                          style: TextStyle(
                                              color: context.theme.primaryColor,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    )
                  ],
                ),
              );
      }),
    );
  }
}
