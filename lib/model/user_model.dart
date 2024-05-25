// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  Data? data;
  bool? status;
  String? message;

  UserModel({
    this.data,
    this.status,
    this.message,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
    "status": status,
    "message": message,
  };
}

class Data {
  int? id;
  dynamic googleId;
  String? nickName;
  String? recommenderName;
  String? email;
  String? countryCode;
  String? country;
  String? timezone;
  int? phone;
  String? type;
  dynamic profileImage;
  int? totalLike;
  int? totalReferralLike;
  int? spentLike;
  int? totalDiamond;
  int? spentDiamond;
  int? totalComment;
  int? level;
  int? idealId;
  DateTime? idealDate;
  dynamic emailVerifiedAt;
  dynamic desc;
  DateTime? lastLogin;
  int? appOpen;
  String? userCode;
  int? referralCodeId;
  int? status;
  int? isBlock;
  int? isDeleted;
  String? createdAt;
  DateTime? updatedAt;
  String? token;

  Data({
    this.id,
    this.googleId,
    this.nickName,
    this.recommenderName,
    this.email,
    this.countryCode,
    this.country,
    this.timezone,
    this.phone,
    this.type,
    this.profileImage,
    this.totalLike,
    this.totalReferralLike,
    this.spentLike,
    this.totalDiamond,
    this.spentDiamond,
    this.totalComment,
    this.level,
    this.idealId,
    this.idealDate,
    this.emailVerifiedAt,
    this.desc,
    this.lastLogin,
    this.appOpen,
    this.userCode,
    this.referralCodeId,
    this.status,
    this.isBlock,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    googleId: json["google_id"],
    nickName: json["nick_name"],
    recommenderName: json["recommender_name"],
    email: json["email"],
    countryCode: json["country_code"],
    country: json["country"],
    timezone: json["timezone"],
    phone: json["phone"],
    type: json["type"],
    profileImage: json["profile_image"],
    totalLike: json["total_like"],
    totalReferralLike: json["total_referral_like"],
    spentLike: json["spent_like"],
    totalDiamond: json["total_diamond"],
    spentDiamond: json["spent_diamond"],
    totalComment: json["total_comment"],
    level: json["level"],
    idealId: json["ideal_id"],
    idealDate: json["ideal_date"] == null ? null : DateTime.parse(json["ideal_date"]),
    emailVerifiedAt: json["email_verified_at"],
    desc: json["desc"],
    lastLogin: json["last_login"] == null ? null : DateTime.parse(json["last_login"]),
    appOpen: json["app_open"],
    userCode: json["user_code"],
    referralCodeId: json["referral_code_id"],
    status: json["status"],
    isBlock: json["is_block"],
    isDeleted: json["is_deleted"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "google_id": googleId,
    "nick_name": nickName,
    "recommender_name": recommenderName,
    "email": email,
    "country_code": countryCode,
    "country": country,
    "timezone": timezone,
    "phone": phone,
    "type": type,
    "profile_image": profileImage,
    "total_like": totalLike,
    "total_referral_like": totalReferralLike,
    "spent_like": spentLike,
    "total_diamond": totalDiamond,
    "spent_diamond": spentDiamond,
    "total_comment": totalComment,
    "level": level,
    "ideal_id": idealId,
    "ideal_date": idealDate?.toIso8601String(),
    "email_verified_at": emailVerifiedAt,
    "desc": desc,
    "last_login": lastLogin?.toIso8601String(),
    "app_open": appOpen,
    "user_code": userCode,
    "referral_code_id": referralCodeId,
    "status": status,
    "is_block": isBlock,
    "is_deleted": isDeleted,
    "created_at": createdAt,
    "updated_at": updatedAt?.toIso8601String(),
    "token": token,
  };
}
