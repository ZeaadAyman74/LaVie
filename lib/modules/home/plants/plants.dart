import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange/models/plants.dart';
import 'package:orange/modules/home/plants/plant_item.dart';
import 'package:orange/layout/cubit/cubit.dart';
import 'package:orange/layout/cubit/states.dart';

class PlantsScreen extends StatelessWidget {
  const PlantsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {},
      builder: (context, state) {

        PlantsModel? model=AppCubit.get(context).plantsModel;
        List<PlantItem>?dataList=model?.data?.map((element)=>PlantItem(element)).toList();

        return  ConditionalBuilder(
          condition:model!=null ,
          builder:(context)=> CustomScrollView(
            slivers: [
              SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  childAspectRatio: 1/1.35,
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

