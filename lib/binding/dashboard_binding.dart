
import 'package:get/get.dart';
import 'package:rajishthanapp/controller/dashboard-controller.dart';
import 'package:rajishthanapp/controller/home_controller.dart';


class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<DashboardController>(DashboardController());
  }
}
