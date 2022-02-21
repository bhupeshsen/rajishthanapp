
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rajishthanapp/api-handler/api-repo.dart';
import 'package:rajishthanapp/model/images.dart';
import 'package:rajishthanapp/api-handler/api-extention.dart';
import 'package:rajishthanapp/api-handler/api-repo.dart';
import 'package:rajishthanapp/model/videos.dart';

import 'favorite_controller.dart';

class VideosController extends GetxController {
  ApiRepository apiRepository;
  VideosController(this.apiRepository);
  RxInt rxIndex= 0.obs;
  RxString favUnFav= "0".obs;
  var videoList = List<VideoListModel>.empty(growable: true).obs;
  var isLoading = true.obs;
  FavoriteController favoriteController = Get.find();
  ScrollController scrollController = ScrollController();
  var isMoreDataAvailable = true.obs;
  RxInt page = 1.obs;
  @override
  void onInit() {
    getFirstVideoList();
    super.onInit();

  }
  @override
  void onReady() async {

    super.onReady();
  }

  @override
  void onClose() {}

  //get all News list
  void getFirstVideoList() {
    isLoading.value=true;
    videoList.clear();
    page.value=1;
    scrollController = ScrollController();
    Map<String,dynamic> newsParam={
      "query":"god",
      "per_page":10,
      "page":page.value
    };
    apiRepository.getVideoList(newsParam).getResponse<Response<String>>((response) {
      if(response.data['total_results']>0){
        isLoading.value=false;
        List listData=response.data['videos'];
        var parsingList=listData.map((m) => new VideoListModel.fromJson(m)).toList();
        videoList.addAll(parsingList);

        paginationList();
      }
    });

  }

  //get all News list
  void getVideoList() {


    Map<String,dynamic> newsParam={
      "query":"god",
      "per_page":10,
      "page":page.value
    };
    apiRepository.getVideoList(newsParam).getResponse<Response<String>>((response) {
      if(response.data['total_results']>0){

        isMoreDataAvailable(true);
        List listData=response.data['videos'];
        var parsingList=listData.map((m) => new VideoListModel.fromJson(m)).toList();
        videoList.addAll(parsingList);
      }
    });

  }


  void paginationList() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {

        page.value++;
        getVideoList();
      }
    });
  }
}
