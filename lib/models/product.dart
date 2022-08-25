class ProductModel {
  String? type;
  String? message;
  List<Data>? data;

  ProductModel({this.type, this.message, this.data});

  ProductModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((value) {
        data?.add(Data.fromJson(value));
      });
    }
  }
}

class Data {
  String? productId;
  String? name;
  String? description;
  String? imageUrl;
  String? type;
  int quantity=0;
  dynamic price;
  bool? available;
  Tool? tool;

  Data(
      {this.productId,
        this.name,
        this.description,
        this.imageUrl,
        this.type,
        this.price,
        this.quantity=0,
        this.available,
        this.tool});

  Data.fromJson(Map<String, dynamic>? json) {
    productId = json?['productId'];
    name = json?['name'];
    description = json?['description'];
    imageUrl = json?['imageUrl'];
    type = json?['type'];
    price = json?['price'];
    available = json?['available'];
    tool = Tool.fromJson(json?['tool']) ;
  }

}

class Seed {
  String? seedId;
  String? name;
  String? description;
  String? imageUrl;

  Seed({this.seedId, this.name, this.description, this.imageUrl});

  Seed.fromJson(Map<String, dynamic>? json) {
    seedId = json?['seedId'];
    name = json?['name'];
    description = json?['description'];
    imageUrl = json?['imageUrl'];
  }

}

class Plant {
  String? plantId;
  String? name;
  String? description;
  String? imageUrl;
  int? waterCapacity;
  int? sunLight;
  int? temperature;

  Plant(
      {this.plantId,
        this.name,
        this.description,
        this.imageUrl,
        this.waterCapacity,
        this.sunLight,
        this.temperature});

  Plant.fromJson(Map<String, dynamic>? json) {
    plantId = json?['plantId'];
    name = json?['name'];
    description = json?['description'];
    imageUrl = json?['imageUrl'];
    waterCapacity = json?['waterCapacity'];
    sunLight = json?['sunLight'];
    temperature = json?['temperature'];
  }

}

class Tool {
  String? toolId;
  String? name;
  String? description;
  String? imageUrl;

  Tool({this.toolId, this.name, this.description, this.imageUrl});

  Tool.fromJson(Map<String, dynamic>? json) {
    if(json!=null){
      toolId = json['toolId'];
      name = json['name'];
      description = json['description'];
      imageUrl = json['imageUrl'];
    }

  }
}

