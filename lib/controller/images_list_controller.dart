
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rajishthanapp/api-handler/api-repo.dart';
import 'package:rajishthanapp/model/images.dart';
import 'package:rajishthanapp/api-handler/api-extention.dart';
import 'package:rajishthanapp/api-handler/api-repo.dart';

import 'favorite_controller.dart';

class ImagesController extends GetxController {
  ApiRepository apiRepository;
  ImagesController(this.apiRepository);
  RxInt rxIndex= 0.obs;
  var imagesList = List<ImagesModel>.empty(growable: true).obs;
  var isLoading = true.obs;
  FavoriteController favoriteController = Get.find();
  ScrollController scrollController = ScrollController();
  RxInt page = 1.obs;
  var isMoreDataAvailable = true.obs;
  @override
  void onInit() {
    getImagesFirstList();
    super.onInit();

  }
  @override
  void onReady() async {


    super.onReady();
  }

  @override
  void onClose() {
    scrollController.dispose();
  }

  //get all News list
  void getImagesFirstList() {
    isLoading.value=true;
    imagesList.clear();
    page.value=1;
    scrollController = ScrollController();

    Map<String,dynamic> newsParam={
      "query":"god",
      "per_page":10,
      "page":page.value
    };
    apiRepository.getImagesList(newsParam).getResponse<Response<String>>((response) {
      if(response.data['total_results']>0){
        isLoading.value=false;
        List listData=response.data['photos'];
        var parsingList=listData.map((m) => new ImagesModel.fromJson(m)).toList();
        imagesList.addAll(parsingList);
        paginationList();
      }
    });

  }
  //get all News list
  void getImagesList() {



    Map<String,dynamic> newsParam={
      "query":"god",
      "per_page":10,
      "page":page.value
    };
    apiRepository.getImagesList(newsParam).getResponse<Response<String>>((response) {
      if(response.data['total_results']>0){

        isMoreDataAvailable(true);
        List listData=response.data['photos'];
        var parsingList=listData.map((m) => new ImagesModel.fromJson(m)).toList();
        imagesList.addAll(parsingList);
      }
    });

  }


  void paginationList() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {

        page.value++;
        getImagesList();
      }
    });
  }
}
