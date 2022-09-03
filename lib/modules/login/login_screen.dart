import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orange/layout/layout_screen.dart';
import 'package:orange/modules/free_seed/free_seed_screen.dart';
import 'package:orange/shared/components/components.dart';
import 'package:orange/shared/components/constants.dart';
import 'package:orange/shared/network/local/cache_helper.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit,LoginStates>(
      listener: (context, state) {
        if(state is LoginSuccessState){
          showToast(message: LoginCubit.get(context).loginModel!.message!, state:ToastStates.SUCCESS);
          CacheHelper.putData(key: 'token', value:LoginCubit.get(context).loginModel!.data!.accessToken).then((value){
            accessToken=LoginCubit.get(context).loginModel!.data!.accessToken;
            if(freeSeed!=true){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>FreeSeedScreen()));
            }else{
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LayoutScreen()));
            }
          });
        }else if(state is LoginErrorState){
          showToast(message:state.message, state: ToastStates.ERROR);
        }
      },
      builder:(context, state) {
        return SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MyTextField(
                  height: 50,
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
                  height: 20,
                ),
                MyTextField(
                  height: 50,
                    isPassword: true,
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
                  height: 25,
                ),
               state is LoginLoadingState ?
                  const CircularProgressIndicator() :
                MyButton(
                  height: 47,
                  width: 337,
                  radius: 5,
                  function: () {
                    if(formKey.currentState!.validate()){
LoginCubit.get(context).login(email: emailController.text, password: passController.text);
                    }
                  },
                  text: 'Login',
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 1,
                            color: const Color(0xff979797),
                          ),
                        ),
                        const SizedBox(width: 5,),
                        Text(
                          'or continue with',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(fontSize: 14, fontWeight: FontWeight.w300),
                        ),
                        const  SizedBox(width: 5,),
                        Expanded(
                          child: Container(
                            height: 1,
                            color: const Color(0xff979797),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Image.asset('assets/images/img_1.png'),
                          iconSize: 50  ,
                        ),
                        const SizedBox(width: 10,),
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

      } ,
    );
  }
}
