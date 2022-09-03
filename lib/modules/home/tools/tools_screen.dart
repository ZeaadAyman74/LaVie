import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange/layout/cubit/cubit.dart';
import 'package:orange/layout/cubit/states.dart';
import 'package:orange/models/tools.dart';
import 'package:orange/modules/home/tools/tool_item.dart';


class ToolsScreen extends StatelessWidget {
  const ToolsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        ToolsModel? model=AppCubit.get(context).toolModel;
        List<ToolItem>? dataList=model?.data?.map((element)=>ToolItem(element)).toList();
        return ConditionalBuilder(
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
