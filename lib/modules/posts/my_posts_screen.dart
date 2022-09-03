import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orange/modules/posts/cubit/posts_cubit.dart';
import 'package:orange/modules/posts/cubit/posts_states.dart';
import 'package:orange/modules/posts/post_details.dart';

class MyPostsScreen extends StatelessWidget {
  const MyPostsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostsCubit, PostsStates>(
      listener: (context, state) {
        // if(state is CreatePostSuccessState){
        //   PostsCubit.get(context).getPosts();
        // }
      },
      builder: (context, state) {
        PostsCubit cubit = PostsCubit.get(context);
        return Column(
          children: [
            ConditionalBuilder(
              condition: (state is! GetMyPostsLoadingState),
              builder: (context) {
                if(cubit.posts.isNotEmpty) {
                  return Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) =>
                          PostItem(PostsCubit.get(context).posts[index]),
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 20,
                          ),
                      itemCount: PostsCubit.get(context).posts.length),
                );
                }
                else{
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/images/carts_empty.svg'),
                      const SizedBox(height: 10,),
                      Text('No Posts Yet ',style: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.bold),),
                    ],
                  ),
                );
                }
              },
              fallback: (context) => const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ],
        );
      },
    );
  }
}
