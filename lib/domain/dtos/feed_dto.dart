//?lat=51.5&lon=-0.17&page=1
class FeedHeaderParameter {
  double? lat;
  double? lon;
  int? page;

  FeedHeaderParameter({this.page, this.lat, this.lon});

  @override
  String toString() {
    return "?lat=$lat&lon=$lon&page=$page";
  }
}

class FeedItem {
  String? id;
  DateTime? createdAt;
  String? authorId;
  String? placeId;
  String? description;
  String? defaultPhotoUrl;
  PhotoResolutions? defaultPhotoResolutions;
  String? placeholderLogo;
  List<UserTags>? userTags;
  List<Tags>? tags;
  String? authorUsername;
  String? authorFullName;
  bool? authorVerified;
  String? placeName;
  String? placeLocationName;
  String? placeLocationNameO;
  PlaceLocation? placeLocation;
  String? placePrimaryCategory;
  String? categoryDisplayName;
  String? placeLogoUrl;
  String? status;
  int? distance;
  String? authorPhotoUrl;
  List<String>? photoUrls;
  List<PhotoResolutions>? photosResolutions;
  PhotoResolutions? authorPhotosResolutions;
  bool? isLiked;
  bool? isBookmarked;
  bool? isFollowing;
  int? numberOfComments;
  List<Comments>? comments;
  int? numberOfLikes;
  List<Likes>? likes;
  int? numberOfPhotos;
  bool? blackBorder;
  Address? address;
  String? imageSource;
  bool? isGoogleSource;
  bool? dayMode;
  bool? isRecommendation;
  int? score;
  String? ratio;

  FeedItem(
      {this.id,
      this.createdAt,
      this.authorId,
      this.placeId,
      this.description,
      this.defaultPhotoUrl,
      this.defaultPhotoResolutions,
      this.placeholderLogo,
      this.userTags,
      this.tags,
      this.authorUsername,
      this.authorFullName,
      this.authorVerified,
      this.placeName,
      this.placeLocationName,
      this.placeLocationNameO,
      this.placeLocation,
      this.placePrimaryCategory,
      this.categoryDisplayName,
      this.placeLogoUrl,
      this.status,
      this.distance,
      this.authorPhotoUrl,
      this.photoUrls,
      this.photosResolutions,
      this.authorPhotosResolutions,
      this.isLiked,
      this.isBookmarked,
      this.isFollowing,
      this.numberOfComments,
      this.comments,
      this.numberOfLikes,
      this.likes,
      this.numberOfPhotos,
      this.blackBorder,
      this.address,
      this.imageSource,
      this.isGoogleSource,
      this.dayMode,
      this.isRecommendation,
      this.score,
      this.ratio});

  FeedItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'] == null ? null : DateTime.parse(json['createdAt']);
    authorId = json['authorId'];
    placeId = json['placeId'];
    description = json['description'];
    defaultPhotoUrl = json['defaultPhotoUrl'];
    defaultPhotoResolutions = json['defaultPhotoResolutions'] != null ? PhotoResolutions.fromJson(json['defaultPhotoResolutions']) : null;
    placeholderLogo = json['placeholder_logo'];
    if (json['userTags'] != null) {
      userTags = <UserTags>[];
      json['userTags'].forEach((v) {
        userTags!.add(UserTags.fromJson(v));
      });
    }
    if (json['tags_'] != null) {
      tags = <Tags>[];
      json['tags_'].forEach((v) {
        tags!.add(Tags.fromJson(v));
      });
    }
    authorUsername = json['authorUsername'];
    authorFullName = json['authorFullName'];
    authorVerified = json['authorVerified'];
    placeName = json['placeName'];
    placeLocationName = json['placeLocationName'];
    placeLocationNameO = json['placeLocationNameO'];
    placeLocation = json['placeLocation'] != null ? PlaceLocation.fromJson(json['placeLocation']) : null;
    placePrimaryCategory = json['placePrimaryCategory'];
    categoryDisplayName = json['categoryDisplayName'];
    placeLogoUrl = json['placeLogoUrl'];
    status = json['status'];
    distance = json['distance'];
    authorPhotoUrl = json['authorPhotoUrl'];
    photoUrls = json['photoUrls'].cast<String>();
    if (json['photosResolutions'] != null) {
      photosResolutions = <PhotoResolutions>[];
      json['photosResolutions'].forEach((v) {
        photosResolutions!.add(PhotoResolutions.fromJson(v));
      });
    }
    authorPhotosResolutions = json['authorPhotosResolutions'] != null ? PhotoResolutions.fromJson(json['authorPhotosResolutions']) : null;
    isLiked = json['isLiked'];
    isBookmarked = json['isBookmarked'];
    isFollowing = json['isFollowing'];
    numberOfComments = json['numberOfComments'];
    if (json['comments'] != null) {
      comments = <Comments>[];
      json['comments'].forEach((v) {
        comments!.add(Comments.fromJson(v));
      });
    }
    numberOfLikes = json['numberOfLikes'];
    if (json['likes'] != null) {
      likes = <Likes>[];
      json['likes'].forEach((v) {
        likes!.add(Likes.fromJson(v));
      });
    }
    numberOfPhotos = json['numberOfPhotos'];
    blackBorder = json['blackBorder'];
    address = json['address'] != null ? Address.fromJson(json['address']) : null;
    imageSource = json['imageSource'];
    isGoogleSource = json['isGoogleSource'];
    dayMode = json['dayMode'];
    isRecommendation = json['isRecommendation'];
    score = json['score'];
    ratio = json['ratio'];
  }

  static List<FeedItem> listFromJson(List<dynamic>? json) {
    return json == null ? [] : json.map((value) => FeedItem.fromJson(value)).toList();
  }
}

