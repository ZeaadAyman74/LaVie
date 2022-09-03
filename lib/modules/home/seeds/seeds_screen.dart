import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange/modules/home/seeds/seed_item.dart';
import 'package:orange/layout/cubit/cubit.dart';
import 'package:orange/layout/cubit/states.dart';

import '../../../models/seeds.dart';

class SeedsScreen extends StatelessWidget {
  const SeedsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        SeedsModel? model=AppCubit.get(context).seedsModel;
        List<SeedItem>?dataList=model?.data?.map((element)=>SeedItem(element)).toList();
        return  ConditionalBuilder(
          condition:model!=null ,
          builder:(context)=> CustomScrollView(
            slivers: [
              SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  childAspectRatio: 1/1.4,
                ),
                delegate: SliverChildBuilderDelegate(
                      (context, index)=>dataList![index],
                  childCount: dataList!.length,
                ),
              )
            ],
          ),
          fallback: (context)=>const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
