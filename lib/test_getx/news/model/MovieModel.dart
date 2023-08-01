import 'dart:convert';

List<MovieModel> movieModelFromJson(String str) =>
    List<MovieModel>.from(json.decode(str).map((x) => MovieModel.fromJson(x)));

String movieModelToJson(List<MovieModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MovieModel {
  MovieModel({
    required this.title,
    required this.shareUrl,
    required this.author,
    required this.itemCover,
    required this.hotValue,
    required this.hotWords,
    required this.playCount,
    required this.diggCount,
    required this.commentCount,
  });

  final String title;
  final String shareUrl;
  final String author;
  final String itemCover;
  final int hotValue;
  final String hotWords;
  final int playCount;
  final int diggCount;
  final int commentCount;

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        title: json["title"],
        shareUrl: json["share_url"],
        author: json["author"],
        itemCover: json["item_cover"],
        hotValue: json["hot_value"],
        hotWords: json["hot_words"],
        playCount: json["play_count"],
        diggCount: json["digg_count"],
        commentCount: json["comment_count"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "share_url": shareUrl,
        "author": author,
        "item_cover": itemCover,
        "hot_value": hotValue,
        "hot_words": hotWords,
        "play_count": playCount,
        "digg_count": diggCount,
        "comment_count": commentCount,
      };
}