class PhotoResolutions {
  String? original;
  String? large;
  String? medium;
  String? small;
  String? markerWhite;
  String? markerPink;
  bool? isGoogle;

  PhotoResolutions({this.original, this.large, this.medium, this.small, this.markerWhite, this.markerPink, this.isGoogle});

  PhotoResolutions.fromJson(Map<String, dynamic> json) {
    original = json['original'];
    large = json['large'];
    medium = json['medium'];
    small = json['small'];
    markerWhite = json['markerWhite'];
    markerPink = json['markerPink'];
    isGoogle = json['isGoogle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['original'] = this.original;
    data['large'] = this.large;
    data['medium'] = this.medium;
    data['small'] = this.small;
    data['markerWhite'] = this.markerWhite;
    data['markerPink'] = this.markerPink;
    data['isGoogle'] = this.isGoogle;
    return data;
  }
}

class UserTags {
  String? id;
  String? username;

  UserTags({this.id, this.username});

  UserTags.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    return data;
  }
}

class Tags {
  int? id;
  String? name;

  Tags({this.id, this.name});

  Tags.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class PlaceLocation {
  double? latitude;
  double? longitude;

  PlaceLocation({this.latitude, this.longitude});

  PlaceLocation.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}

class Comments {
  String? id;
  String? createdAt;
  String? recommendationId;
  String? parentCommentId;
  String? authorId;
  String? text;
  List<UserTags>? userTags;
  String? authorUsername;
  String? authorPhotoUrl;
  int? numberOfLikes;
  int? numberOfReplies;
  bool? isLiked;
  // Null? replies;

  Comments({
    this.id,
    this.createdAt,
    this.recommendationId,
    this.parentCommentId,
    this.authorId,
    this.text,
    this.userTags,
    this.authorUsername,
    this.authorPhotoUrl,
    this.numberOfLikes,
    this.numberOfReplies,
    this.isLiked,
    // this.replies,
  });

  Comments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];
    recommendationId = json['recommendationId'];
    parentCommentId = json['parentCommentId'];
    authorId = json['authorId'];
    text = json['text'];
    if (json['userTags'] != null) {
      userTags = <UserTags>[];
      json['userTags'].forEach((v) {
        userTags!.add(UserTags.fromJson(v));
      });
    }
    authorUsername = json['authorUsername'];
    authorPhotoUrl = json['authorPhotoUrl'];
    numberOfLikes = json['numberOfLikes'];
    numberOfReplies = json['numberOfReplies'];
    isLiked = json['isLiked'];
    // replies = json['replies'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['createdAt'] = this.createdAt;
    data['recommendationId'] = this.recommendationId;
    data['parentCommentId'] = this.parentCommentId;
    data['authorId'] = this.authorId;
    data['text'] = this.text;
    if (this.userTags != null) {
      data['userTags'] = this.userTags!.map((v) => v.toJson()).toList();
    }
    data['authorUsername'] = this.authorUsername;
    data['authorPhotoUrl'] = this.authorPhotoUrl;
    data['numberOfLikes'] = this.numberOfLikes;
    data['numberOfReplies'] = this.numberOfReplies;
    data['isLiked'] = this.isLiked;
    // data['replies'] = this.replies;
    return data;
  }
}

class Likes {
  String? userId;
  String? entityId;
  String? createdAt;
  String? username;
  String? photoUrl;
  String? firstName;
  String? lastName;
  PhotoResolutions? photoResolutions;

  Likes({this.userId, this.entityId, this.createdAt, this.username, this.photoUrl, this.firstName, this.lastName, this.photoResolutions});

  Likes.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    entityId = json['entityId'];
    createdAt = json['createdAt'];
    username = json['username'];
    photoUrl = json['photoUrl'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    photoResolutions = json['photoResolutions'] != null ? PhotoResolutions.fromJson(json['photoResolutions']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['userId'] = this.userId;
    data['entityId'] = this.entityId;
    data['createdAt'] = this.createdAt;
    data['username'] = this.username;
    data['photoUrl'] = this.photoUrl;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    if (this.photoResolutions != null) {
      data['photoResolutions'] = this.photoResolutions!.toJson();
    }
    return data;
  }
}

class Address {
  String? line1;
  String? area;
  String? city;
  String? postcode;
  String? region;
  String? state;
  String? country;

  Address({this.line1, this.area, this.city, this.postcode, this.region, this.state, this.country});

  Address.fromJson(Map<String, dynamic> json) {
    line1 = json['line1'];
    area = json['area'];
    city = json['city'];
    postcode = json['postcode'];
    region = json['region'];
    state = json['state'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['line1'] = this.line1;
    data['area'] = this.area;
    data['city'] = this.city;
    data['postcode'] = this.postcode;
    data['region'] = this.region;
    data['state'] = this.state;
    data['country'] = this.country;
    return data;
  }
}
