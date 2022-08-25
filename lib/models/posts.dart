class PostModel {
  String? type;
  String? message;
  List<Data>? data;

  PostModel({this.type, this.message, this.data});

  PostModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }

}

class Data {
  String? forumId;
  String? title;
  String? description;
  String? imageUrl;
  String? userId;
  List<ForumLikes>? forumLikes;
  List<ForumComments>? forumComments;
  User? user;

  Data(
      {this.forumId,
        this.title,
        this.description,
        this.imageUrl,
        this.userId,
        this.forumLikes,
        this.forumComments,
        this.user});

  Data.fromJson(Map<String, dynamic> json) {
    forumId = json['forumId'];
    title = json['title'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    userId = json['userId'];
    if (json['ForumLikes'] != null) {
      forumLikes = <ForumLikes>[];
      json['ForumLikes'].forEach((v) {
        forumLikes?.add(ForumLikes.fromJson(v));
      });
    }
    if (json['ForumComments'] != null) {
      forumComments = <ForumComments>[];
      json['ForumComments'].forEach((v) {
        forumComments?.add(ForumComments.fromJson(v));
      });
    }
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

}

class ForumLikes {
  String? forumId;
  String? userId;

  ForumLikes({this.forumId, this.userId});

  ForumLikes.fromJson(Map<String, dynamic> json) {
    forumId = json['forumId'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['forumId'] = forumId;
    data['userId'] = userId;
    return data;
  }
}

class ForumComments {
  String? forumCommentId;
  String? forumId;
  String? userId;
  String? comment;
  String? createdAt;

  ForumComments(
      {this.forumCommentId,
        this.forumId,
        this.userId,
        this.comment,
        this.createdAt});

  ForumComments.fromJson(Map<String, dynamic> json) {
    forumCommentId = json['forumCommentId'];
    forumId = json['forumId'];
    userId = json['userId'];
    comment = json['comment'];
    createdAt = json['createdAt'];
  }

}

class User {
  String? firstName;
  String? lastName;
  String? imageUrl;

  User({this.firstName, this.lastName, this.imageUrl});

  User.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    imageUrl = json['imageUrl'];
  }

}