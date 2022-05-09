import 'dart:convert';

List<RatingResponse> ratingResponseFromJson(List<dynamic> list) =>
    List<RatingResponse>.from(list.map((x) => RatingResponse.fromJson(x)));

String ratingResponseToJson(List<RatingResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RatingResponse {
  RatingResponse({
    this.id,
    this.objectId,
    this.serviceId,
    this.userId,
    this.vote,
    this.rComment,
    this.userName,
    this.photos,
    this.publish,
    this.rtype,
    this.status,
    this.replyId,
    this.replyName,
    this.replyComment,
    this.replyPublish,
  });

  int? id;
  int? objectId;
  int? serviceId;
  int? userId;
  int? vote;
  String? rComment;
  String? userName;
  List<String>? photos;
  bool? publish;
  String? rtype;
  String? status;
  dynamic? replyId;
  dynamic? replyName;
  dynamic? replyComment;
  dynamic? replyPublish;

  factory RatingResponse.fromJson(Map<String, dynamic> json) => RatingResponse(
        id: json["id"],
        objectId: json["object_id"],
        serviceId: json["service_id"],
        userId: json["user_id"],
        vote: json["vote"],
        rComment: json["r_comment"],
        userName: json["user_name"],
        photos: List<String>.from(json["photos"].map((x) => x)),
        publish: json["publish"],
        rtype: json["rtype"],
        status: json["status"],
        replyId: json["reply_id"],
        replyName: json["reply_name"],
        replyComment: json["reply_comment"],
        replyPublish: json["reply_publish"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "object_id": objectId,
        "service_id": serviceId,
        "user_id": userId,
        "vote": vote,
        "r_comment": rComment,
        "user_name": userName,
        "photos": List<dynamic>.from(photos!.map((x) => x)),
        "publish": publish,
        "rtype": rtype,
        "status": status,
        "reply_id": replyId,
        "reply_name": replyName,
        "reply_comment": replyComment,
        "reply_publish": replyPublish,
      };
}
