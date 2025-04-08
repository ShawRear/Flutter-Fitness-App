class VideoDataModel {
  int? id;
  String? title;
  String? videoUrl;

  VideoDataModel(this.id, this.title, this.videoUrl);

  VideoDataModel.fromjson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    videoUrl = json['videoUrl'];
  }
}
