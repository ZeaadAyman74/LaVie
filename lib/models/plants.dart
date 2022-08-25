class PlantsModel {
  String? type;
  String? message;
  List<Data>? data;

  PlantsModel({this.type, this.message, this.data});

  PlantsModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add( Data.fromJson(v));
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
  dynamic waterCapacity;
  dynamic sunLight;
  dynamic temperature;

  Data(
      {this.productId,
        this.name,
        this.description,
        this.imageUrl,
        this.waterCapacity,
        this.sunLight,
        this.temperature,
        this.quantity=0,
      });

  Data.fromJson(Map<String, dynamic> json) {
    productId = json['plantId'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    waterCapacity = json['waterCapacity'];
    sunLight = json['sunLight'];
    temperature = json['temperature'];
  }

}