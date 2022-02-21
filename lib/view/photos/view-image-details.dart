
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:rajishthanapp/controller/images-details.dart';
import 'package:rajishthanapp/custom-widget/images-item.dart';
import 'package:rajishthanapp/style/widget-style.dart';
import 'package:rajishthanapp/view/photos/view-image.dart';

class ImagesView extends GetView<ImagesDetailsController> {
    ImagesView({Key? key}) : super(key: key);
  ImagesDetailsController controller= Get.put(ImagesDetailsController(Get.find()));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        elevation:0 ,
        leading: IconButton(
          onPressed: (){
            Get.back();
          },
          icon: Icon(Icons.arrow_back,color: context.theme.primaryColor),
        ),
        backgroundColor:context.theme.backgroundColor,
        title: Text("Images Details",style: TextStyle(color: context.theme.primaryColor,fontSize: 20)),
      ),
      body: Obx(() { return  controller.isLoading .value ?  Center(child: CircularProgressIndicator( valueColor: new AlwaysStoppedAnimation<Color>(context.theme.primaryColor),)):Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10,),

          Obx(() { return controller.detailResponse.value.photographer!.isNotEmpty ? Container(
            padding: EdgeInsets.only(bottom: 20),
            width: MediaQuery.of(context).size.width,
            decoration:
            ContainerStyle.wholeBorderRoundedContainer(color: context.theme.backgroundColor),
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
                            bottomRight: Radius.circular(20.0),
                            bottomLeft: Radius.circular(20.0),
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0)),
                        child: controller.detailResponse.value.url != null
                            ? Image.network(
                          controller.detailResponse.value.src!.large!,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.fill,
                        )
                            : SizedBox(),
                      ),
                    ),
                    Container(
                      height: 60.0,
                      margin: EdgeInsets.only(top: 220, left: 20, right: 20),
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(0),
                      decoration: ContainerStyle.wholeBorderRoundedContainer(
                          color: context.theme.backgroundColor,),
                      child: Row(
                        children: [
                          Expanded(child: Padding(
                            padding: const EdgeInsets.only(left: 20,right: 10,top: 10,bottom: 10),

                            child: Row(
                              children: [
                                Icon(Icons.person,color: context.theme.primaryColor,),

                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(

                                    controller.detailResponse.value.photographer ?? "",

                                    style:Theme.of(context).textTheme.headline5,
                                  ),
                                )
                              ],
                            ),
                          )),
                          SizedBox(width: 15,)
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25,right: 25,top: 10,bottom: 0),
                  child: Text(
                    controller.detailResponse.value.alt ?? "",
                    style:Theme.of(context).textTheme.headline1,
                  ),
                ),
                SizedBox(height: 5,),
                Padding(
                  padding: const EdgeInsets.only(left: 20,right: 25,top: 0,bottom: 0),

                  child: Row(
                    children: [
                      Icon(Icons.location_on_outlined,size:20,color: Colors.grey,),

                      Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Text(

                          "Jaipur",

                          style:Theme.of(context).textTheme.headline4,
                        ),
                      ),


                    ],
                  ),
                ),

              ],
            ),
          ):SizedBox(); }),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text( "Image Size",

              style:Theme.of(context).textTheme.headline1,
            ),
          ),
          Wrap(
            children: [
              InkWell(
                onTap: (){
                  Get.to(() => ViewImagesView(),arguments: [controller.detailResponse.value.src!.original]);
                },
                child: Container(

                  margin: EdgeInsets.all(5),

                  padding: EdgeInsets.all(10),
                  decoration: ContainerStyle.wholeBorderRoundedContainer(
                      color: context.theme.backgroundColor,),
                  child:  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text( "Original",

                      style:Theme.of(context).textTheme.headline5,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  Get.to(() => ViewImagesView(),arguments: [controller.detailResponse.value.src!.large2x]);
                },
                child: Container(

                  margin: EdgeInsets.all(5),

                  padding: EdgeInsets.all(10),
                  decoration: ContainerStyle.wholeBorderRoundedContainer(
                      color:context.theme.backgroundColor,),
                  child:  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text( "Large2x",

                      style:Theme.of(context).textTheme.headline5,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  Get.to(() => ViewImagesView(),arguments: [controller.detailResponse.value.src!.original]);
                },
                child: Container(
                  margin: EdgeInsets.all(5),


                  padding: EdgeInsets.all(10),
                  decoration: ContainerStyle.wholeBorderRoundedContainer(
                      color: context.theme.backgroundColor,),
                  child:  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text( "Large",

                      style:Theme.of(context).textTheme.headline5,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  Get.to(() => ViewImagesView(),arguments: [controller.detailResponse.value.src!.medium]);
                },
                child: Container(
                  margin: EdgeInsets.all(5),


                  padding: EdgeInsets.all(10),
                  decoration: ContainerStyle.wholeBorderRoundedContainer(
                      color: context.theme.backgroundColor,),
                  child:  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text( "Medium",

                      style:Theme.of(context).textTheme.headline5,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  Get.to(() => ViewImagesView(),arguments: [controller.detailResponse.value.src!.small]);
                },
                child: Container(
                  margin: EdgeInsets.all(5),


                  padding: EdgeInsets.all(10),
                  decoration: ContainerStyle.wholeBorderRoundedContainer(
                      color: context.theme.backgroundColor,),
                  child:  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text( "Small",

                      style:Theme.of(context).textTheme.headline5,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  Get.to(() => ViewImagesView(),arguments: [controller.detailResponse.value.src!.portrait]);
                },
                child: Container(
                  margin: EdgeInsets.all(5),


                  padding: EdgeInsets.all(10),
                  decoration: ContainerStyle.wholeBorderRoundedContainer(
                      color: context.theme.backgroundColor,),
                  child:  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text( "Portrait",

                      style:Theme.of(context).textTheme.headline5,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  Get.to(() => ViewImagesView(),arguments: [controller.detailResponse.value.src!.landscape]);
                },
                child: Container(


                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(10),
                  decoration: ContainerStyle.wholeBorderRoundedContainer(
                      color: context.theme.backgroundColor,),
                  child:  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text( "Landscape",

                      style:Theme.of(context).textTheme.headline5,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  Get.to(() => ViewImagesView(),arguments: [controller.detailResponse.value.src!.tiny]);
                },
                child: Container(

                  margin: EdgeInsets.all(5),

                  padding: EdgeInsets.all(10),
                  decoration: ContainerStyle.wholeBorderRoundedContainer(
                      color: context.theme.backgroundColor,),
                  child:  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text( "Tiny",

                      style:Theme.of(context).textTheme.headline5,
                    ),
                  ),
                ),
              ),
            ],
          )

        ],
      );}),
    );
  }
}
