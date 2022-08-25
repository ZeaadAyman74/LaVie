import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange/modules/posts/cubit/posts_cubit.dart';
import 'package:orange/modules/posts/cubit/posts_states.dart';
import 'package:orange/modules/posts/post_details.dart';

class MyPostsScreen extends StatelessWidget {
  const MyPostsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostsCubit,PostsStates>(
      listener: (context, state) {},
      builder:(context, state) {
        PostsCubit cubit=PostsCubit.get(context);
        return ListView(
          children: [
            ConditionalBuilder(
              condition:cubit.posts.isNotEmpty ,
              builder:(context)=>ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder:(context,index)=>  PostItem(PostsCubit.get(context).posts[index]),
                  separatorBuilder: (context,index)=>const SizedBox(height: 15,),
                  itemCount:PostsCubit.get(context).posts.length ) ,
              fallback:(context)=>const Center(child: CircularProgressIndicator(),) ,
            ),
          ],
        );
      } ,
    );
  }
}
