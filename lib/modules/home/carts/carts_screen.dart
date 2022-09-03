import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:orange/modules/home/carts/cart_item.dart';
import 'package:orange/layout/cubit/cubit.dart';
import 'package:orange/layout/cubit/states.dart';
import 'package:orange/shared/styles/colors.dart';
import '../../../shared/components/components.dart';

class CartsScreen extends StatelessWidget {
  const CartsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          backgroundColor: const Color(0xFFFBFBFD).withOpacity(1),
          appBar: AppBar(
            title:Text("My Cart",style: Theme.of(context).textTheme.subtitle1),
            centerTitle: true,
            backgroundColor: const Color(0xFFFBFBFD),
            // leading:  ImageIcon(const AssetImage('assets/icons/back.svg')),
          ),
          body: ConditionalBuilder(
            condition: (state is! GetCartsLoadingState) ,
            builder:(context){
              if(cubit.carts.isNotEmpty) {
                return Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(15, 25, 15, 0),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) => CartItem(cubit.carts[index]),
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 20,
                        ),
                        itemCount: cubit.carts.length,
                      ),
                      const SizedBox(height: 100,),
                      Padding(
                        padding: const EdgeInsets.all(25),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Total",
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1,
                                ),
                                Text(
                                  "180,000",
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .copyWith(color: defaultColor),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(bottom: 15,top: 20),
                              child: MyButton(
                                  height: 50,
                                  width: double.infinity,
                                  radius: 10,
                                  function: (){},
                                  text: "Checkout "),
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
              ),
                );
              }else{
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/images/carts_empty.svg'),
                      const SizedBox(height: 10,),
                       Text('Your cart is empty',style: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.bold),),
                    ],
                  ),
                );
              }

            },
            fallback:(context)=>const Center(child: CircularProgressIndicator(),) ,
          ),
        );
      },
    );
  }
}
