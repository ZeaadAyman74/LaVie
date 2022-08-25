class FirebaseUserModel {
  String? firstName;
  String? lastName;
  String? email;
  String? uId;

  FirebaseUserModel({
    this.firstName,
    this.lastName,
    this.email,
    this.uId,
  });

  FirebaseUserModel.fromJson(Map<String,dynamic>?json){
    firstName=json?['firstName'];
    lastName=json?['lastName'];
    email=json?['email'];
    uId=json?['uId'];

  }

  Map<String,dynamic> toMap(){
    return {
      'firstName':firstName,
      'lastName':lastName,
      'email':email,
      'uId':uId,
    };
  }
}