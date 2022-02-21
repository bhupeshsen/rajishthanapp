import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:rajishthanapp/model/videos.dart';
import 'package:rajishthanapp/style/widget-style.dart';

class VideosItem extends StatelessWidget {
  final VideoListModel data;


  final ValueChanged<String>? onPressed;
  final ValueChanged<String>? favoriteUnFavoriteClick;

    VideosItem({Key? key, required this.data, this.onPressed,this.favoriteUnFavoriteClick})
      : super(key: key);
  RxString favValue="0".obs;
  @override
  Widget build(BuildContext context) {
    return data.url != null
        ? InkWell(
      onTap: (){
        onPressed!("");
      },
          child: Container(
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
                          child: data.url != null
                              ? CachedNetworkImage(
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.fill,
                            imageUrl: data.image!,
                            placeholder: (context, url) => Center(child: SizedBox(
                                height: 50,
                                width: 50,
                                child: CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(context.theme.primaryColor)))),
                            errorWidget: (context, url, error) => Icon(Icons.error),
                          )
                              : SizedBox(),
                        ),
                      ),

                      Container(
                        alignment: Alignment.center,
                          margin: EdgeInsets.only(top: 65, left: 0, right: 0),

                          child: Icon(Icons.play_circle_filled,size: 100,color: Colors.white,)),
                     ],
                  ),


                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 25,top: 15,bottom: 0),

                    child: Row(
                      children: [
                        Expanded(child: Padding(
                          padding: const EdgeInsets.only(left: 0,right: 0,top: 0,bottom: 0),

                          child: Row(
                            children: [
                              Icon(Icons.person,color: context.theme.primaryColor,),

                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(

                                  data.user!.name ?? "",

                                  style:Theme.of(context).textTheme.headline5,
                                ),
                              )
                            ],
                          ),
                        )),
                        Row(
                          children: [
                            InkWell(
                                onTap: (){
                                  if(data.favorite.toString()=="0"){

                                    favValue.value="1";
                                    favoriteUnFavoriteClick!("1");
                                  }else{
                                    favValue.value="0";
                                    favoriteUnFavoriteClick!("0");
                                  }
                                },
                                child: Obx((){return favValue.value.isNotEmpty?Icon( data.favorite =="0"?Icons.favorite_border:Icons.favorite,color: context.theme.primaryColor,):SizedBox();})),


                          ],
                        ),

                      ],
                    ),
                  ),

                ],
              ),
            ),
        )
        : SizedBox();
  }
}
