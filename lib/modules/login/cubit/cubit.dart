import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange/models/signup.dart';
import 'package:orange/modules/login/cubit/states.dart';
import 'package:orange/shared/network/remote/dio_helper.dart';
import 'package:orange/shared/network/remote/end_points.dart';


class LoginCubit extends Cubit<LoginStates> {

  LoginCubit() :super(InitialState());

  static LoginCubit get(BuildContext context) => BlocProvider.of(context);

  SignUpModel? signupModel;
  void signup({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) {
    emit(SignUpLoadingState());
    DioHelper.postData(
        url:SIGNUP,
        data: {
          'firstName':firstName,
          'lastName':lastName,
          'email':email,
          'password':password,
        }
    ).then((value){
      print(value.data);
      signupModel=SignUpModel(value.data);
     emit(SignUpSuccessState());
    }).catchError((error){
      String errorMessage;
      if(error is DioError){
        if(error.response!.data['message'] is List){
          errorMessage= error.response!.data['message'][0];
        }
        else {
          errorMessage = error.response!.data['message'];
        }
        print(errorMessage);
        emit(SignUpErrorState(errorMessage));
      }
    });
  }


  SignUpModel? loginModel;
  void login({
    required String email,
    required String password,
  }){
    emit(LoginLoadingState());
    DioHelper.postData(url: LOGIN,
        data:{
          'email':email, 'password':password
        }).then((value){
      loginModel=SignUpModel(value.data);
      emit(LoginSuccessState());
    }).catchError((error){
      String errorMessage;
      if(error is DioError){
        errorMessage =error.response!.data['message'];
        emit(LoginErrorState(errorMessage));
      }
    });
  }


}