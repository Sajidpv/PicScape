class UnsplashImageModel {
  int? total;
  int? totalPages;
  List<Results>? results;

  UnsplashImageModel({this.total, this.totalPages, this.results});

  UnsplashImageModel.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    totalPages = json['total_pages'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['total'] = total;
    data['total_pages'] = totalPages;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  String? id;
  String? slug;
  AlternativeSlugs? alternativeSlugs;
  String? createdAt;
  String? updatedAt;
  String? promotedAt;
  int? width;
  int? height;
  String? color;
  String? blurHash;
  String? description;
  String? altDescription;
  List<String>? breadcrumbs;
  Urls? urls;
  Links? links;
  int? likes;
  bool? likedByUser;
  List<String>? currentUserCollections; // Fixed type
  String? sponsorship;
  TopicSubmissions? topicSubmissions;
  String? assetType;
  User? user;

  Results({
    this.id,
    this.slug,
    this.alternativeSlugs,
    this.createdAt,
    this.updatedAt,
    this.promotedAt,
    this.width,
    this.height,
    this.color,
    this.blurHash,
    this.description,
    this.altDescription,
    this.breadcrumbs,
    this.urls,
    this.links,
    this.likes,
    this.likedByUser,
    this.currentUserCollections,
    this.sponsorship,
    this.topicSubmissions,
    this.assetType,
    this.user,
  });

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    alternativeSlugs = json['alternative_slugs'] != null
        ? AlternativeSlugs.fromJson(json['alternative_slugs'])
        : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    promotedAt = json['promoted_at'];
    width = json['width'];
    height = json['height'];
    color = json['color'];
    blurHash = json['blur_hash'];
    description = json['description'];
    altDescription = json['alt_description'];
    breadcrumbs = List<String>.from(json['breadcrumbs']);
    urls = json['urls'] != null ? Urls.fromJson(json['urls']) : null;
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
    likes = json['likes'];
    likedByUser = json['liked_by_user'];
    currentUserCollections =
        List<String>.from(json['current_user_collections'] ?? []); // Fixed type
    sponsorship = json['sponsorship'];
    topicSubmissions = json['topic_submissions'] != null
        ? TopicSubmissions.fromJson(json['topic_submissions'])
        : null;
    assetType = json['asset_type'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['slug'] = slug;
    if (alternativeSlugs != null) {
      data['alternative_slugs'] = alternativeSlugs!.toJson();
    }
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['promoted_at'] = promotedAt;
    data['width'] = width;
    data['height'] = height;
    data['color'] = color;
    data['blur_hash'] = blurHash;
    data['description'] = description;
    data['alt_description'] = altDescription;
    data['breadcrumbs'] = breadcrumbs;
    if (urls != null) {
      data['urls'] = urls!.toJson();
    }
    if (links != null) {
      data['links'] = links!.toJson();
    }
    data['likes'] = likes;
    data['liked_by_user'] = likedByUser;
    if (currentUserCollections != null) {
      data['current_user_collections'] = currentUserCollections;
    }
    data['sponsorship'] = sponsorship;
    if (topicSubmissions != null) {
      data['topic_submissions'] = topicSubmissions!.toJson();
    }
    data['asset_type'] = assetType;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class AlternativeSlugs {
  String? en;
  String? es;
  String? ja;
  String? fr;
  String? it;
  String? ko;
  String? de;
  String? pt;

  AlternativeSlugs(
      {this.en, this.es, this.ja, this.fr, this.it, this.ko, this.de, this.pt});

  AlternativeSlugs.fromJson(Map<String, dynamic> json) {
    en = json['en'];
    es = json['es'];
    ja = json['ja'];
    fr = json['fr'];
    it = json['it'];
    ko = json['ko'];
    de = json['de'];
    pt = json['pt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['en'] = en;
    data['es'] = es;
    data['ja'] = ja;
    data['fr'] = fr;
    data['it'] = it;
    data['ko'] = ko;
    data['de'] = de;
    data['pt'] = pt;
    return data;
  }
}

class Links {
  String? self;
  String? html;
  String? download;
  String? downloadLocation;
  String? photos;
  String? likes;
  String? portfolio;
  String? following;
  String? followers;

  Links(
      {this.self,
      this.html,
      this.download,
      this.downloadLocation,
      this.photos,
      this.likes,
      this.portfolio,
      this.following,
      this.followers});

  Links.fromJson(Map<String, dynamic> json) {
    self = json['self'];
    html = json['html'];
    photos = json['photos'];
    likes = json['likes'];
    download = json['download'];
    downloadLocation = json['download_location'];
    portfolio = json['portfolio'];
    following = json['following'];
    followers = json['followers'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['self'] = self;
    data['html'] = html;
    data['photos'] = photos;
    data['likes'] = likes;
    data['download'] = download;
    data['download_location'] = downloadLocation;
    data['portfolio'] = portfolio;
    data['following'] = following;
    data['followers'] = followers;
    return data;
  }
}

class Urls {
  String? raw;
  String? full;
  String? regular;
  String? small;
  String? thumb;
  String? smallS3;

  Urls(
      {this.raw,
      this.full,
      this.regular,
      this.small,
      this.thumb,
      this.smallS3});

  Urls.fromJson(Map<String, dynamic> json) {
    raw = json['raw'];
    full = json['full'];
    regular = json['regular'];
    small = json['small'];
    thumb = json['thumb'];
    smallS3 = json['small_s3'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['raw'] = raw;
    data['full'] = full;
    data['regular'] = regular;
    data['small'] = small;
    data['thumb'] = thumb;
    data['small_s3'] = smallS3;
    return data;
  }
}

class TopicSubmissions {
  Technology? technology;
  Technology? nature;
  Technology? businessWork;
  Technology? t3dRenders;

  TopicSubmissions(
      {this.technology, this.nature, this.businessWork, this.t3dRenders});

  TopicSubmissions.fromJson(Map<String, dynamic> json) {
    technology = json['technology'] != null
        ? Technology.fromJson(json['technology'])
        : null;
    nature =
        json['nature'] != null ? Technology.fromJson(json['nature']) : null;
    businessWork = json['business-work'] != null
        ? Technology.fromJson(json['business-work'])
        : null;
    t3dRenders = json['3d-renders'] != null
        ? Technology.fromJson(json['3d-renders'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (technology != null) {
      data['technology'] = technology!.toJson();
    }
    if (nature != null) {
      data['nature'] = nature!.toJson();
    }
    if (businessWork != null) {
      data['business-work'] = businessWork!.toJson();
    }
    if (t3dRenders != null) {
      data['3d-renders'] = t3dRenders!.toJson();
    }
    return data;
  }
}

class Technology {
  String? status;
  String? approvedOn;

  Technology({this.status, this.approvedOn});

  Technology.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    approvedOn = json['approved_on'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['status'] = status;
    data['approved_on'] = approvedOn;
    return data;
  }
}

class User {
  String? id;
  String? username;
  String? name;
  String? firstName;
  String? lastName;
  String? twitterUsername;
  String? portfolioUrl;
  String? bio;
  String? location;
  Links? links;
  int? totalLikes;
  int? totalPhotos;
  int? totalCollections;
  int? followedByUser;
  bool? isFollowedByUser;
  ProfileImage? profileImage;
  String? socialMedia;

  User({
    this.id,
    this.username,
    this.name,
    this.firstName,
    this.lastName,
    this.twitterUsername,
    this.portfolioUrl,
    this.bio,
    this.location,
    this.links,
    this.totalLikes,
    this.totalPhotos,
    this.totalCollections,
    this.followedByUser,
    this.isFollowedByUser,
    this.profileImage,
    this.socialMedia,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    name = json['name'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    twitterUsername = json['twitter_username'];
    portfolioUrl = json['portfolio_url'];
    bio = json['bio'];
    location = json['location'];
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
    totalLikes = json['total_likes'];
    totalPhotos = json['total_photos'];
    totalCollections = json['total_collections'];
    followedByUser = json['followed_by_user'];
    isFollowedByUser = json['is_followed_by_user'];
    profileImage = json['profile_image'] != null
        ? new ProfileImage.fromJson(json['profile_image'])
        : null;
    socialMedia = json['social_media'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['username'] = username;
    data['name'] = name;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['twitter_username'] = twitterUsername;
    data['portfolio_url'] = portfolioUrl;
    data['bio'] = bio;
    data['location'] = location;
    data['links'] = links;
    data['total_likes'] = totalLikes;
    data['total_photos'] = totalPhotos;
    data['total_collections'] = totalCollections;
    data['followed_by_user'] = followedByUser;
    data['is_followed_by_user'] = isFollowedByUser;
    if (this.profileImage != null) {
      data['profile_image'] = this.profileImage!.toJson();
    }
    data['social_media'] = socialMedia;
    return data;
  }
}

class ProfileImage {
  String? small;
  String? medium;
  String? large;

  ProfileImage({this.small, this.medium, this.large});

  ProfileImage.fromJson(Map<String, dynamic> json) {
    small = json['small'];
    medium = json['medium'];
    large = json['large'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['small'] = this.small;
    data['medium'] = this.medium;
    data['large'] = this.large;
    return data;
  }
}

class Social {
  String? instagramUsername;
  String? portfolioUrl;
  String? twitterUsername;
  String? paypalEmail;

  Social(
      {this.instagramUsername,
      this.portfolioUrl,
      this.twitterUsername,
      this.paypalEmail});

  Social.fromJson(Map<String, dynamic> json) {
    instagramUsername = json['instagram_username'];
    portfolioUrl = json['portfolio_url'];
    twitterUsername = json['twitter_username'];
    paypalEmail = json['paypal_email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['instagram_username'] = this.instagramUsername;
    data['portfolio_url'] = this.portfolioUrl;
    data['twitter_username'] = this.twitterUsername;
    data['paypal_email'] = this.paypalEmail;
    return data;
  }
}
