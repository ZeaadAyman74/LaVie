import 'package:flutter/material.dart';
import 'package:orange/layout/cubit/cubit.dart';
import '../../../shared/components/components.dart';

class ProductItem extends StatelessWidget {
  var model;

  ProductItem(this.model, {Key? key}) : super(key: key);

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
                          image: NetworkImage(
                              'https://lavie.orangedigitalcenteregypt.com${model.imageUrl}'),
                          fit: BoxFit.fill),
                    ),
                    height: 130,
                    width: 80,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        AppCubit.get(context).decreaseCartQuantity(model);
                      },
                      child: Container(
                          width: 20,
                          height: 20,
                          decoration: const BoxDecoration(
                              color: Color(0xffF7F6F7),
                              shape: BoxShape.rectangle),
                          child: const Center(
                              child: Text(
                            '-',
                            style: TextStyle(color: Colors.grey),
                          ))),
                    ),
                     Padding(
                      padding: const EdgeInsets.only(right: 10, left: 10),
                      child: Text('${model.quantity}'),
                    ),
                    InkWell(
                      onTap: () {
                        AppCubit.get(context).increaseCartQuantity(model);
                      },
                      child: Container(
                          width: 20,
                          height: 20,
                          decoration: const BoxDecoration(
                              color: Color(0xffF7F6F7),
                              shape: BoxShape.rectangle),
                          child: const Center(
                              child: Text(
                            '+',
                            style: TextStyle(color: Colors.grey),
                          ))),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "${model.name} ${model.type}",
              overflow: TextOverflow.ellipsis,
            ),
            Text('${model.price} EGP'),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.center,
              child: MyButton(
                height: 35,
                width: 145,
                radius: 10,
                function: () {
                  AppCubit.get(context).addToCarts(
                      name: model.name,
                      imageUrl: model.imageUrl,
                      type: model.type,
                      id: model.productId,
                      price: model.price,
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
