import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../shared/components/components.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {
        if(state is SignUpSuccessState){
            showToast(message:LoginCubit.get(context).signupModel!.message!,state: ToastStates.SUCCESS);
        }else if ( state is SignUpErrorState){
          showToast(message: state.message, state:ToastStates.ERROR);
        }
      },
      builder: (context, state) {
        LoginCubit cubit = LoginCubit.get(context);
        return SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
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
                const SizedBox(
                  height: 15,
                ),
                MyTextField(
                    label: 'Email',
                    myController: emailController,
                    type: TextInputType.visiblePassword,
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
                    label: 'Password',
                    myController: passController,
                    type: TextInputType.visiblePassword,
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return 'Field cannot be empty';
                      } else {
                        return null;
                      }
                    }),
                const SizedBox(
                  height: 20,
                ),
                ConditionalBuilder(condition: state is! SignUpLoadingState,
                    builder: (context)=>MyButton(
                      height: 47,
                      width: 337,
                      radius: 5,
                      function: () {
                        if(formKey.currentState!.validate())
                        {
                          cubit.signup(
                              firstName: firstNameController.text,
                              lastName: lastNameController.text,
                              email: emailController.text,
                              password: passController.text
                          );
                        }
                      },
                      text: 'Sign Up',
                    ),
                    fallback: (context)=>const CircularProgressIndicator(),
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 1,
                            color: const Color(0xff979797),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          'or continue with',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(
                                  fontSize: 14, fontWeight: FontWeight.w300),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Container(
                            height: 1,
                            color: const Color(0xff979797),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Image.asset(
                            'assets/images/img_1.png',
                          ),
                          iconSize: 50,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Image.asset('assets/images/img.png')),
                      ],
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  child: SvgPicture.asset('assets/images/left_flower.svg',height: 100,width: 100),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
