class SeedsModel {
  String? type;
  String? message;
  List<Data>? data;

  SeedsModel({this.type, this.message, this.data});

  SeedsModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((value) {
        data!.add(Data.fromJson(value));
      });
    }
  }

}

class Data {
  String? productId;
  String? name;
  String? description;
  String? imageUrl;
  int quantity=0;

  Data({this.productId, this.name, this.description, this.imageUrl,this.quantity=0});

  Data.fromJson(Map<String, dynamic> json) {
    productId = json['seedId'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
  }

}