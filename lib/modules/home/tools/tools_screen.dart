import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange/models/tools.dart';
import 'package:orange/modules/home/tools/tool_item.dart';
import 'package:orange/shared/cubit/cubit.dart';
import 'package:orange/shared/cubit/states.dart';

class ToolsScreen extends StatelessWidget {
  const ToolsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        ToolsModel? model=AppCubit.get(context).toolModel;
        return ConditionalBuilder(
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
                    childAspectRatio: 1 / 1.35,
                    children:model!.data!.map((element)=>ToolItem(element)).toList()
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
