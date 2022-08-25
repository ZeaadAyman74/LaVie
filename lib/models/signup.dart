class SignUpModel {
  String? type;
  String? message;
   Data? data;

SignUpModel(Map<String,dynamic>json){
  type=json['type'];
  message=json['message'];
  data=Data(json['data']);
}

}
class Data {
  String? accessToken;
  String? refreshToken;
  UserData? user;
  Data(Map<String,dynamic>json) {
    accessToken=json['accessToken'];
    refreshToken=json['refreshToken'];
    user=UserData(json['user']);
  }

}
class UserData {
  String? userId;
  String? firstName;
  String? lastName;
  String? email;
  String? imageUrl;
  String? address;
  String? role;

  UserData(Map<String,dynamic>json){
    userId=json['userId'];
    firstName=json['firstName'];
    lastName=json['lastName'];
    email=json['email'];
    imageUrl=json['imageUrl'];
    address=json['address'];
    role=json['role'];
  }
}