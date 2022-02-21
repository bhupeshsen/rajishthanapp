
import 'package:get/get.dart';
import 'package:rajishthanapp/controller/home_controller.dart';
import 'package:rajishthanapp/controller/images-details.dart';
import 'package:rajishthanapp/controller/images_list_controller.dart';


class ImagesDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ImagesDetailsController>(ImagesDetailsController(Get.find()));
  }
}
