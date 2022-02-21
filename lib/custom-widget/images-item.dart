import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

import 'package:rajishthanapp/model/images.dart';
import 'package:rajishthanapp/style/widget-style.dart';

class ImagesItem extends StatelessWidget {
  final ImagesModel data;
  final ValueChanged<String>? onPressed;
  final ValueChanged<String>? favoriteUnFavoriteClick;
   ImagesItem({Key? key, required this.data, this.onPressed,this.favoriteUnFavoriteClick})
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
                              ?
                          CachedNetworkImage(
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.fill,
                            imageUrl: data.src!.large!,
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
                        height: 60.0,
                        margin: EdgeInsets.only(top: 220, left: 20, right: 20),
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(0),
                        decoration: ContainerStyle.wholeBorderRoundedContainer(
                            color: context.theme.backgroundColor),
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

                                      data.photographer ?? "",

                                      style:Theme.of(context).textTheme.headline5,
                                    ),
                                  )
                                ],
                              ),
                            )),
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
                                child: Obx((){return favValue.value.isNotEmpty ? Icon( data.favorite =="0"?Icons.favorite_border:Icons.favorite,color: context.theme.primaryColor,):SizedBox();})),
                            SizedBox(width: 15,)
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25,right: 25,top: 10,bottom: 0),
                    child: Text(
                      data.alt ?? "",
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
            ),
        )
        : SizedBox();
  }
}
