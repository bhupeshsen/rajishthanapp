import 'package:get/get.dart';
import 'package:rajishthanapp/api-handler/api-repo.dart';
import 'package:rajishthanapp/api-handler/api-extention.dart';
import 'package:rajishthanapp/model/images.dart';
class ImagesViewController extends GetxController{

  RxString imageUrl="".obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    var data = Get.arguments;
    if(data!=null){
      imageUrl.value=data[0];
    }
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();

  }


}