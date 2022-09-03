import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:orange/models/carts_model.dart';
import 'package:orange/layout/cubit/cubit.dart';
import 'package:orange/shared/styles/colors.dart';

// ignore: must_be_immutable
class CartItem extends StatelessWidget {
  CartsModel model;

  CartItem(this.model, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Card(
        elevation: 5,
        shadowColor: Colors.black,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: Card(
                elevation: 1,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    image: DecorationImage(
                        image: model.imageUrl != ""
                            ? NetworkImage(
                                'https://lavie.orangedigitalcenteregypt.com${model.imageUrl}')
                            : const NetworkImage(
                                'https://th.bing.com/th/id/OIP.rPDuoJgIPkGu-9TSDDLfjgHaHa?pid=ImgDet&w=600&h=600&rs=1'),
                        fit: BoxFit.cover),
                  ),
                  height: 160,
                  width: 140,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    '${model.name} ${model.type}',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 18),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    '${model.price} EGP',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 16, color: defaultColor),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                            color: Color(0xffF8F8F8),
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ConstrainedBox(
                              constraints: const BoxConstraints(
                                  maxHeight: 40,
                                  maxWidth: 40,
                                  minHeight: 40,
                                  minWidth: 40),
                              child: TextButton(
                                onPressed: () {
                                  AppCubit.get(context)
                                      .decreaseCartQuantity(model);
                                },
                                child: Text(
                                  '-',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                          color: defaultColor, fontSize: 20),
                                ),
                              ),
                            ),
                            Text('${model.quantity}'),
                            ConstrainedBox(
                              constraints: const BoxConstraints(
                                  maxHeight: 40,
                                  maxWidth: 40,
                                  minHeight: 40,
                                  minWidth: 40),
                              child: TextButton(
                                  onPressed: () {
                                    AppCubit.get(context).increaseCartQuantity(model);
                                  },
                                  child: Text(
                                    '+',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(
                                            color: defaultColor, fontSize: 15),
                                  )),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            AppCubit.get(context).deleteCart(model.productId!);
                          },
                          icon: SvgPicture.asset('assets/icons/delete.svg')),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
