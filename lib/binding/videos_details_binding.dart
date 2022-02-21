
import 'package:get/get.dart';
import 'package:rajishthanapp/controller/home_controller.dart';
import 'package:rajishthanapp/controller/images_list_controller.dart';
import 'package:rajishthanapp/controller/video-details.dart';
import 'package:rajishthanapp/controller/videos_list_controller.dart';


class VideosDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<VideosDetailsController>(VideosDetailsController(Get.find()));
  }
}
