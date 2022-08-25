class UserModel {
  String? type;
  String? message;
  Data? data;

  UserModel({this.type, this.message, this.data});

  UserModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

}

class Data {
  String? userId;
  String? firstName;
  String? lastName;
  String? email;
  String? imageUrl;
  String? address;
  String? role;
  int? userPoints;
  List<String>? userNotification;

  Data(
      {this.userId,
        this.firstName,
        this.lastName,
        this.email,
        this.imageUrl,
        this.address,
        this.role,
        this.userPoints,
        this.userNotification});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    imageUrl = json['imageUrl'];
    address = json['address'];
    role = json['role'];
    userPoints = json['UserPoints'];
    if (json['UserNotification'] != null) {
      userNotification = <String>[];
      json['UserNotification'].forEach((v) {
        userNotification!.add(v.toString());
      });
    }
  }

}