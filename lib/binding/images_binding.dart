
import 'package:get/get.dart';
import 'package:rajishthanapp/controller/home_controller.dart';
import 'package:rajishthanapp/controller/images_list_controller.dart';


class ImagesBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ImagesController>(ImagesController(Get.find()));
  }
}
