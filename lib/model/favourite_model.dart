// To parse this JSON data, do
//
//     final favouriteModel = favouriteModelFromJson(jsonString);

import 'dart:convert';

FavouriteModel favouriteModelFromJson(String str) => FavouriteModel.fromJson(json.decode(str));

String favouriteModelToJson(FavouriteModel data) => json.encode(data.toJson());

class FavouriteModel {
  List<MyPlayer>? myFavoritePlayer;
  List<MyPlayer>? myIdelPlayer;
  String? message;
  bool? status;

  FavouriteModel({
    this.myFavoritePlayer,
    this.myIdelPlayer,
    this.message,
    this.status,
  });

  factory FavouriteModel.fromJson(Map<String, dynamic> json) => FavouriteModel(
    myFavoritePlayer: json["my_favorite_player"] == null ? [] : List<MyPlayer>.from(json["my_favorite_player"]!.map((x) => MyPlayer.fromJson(x))),
    myIdelPlayer: json["my_idel_player"] == null ? [] : List<MyPlayer>.from(json["my_idel_player"]!.map((x) => MyPlayer.fromJson(x))),
    message: json["message"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "my_favorite_player": myFavoritePlayer == null ? [] : List<dynamic>.from(myFavoritePlayer!.map((x) => x.toJson())),
    "my_idel_player": myIdelPlayer == null ? [] : List<dynamic>.from(myIdelPlayer!.map((x) => x.toJson())),
    "message": message,
    "status": status,
  };
}

class MyPlayer {
  int? id;
  String? playerName;
  String? teamName;
  int? totalLike;
  String? teamShortName;
  String? playerImage;

  MyPlayer({
    this.id,
    this.playerName,
    this.teamName,
    this.totalLike,
    this.teamShortName,
    this.playerImage,
  });

  factory MyPlayer.fromJson(Map<String, dynamic> json) => MyPlayer(
    id: json["id"],
    playerName: json["player_name"],
    teamName: json["team_name"],
    totalLike: json["total_like"],
    teamShortName: json["team_short_name"],
    playerImage: json["player_image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "player_name": playerName,
    "team_name": teamName,
    "total_like": totalLike,
    "team_short_name": teamShortName,
    "player_image": playerImage,
  };
}
