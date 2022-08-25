import 'package:flutter/material.dart';

import '../../../shared/components/components.dart';
import '../../../shared/cubit/cubit.dart';
import '../../login/components.dart';
// ignore: must_be_immutable
class ToolItem extends StatelessWidget {
  var model;

  ToolItem(this.model, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: model.imageUrl!="" ? NetworkImage('https://lavie.orangedigitalcenteregypt.com${model.imageUrl}') :
                          const NetworkImage('https://th.bing.com/th/id/OIP.rPDuoJgIPkGu-9TSDDLfjgHaHa?pid=ImgDet&w=600&h=600&rs=1'),
                          fit: BoxFit.cover
                      ),
                    ),
                    height: 130,
                    width: 80,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: (){
                        AppCubit.get(context).decreaseCartQuantity(model);
                      },
                      child: Container(
                          width: 20,
                          height: 20,
                          decoration: const BoxDecoration(
                              color: Color(0xffF7F6F7),
                              shape: BoxShape.rectangle
                          ),
                          child: const Center(child: Text('-',style: TextStyle(color: Colors.grey),))
                      ),
                    ),
                     Padding(
                      padding: EdgeInsets.only(right: 10,left: 10),
                      child: Text('${model.quantity}',style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                    InkWell(
                      onTap: (){
                        AppCubit.get(context).increaseCartQuantity(model);
                      },
                      child: Container(
                          width: 20,
                          height: 20,
                          decoration: const BoxDecoration(
                              color: Color(0xffF7F6F7),
                              shape: BoxShape.rectangle
                          ),
                          child: const Center(child: Text('+',style: TextStyle(color: Colors.grey),))
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 10,),
            Text("${model.name}",style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 18),overflow: TextOverflow.ellipsis,),
            const SizedBox(height: 10,),
            Align(
              alignment: Alignment.center,
              child: MyButton(
                height: 35,
                width: 145,
                radius: 10,
                function: (){
                  AppCubit.get(context).addToCarts(
                      name: model.name,
                      imageUrl: model.imageUrl,
                      type:" ",
                      id: model.productId,
                      price: 500,
                      quantity: model.quantity);
                },
                text: "Add To Cart",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
