import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange/modules/profile/cubit/profile_cubit.dart';
import 'package:orange/modules/profile/cubit/states.dart';

import '../../shared/components/components.dart';
import '../login/components.dart';

class UpdateNameScreen extends StatelessWidget {
   UpdateNameScreen({Key? key}) : super(key: key);

  var firstNameController=TextEditingController();
  var lastNameController=TextEditingController();
  var formKey=GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit,ProfileStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit=ProfileCubit.get(context);
        firstNameController.text=cubit.userModel!.data!.firstName!;
        lastNameController.text=cubit.userModel!.data!.lastName!;

        return Scaffold(
          appBar: AppBar(
            title:Text("Update Name",style: Theme.of(context).textTheme.subtitle1),
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
                        label: 'First Name',
                        myController: firstNameController,
                        type: TextInputType.name,
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
                    MyTextField(
                        label: 'Last Name',
                        myController: lastNameController,
                        type: TextInputType.name,
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return 'Field cannot be empty';
                          } else {
                            return null;
                          }
                        }),
                    const SizedBox(height: 20,),
                    if(state is UpdateNameLoadingState)
                      const LinearProgressIndicator(),
                    if(state is UpdateNameLoadingState)
                      const SizedBox(height: 20,),
                      MyButton(
                      height: 47,
                      width: double.infinity,
                      radius: 5,
                      function: () {
                        if(formKey.currentState!.validate())
                        {
                          cubit.updateName(firstName: firstNameController.text, lastName: lastNameController.text);
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
