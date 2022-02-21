import 'package:get/get.dart';
import 'package:rajishthanapp/api-handler/api-repo.dart';
import 'package:rajishthanapp/api-handler/api-extention.dart';
import 'package:rajishthanapp/model/images.dart';
class ImagesDetailsController extends GetxController{
  ApiRepository apiRepository;
  ImagesDetailsController(this.apiRepository);
  RxString id = "".obs;
  var isLoading = true.obs;
  Rx<ImagesModel> detailResponse = ImagesModel().obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    var data = Get.arguments;
    if(data!=null){
      id.value = data[0];
      getImagesDetails(id.value);
    }
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();

  }

  void getImagesDetails(id){

    apiRepository.getImagesDetails(id).getResponse<Response<String>>((response) {
     if(response.data!=null){
       isLoading.value=false;
       var resData = ImagesModel.fromJson(response.data);
       detailResponse.value = resData;


     }
    });
  }

}