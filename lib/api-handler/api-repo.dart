
import 'package:rajishthanapp/api-handler/api-extention.dart';
import 'package:rajishthanapp/constant/api_constants.dart';

import 'api-handler.dart';


class ApiRepository {
  final ApiBaseHelper _apiHelper;
  ApiRepository(this._apiHelper);

  // get images list
  Future getImagesList(paramMap) async {
    return _apiHelper
        .getWithParam(ApiConstant.IMAGES_LIST,paramMap)
        .execute((response) =>  response);
  }



  // get video list
  Future getVideoList(paramMap) async {
    return _apiHelper
        .getWithParam(ApiConstant.VIDEOS_LIST,paramMap)
        .execute((response) =>  response);
  }


  // get video details
  Future getVideoDetails(id) async {
    return _apiHelper
        .getWithoutParams(ApiConstant.VIDEO_DETAILS+id)
        .execute((response) =>  response);
  }

  // get video details
  Future getImagesDetails(id) async {
    return _apiHelper
        .getWithoutParams(ApiConstant.PHOTOS_DETAILS+id)
        .execute((response) =>  response);
  }

}

