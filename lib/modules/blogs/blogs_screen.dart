import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange/layout/cubit/cubit.dart';
import 'package:orange/layout/cubit/states.dart';
import 'package:orange/models/blogs.dart';
import 'package:orange/modules/blogs/blog_item.dart';

class BlogsScreen extends StatelessWidget {
  const BlogsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        BlogsModel? model = AppCubit.get(context).blogModel;
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "Blogs",
              style: Theme.of(context).textTheme.subtitle1,
            ),
            centerTitle: true,
          ),
          body: ConditionalBuilder(
            condition: model != null,
            builder: (context) {
              // int listCount=model!.data!.plants!.length+model.data!.seeds!.length+model.data!.tools!.length;
              return ListView.separated(
                itemBuilder: (context, index) => BlogItem(AppCubit.get(context).allBlogs[index]),
                separatorBuilder: (context, index) => const SizedBox(height: 18,),
                itemCount: AppCubit.get(context).allBlogs.length,
              );
            },
            fallback: (context) =>
                const Center(child: CircularProgressIndicator()),
          ),
        );
      },
    );
  }
}
