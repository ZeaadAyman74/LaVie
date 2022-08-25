class CartsModel {
   String? name;
   String? imageUrl;
   String? type;
   String? productId;
  dynamic price;
  int quantity=0;

   CartsModel({this.name, this.imageUrl, this.type, this.price,this.productId,this.quantity=0});

   CartsModel.fromTable(Map<dynamic,dynamic>table){
     name=table['name'];
     imageUrl=table['image'];
     type=table['type'];
     productId=table['productId'];
     price=table['price'];
     quantity=table['quantity'];
   }

   Map<String,dynamic>toMap(){
     return {
       'name':name,
       'image':imageUrl,
       'type':type,
       'productId':productId,
       'price':price,
       'quantity':quantity,
     };
   }
}