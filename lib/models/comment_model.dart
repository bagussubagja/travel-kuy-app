class CommentModel {
  int? id;
  String? userId;
  int? placeTourismId;
  String? message;
  String? timestamp;
  String? createdAt;

  CommentModel(
      {this.id,
      this.userId,
      this.placeTourismId,
      this.message,
      this.timestamp,
      this.createdAt});

  CommentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    placeTourismId = json['place_tourism_id'];
    message = json['message'];
    timestamp = json['timestamp'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['place_tourism_id'] = placeTourismId;
    data['message'] = message;
    data['timestamp'] = timestamp;
    data['created_at'] = createdAt;
    return data;
  }
}
