
import 'package:get/get.dart';
import 'package:rajishthanapp/controller/home_controller.dart';
import 'package:rajishthanapp/controller/images_list_controller.dart';
import 'package:rajishthanapp/controller/videos_list_controller.dart';


class VideosBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<VideosController>(VideosController(Get.find()));
  }
}
