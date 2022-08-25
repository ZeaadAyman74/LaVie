import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange/models/product.dart';
import 'package:orange/modules/home/products/product_item.dart';
import 'package:orange/shared/cubit/cubit.dart';
import 'package:orange/shared/cubit/states.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        ProductModel? model=AppCubit.get(context).productModel;
        return  ConditionalBuilder(
          condition:model!=null ,
          builder:(context)=> SingleChildScrollView(
            child: Column(
              children: [
                GridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                    childAspectRatio: 1 / 1.4,
                    children:model!.data!.map((element)=>ProductItem(element)).toList()
                ),
              ],
            ),

          ),
          fallback: (context)=>const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
// model!.data!.products
//     .map((element) => productItemBuilder(element, context))
// .toList(),
