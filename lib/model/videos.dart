class VideoListModel {
  int? id;
  int? width;
  int? height;
  int? duration;
  String? fullRes;
  List<String>? tags;
  String? url;
  String? image;
  String? avgColor;
  String? favorite;
  User? user;
  List<VideoFiles>? videoFiles;
  List<VideoPictures>? videoPictures;

  VideoListModel(
      {this.id,
        this.width,
        this.height,
        this.duration,
        this.fullRes,
        this.tags,
        this.url,
        this.image,
        this.avgColor,
        this.user,
        this.videoFiles,
        this.videoPictures});

  VideoListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    width = json['width'];
    height = json['height'];
    duration = json['duration'];
    fullRes = json['full_res'];
    tags = json['tags'].cast<String>();
    url = json['url'];
    image = json['image'];
    favorite = json.containsKey("favorite") ? json['favorite'] : "0" ;
    avgColor = json['avg_color'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    if (json['video_files'] != null) {
      videoFiles = <VideoFiles>[];
      json['video_files'].forEach((v) {
        videoFiles!.add(new VideoFiles.fromJson(v));
      });
    }
    if (json['video_pictures'] != null) {
      videoPictures = <VideoPictures>[];
      json['video_pictures'].forEach((v) {
        videoPictures!.add(new VideoPictures.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['width'] = this.width;
    data['height'] = this.height;
    data['duration'] = this.duration;
    data['full_res'] = this.fullRes;
    data['tags'] = this.tags;
    data['favorite'] = this.favorite;
    data['url'] = this.url;
    data['image'] = this.image;
    data['avg_color'] = this.avgColor;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.videoFiles != null) {
      data['video_files'] = this.videoFiles!.map((v) => v.toJson()).toList();
    }
    if (this.videoPictures != null) {
      data['video_pictures'] =
          this.videoPictures!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? url;

  User({this.id, this.name, this.url});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}

class VideoFiles {
  int? id;
  String? quality;
  String? fileType;
  int? width;
  int? height;
  String? link;

  VideoFiles(
      {this.id,
        this.quality,
        this.fileType,
        this.width,
        this.height,
        this.link});

  VideoFiles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quality = json['quality'];
    fileType = json['file_type'];
    width = json['width'];
    height = json['height'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['quality'] = this.quality;
    data['file_type'] = this.fileType;
    data['width'] = this.width;
    data['height'] = this.height;
    data['link'] = this.link;
    return data;
  }
}

class VideoPictures {
  int? id;
  int? nr;
  String? picture;

  VideoPictures({this.id, this.nr, this.picture});

  VideoPictures.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nr = json['nr'];
    picture = json['picture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nr'] = this.nr;
    data['picture'] = this.picture;
    return data;
  }
}
