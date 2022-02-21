import 'package:get/get.dart';
import 'package:rajishthanapp/binding/dashboard_binding.dart';
import 'package:rajishthanapp/binding/favorite_binding.dart';
import 'package:rajishthanapp/binding/home_binding.dart';
import 'package:rajishthanapp/binding/images_binding.dart';
import 'package:rajishthanapp/binding/images_details_binding.dart';
import 'package:rajishthanapp/binding/videos_details_binding.dart';
import 'package:rajishthanapp/view/dashboard/user_dashboard.dart';
import 'package:rajishthanapp/view/favorite/favorite-list.dart';
import 'package:rajishthanapp/view/photos/images-list.dart';
import 'package:rajishthanapp/view/photos/view-image-details.dart';


import 'package:rajishthanapp/view/videos/videos-list.dart';
import 'package:rajishthanapp/view/videos/play-video-view.dart';
 part 'app_routes.dart';

class AppPages {
  AppPages._();
  static const INITIAL = Routes.DASHBOARD;
  static final routes = [
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => DashBoardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.IMAGESLIST,
      page: () => ImagesListView(),
      binding: ImagesBinding(),
    ),
    GetPage(
      name: _Paths.VIEOSLIST,
      page: () => VideoListView(),
      binding: ImagesBinding(),
    ),
    GetPage(
      name: _Paths.FAVORITELIST,
      page: () => FavoriteListView(),
      binding: FavoriteBinding(),
    ),
    GetPage(
      name: _Paths.VIDEOS_DETAILS,
      page: () => PlayVideoView(),
      binding: VideosDetailsBinding(),
    ),
    GetPage(
      name: _Paths.IMAGES_DETAILS,
      page: () => ImagesView(),
      binding: ImagesDetailsBinding(),
    ),
  ];
}
