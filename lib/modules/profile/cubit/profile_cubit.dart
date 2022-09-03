import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange/models/user_model.dart';
import 'package:orange/modules/profile/cubit/states.dart';
import 'package:orange/shared/components/constants.dart';
import 'package:orange/shared/network/remote/dio_helper.dart';
import 'package:orange/shared/network/remote/end_points.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(InitialState());

  static ProfileCubit get(BuildContext context) => BlocProvider.of(context);

  UserModel? userModel;
   getUserData()async{
    emit(GetUserDataLoadingState());
     DioHelper.getData(path: USER_DATA, query: null, token: accessToken)
        .then((value) {
      userModel = UserModel.fromJson(value.data);
      emit(GetUserDataSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetUserDataErrorState());
    });
  }

  void updateName({
    required String firstName,
    required String lastName,
  }) {
    emit(UpdateNameLoadingState());
    DioHelper.updateUser(
        path: UPDATE_USER,
        query: null,
        token: accessToken,
        data: {
          'firstName': firstName,
          'lastName': lastName,
          'email': userModel!.data!.email,
          'address': userModel!.data!.address,
        }).then((value) {
          getUserData();
          emit(UpdateNameSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(UpdateNameErrorState());
    });
  }

  void updateEmail({
    required String email,
  }) {
    emit(UpdateEmailLoadingState());
    DioHelper.updateUser(
        path: UPDATE_USER,
        query: null,
        token: accessToken,
        data: {
          'firstName': userModel!.data!.firstName,
          'lastName': userModel!.data!.lastName,
          'email': email,
          'address': userModel!.data!.address,
        }).then((value) {
      getUserData();
      emit(UpdateEmailSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(UpdateEmailErrorState());
    });
  }
}
