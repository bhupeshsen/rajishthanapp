import 'package:get/get.dart';
import 'package:rajishthanapp/api-handler/api-repo.dart';
import 'package:rajishthanapp/api-handler/api-extention.dart';
import 'package:rajishthanapp/model/videos.dart';
class VideosDetailsController  extends GetxController{
  ApiRepository apiRepository;
  VideosDetailsController(this.apiRepository);

  RxString id = "".obs;
  var isLoading = true.obs;
  Rx<VideoListModel> detailResponse = VideoListModel().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    var data = Get.arguments;
    if(data!=null){
      id.value = data[0];
      getVideosDetails(id.value);
    }
  }


  void getVideosDetails(id){
    apiRepository.getVideoDetails(id).getResponse<Response<String>>((response) {
      if(response.data!=null){
        isLoading.value=false;
        var resData = VideoListModel.fromJson(response.data);
        detailResponse.value = resData;


      }
    });
  }

}