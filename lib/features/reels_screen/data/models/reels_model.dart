class GetReelsModel {
  List<Datum> data;
  Links links;
  Meta meta;
  String status;
  dynamic message;

  GetReelsModel({
    required this.data,
    required this.links,
    required this.meta,
    required this.status,
    required this.message,
  });

  factory GetReelsModel.fromJson(Map<String, dynamic> json) => GetReelsModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        links: Links.fromJson(json["links"]),
        meta: Meta.fromJson(json["meta"]),
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "links": links.toJson(),
        "meta": meta.toJson(),
        "status": status,
        "message": message,
      };
}

class Datum {
  int id;
  bool isMine;
  int roomId;
  String video;
  String preview;
  String size;
  String duration;
  int likesCount;
  String likesCountTranslated;
  bool authLikeStatus;

  Datum({
    required this.id,
    required this.isMine,
    required this.roomId,
    required this.video,
    required this.preview,
    required this.size,
    required this.duration,
    required this.likesCount,
    required this.likesCountTranslated,
    required this.authLikeStatus,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        isMine: json["is_mine"],
        roomId: json["room_id"],
        video: json["video"],
        preview: json["preview"],
        size: json["size"],
        duration: json["duration"],
        likesCount: json["likes_count"],
        likesCountTranslated: json["likes_count_translated"],
        authLikeStatus: json["auth_like_status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "is_mine": isMine,
        "room_id": roomId,
        "video": video,
        "preview": preview,
        "size": size,
        "duration": duration,
        "likes_count": likesCount,
        "likes_count_translated": likesCountTranslated,
        "auth_like_status": authLikeStatus,
      };
}

class Links {
  String first;
  String last;
  dynamic prev;
  String next;

  Links({
    required this.first,
    required this.last,
    required this.prev,
    required this.next,
  });

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        first: json["first"],
        last: json["last"],
        prev: json["prev"],
        next: json["next"],
      );

  Map<String, dynamic> toJson() => {
        "first": first,
        "last": last,
        "prev": prev,
        "next": next,
      };
}

class Meta {
  int currentPage;
  int from;
  int lastPage;
  List<Link> links;
  String path;
  int perPage;
  int to;
  int total;

  Meta({
    required this.currentPage,
    required this.from,
    required this.lastPage,
    required this.links,
    required this.path,
    required this.perPage,
    required this.to,
    required this.total,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        currentPage: json["current_page"],
        from: json["from"],
        lastPage: json["last_page"],
        links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        path: json["path"],
        perPage: json["per_page"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "from": from,
        "last_page": lastPage,
        "links": List<dynamic>.from(links.map((x) => x.toJson())),
        "path": path,
        "per_page": perPage,
        "to": to,
        "total": total,
      };
}

class Link {
  String? url;
  String label;
  bool active;

  Link({
    required this.url,
    required this.label,
    required this.active,
  });

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"],
        label: json["label"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "label": label,
        "active": active,
      };
}
