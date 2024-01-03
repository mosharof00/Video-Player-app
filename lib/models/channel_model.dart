// To parse this JSON data, do
//
//     final channel = channelFromJson(jsonString);

import 'dart:convert';

ChannelModel channelFromJson(String str) =>
    ChannelModel.fromJson(json.decode(str));

String channelToJson(ChannelModel data) => json.encode(data.toJson());

class ChannelModel {
  Links links;
  int total;
  int page;
  int pageSize;
  List<Result> results;

  ChannelModel({
    required this.links,
    required this.total,
    required this.page,
    required this.pageSize,
    required this.results,
  });

  factory ChannelModel.fromJson(Map<String, dynamic> json) => ChannelModel(
        links: Links.fromJson(json["links"]),
        total: json["total"],
        page: json["page"],
        pageSize: json["page_size"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "links": links.toJson(),
        "total": total,
        "page": page,
        "page_size": pageSize,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Links {
  int next;
  dynamic previous;

  Links({
    required this.next,
    required this.previous,
  });

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        next: json["next"],
        previous: json["previous"],
      );

  Map<String, dynamic> toJson() => {
        "next": next,
        "previous": previous,
      };
}

class Result {
  String thumbnail;
  int id;
  String title;
  DateTime dateAndTime;
  String slug;
  DateTime createdAt;
  String manifest;
  int liveStatus;
  String? liveManifest;
  bool isLive;
  String channelImage;
  ChannelName channelName;
  ChannelUsername? channelUsername;
  bool isVerified;
  ChannelSlug channelSlug;
  String channelSubscriber;
  int channelId;
  Type type;
  String viewers;
  String duration;
  ObjectType objectType;

  Result({
    required this.thumbnail,
    required this.id,
    required this.title,
    required this.dateAndTime,
    required this.slug,
    required this.createdAt,
    required this.manifest,
    required this.liveStatus,
    required this.liveManifest,
    required this.isLive,
    required this.channelImage,
    required this.channelName,
    required this.channelUsername,
    required this.isVerified,
    required this.channelSlug,
    required this.channelSubscriber,
    required this.channelId,
    required this.type,
    required this.viewers,
    required this.duration,
    required this.objectType,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        thumbnail: json["thumbnail"],
        id: json["id"],
        title: json["title"],
        dateAndTime: DateTime.parse(json["date_and_time"]),
        slug: json["slug"],
        createdAt: DateTime.parse(json["created_at"]),
        manifest: json["manifest"],
        liveStatus: json["live_status"],
        liveManifest: json["live_manifest"],
        isLive: json["is_live"],
        channelImage: json["channel_image"],
        channelName: channelNameValues.map[json["channel_name"]]!,
        channelUsername: channelUsernameValues.map[json["channel_username"]],
        isVerified: json["is_verified"],
        channelSlug: channelSlugValues.map[json["channel_slug"]]!,
        channelSubscriber: json["channel_subscriber"],
        channelId: json["channel_id"],
        type: typeValues.map[json["type"]]!,
        viewers: json["viewers"],
        duration: json["duration"],
        objectType: objectTypeValues.map[json["object_type"]]!,
      );

  Map<String, dynamic> toJson() => {
        "thumbnail": thumbnail,
        "id": id,
        "title": title,
        "date_and_time": dateAndTime.toIso8601String(),
        "slug": slug,
        "created_at": createdAt.toIso8601String(),
        "manifest": manifest,
        "live_status": liveStatus,
        "live_manifest": liveManifest,
        "is_live": isLive,
        "channel_image": channelImage,
        "channel_name": channelNameValues.reverse[channelName],
        "channel_username": channelUsernameValues.reverse[channelUsername],
        "is_verified": isVerified,
        "channel_slug": channelSlugValues.reverse[channelSlug],
        "channel_subscriber": channelSubscriber,
        "channel_id": channelId,
        "type": typeValues.reverse[type],
        "viewers": viewers,
        "duration": duration,
        "object_type": objectTypeValues.reverse[objectType],
      };
}

enum ChannelName {
  CHANNEL_NAME_ONE_UMMAH,
  ONE_UMMAH,
  SAKIB_LIVE_TV,
  SAYED_TV_TS
}

final channelNameValues = EnumValues({
  "One Ummah": ChannelName.CHANNEL_NAME_ONE_UMMAH,
  "One Ummah +": ChannelName.ONE_UMMAH,
  "Sakib Live TV": ChannelName.SAKIB_LIVE_TV,
  "Sayed TV TS": ChannelName.SAYED_TV_TS
});

enum ChannelSlug {
  ONE_UMMAH,
  SAKIB_LIVE_TV,
  SAYED_TV_TS,
  TEST_FDF_F_DSFDS_SFSD_SD_SDF
}

final channelSlugValues = EnumValues({
  "one-ummah": ChannelSlug.ONE_UMMAH,
  "sakib-live-tv": ChannelSlug.SAKIB_LIVE_TV,
  "sayed-tv-ts": ChannelSlug.SAYED_TV_TS,
  "test-fdf-f-dsfds-sfsd-sd-sdf": ChannelSlug.TEST_FDF_F_DSFDS_SFSD_SD_SDF
});

enum ChannelUsername { SAKIBLIVETV, SDFSDF1, SDFSDF1_5997 }

final channelUsernameValues = EnumValues({
  "sakiblivetv": ChannelUsername.SAKIBLIVETV,
  "sdfsdf1": ChannelUsername.SDFSDF1,
  "sdfsdf1_5997": ChannelUsername.SDFSDF1_5997
});

enum ObjectType { VIDEO }

final objectTypeValues = EnumValues({"video": ObjectType.VIDEO});

enum Type { NASHEED, OTHERS, TILAWAT, WAZ }

final typeValues = EnumValues({
  "Nasheed": Type.NASHEED,
  "Others": Type.OTHERS,
  "Tilawat": Type.TILAWAT,
  "Waz": Type.WAZ
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
