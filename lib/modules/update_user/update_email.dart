import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange/modules/profile/cubit/profile_cubit.dart';
import 'package:orange/modules/profile/cubit/states.dart';

import '../../shared/components/components.dart';
import '../login/components.dart';

class UpdateEmailScreen extends StatelessWidget {
  UpdateEmailScreen({Key? key}) : super(key: key);

  var emailController=TextEditingController();
  var formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit,ProfileStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit=ProfileCubit.get(context);
        emailController.text=cubit.userModel!.data!.email!;
        return Scaffold(
          appBar: AppBar(
            title:Text("Update Email",style: Theme.of(context).textTheme.subtitle1),
            centerTitle: true,
          ),
          body: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: Column(
                  children: [
                    MyTextField(
                        label: 'Email',
                        myController: emailController,
                        type: TextInputType.emailAddress,
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return 'Field cannot be empty';
                          } else {
                            return null;
                          }
                        }),
                    const SizedBox(
                      height: 15,
                    ),
                    const SizedBox(height: 20,),
                    if(state is UpdateEmailLoadingState)
                      const CircularProgressIndicator(),
                    if(state is UpdateEmailLoadingState)
SizedBox(height: 20,),
                      MyButton(
                      height: 47,
                      width: double.infinity,
                      radius: 5,
                      function: () {
                        if(formKey.currentState!.validate())
                        {
                          cubit.updateEmail(email: emailController.text);
                        }
                      },
                      text: 'Update',
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },

    );
  }
}
