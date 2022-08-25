import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orange/modules/posts/cubit/posts_cubit.dart';
import 'package:orange/modules/posts/cubit/posts_states.dart';
import 'package:orange/shared/styles/colors.dart';
import '../../shared/components/components.dart';

class CreatePostScreen extends StatelessWidget {
  CreatePostScreen({Key? key}) : super(key: key);

  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>PostsCubit(),
      child: BlocConsumer<PostsCubit, PostsStates>(
        listener: (context, state) {
          if(state is CreatePostSuccessState){
            showToast(message: 'Post Shared Successfully', state: ToastStates.SUCCESS);
          }else if(state is CreatePostErrorState){
            showToast(message: state.error, state: ToastStates.ERROR);
          }
        },
        builder: (context, state) {
          var cubit = PostsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: SvgPicture.asset(
                  'assets/icons/arrow_back.svg',
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: Text(
                'Discussion Forums',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        cubit.pickPostImage();
                      },
                      child: cubit.postImage==null ?
                      Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            border: Border.all(
                              color: defaultColor,
                            )),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Text(
                              '+',
                              style: TextStyle(fontSize: 30, color: defaultColor),
                            ),
                            Text(
                              'Add photo',
                              style: TextStyle(color: defaultColor),
                            ),
                          ],
                        ),
                      ) :
                          Image.file(cubit.postImage!),

                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Wrap(children: [
                      MyTextField(
                        myController: descriptionController,
                        label: "Title",
                        maxLines: null,
                        type: TextInputType.multiline,
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return 'Write a title';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ]),
                    const SizedBox(
                      height: 30,
                    ),
                    MyTextField(
                      myController: titleController,
                      label: "Description",
                      type: TextInputType.text,
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return 'Write a description';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    state is! CreatePostLoadingState ?
                    MyButton(
                        height: 50,
                        width: double.infinity,
                        radius: 10,
                        function: () {
                          cubit.createNewPost(
                              title: titleController.text,
                              description: descriptionController.text,);
                        },
                        text: "post") :
                    const CircularProgressIndicator(),

                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
