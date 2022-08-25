import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:orange/modules/posts/cubit/posts_states.dart';
import 'package:orange/shared/components/components.dart';
import 'package:orange/shared/components/constants.dart';
import 'package:orange/shared/network/remote/dio_helper.dart';
import 'package:orange/shared/network/remote/end_points.dart';

import '../../../models/posts.dart';

class PostsCubit extends Cubit<PostsStates>{
  PostsCubit():super(InitialState());

  static PostsCubit get( context)=>BlocProvider.of(context);

  Future<String?>convertToBase64(File image)async{
      List<int> bytes =await image.readAsBytes();
      String image64 = base64.encoder.convert(bytes);
      return image64;
    }

  ImagePicker picker = ImagePicker();
  File? postImage;
  void pickPostImage() async {
    XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      print('${pickedFile.path}  +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++');
      postImage=File(pickedFile.path);
      emit(PickImageSuccessState());
    } else {
      emit(PickImageErrorState());
    }
  }

  void createNewPost({
  required String title,
    required String description,
})async{
    if(postImage!=null){
      emit(CreatePostLoadingState());
      String? baseImage="data:image/jpeg;base64,${await convertToBase64(postImage!)}" ;
      print('$baseImage *********************************');
      DioHelper.postData(
          url: CREATE_POST,
          data: {
            'title':title,
            'description':description,
            'imageBase64':"data:image/jpeg;base64,$baseImage",
          },
        query: null,
        token: accessToken,
      ).then((value){
        postImage=null;
        emit(CreatePostSuccessState());
        getPosts();
      }).catchError((error){
        String? errorMessage;
        if(error is DioError){
          errorMessage =error.response!.statusMessage;
          print('$errorMessage   **********************************************');
          emit(CreatePostErrorState(error.toString()));
        }
      });
    }else{
      showToast(message: "Pick an Image please", state: ToastStates.ERROR);
    }
  }

  List posts=[];
  void getPosts(){
    emit(GetAllPostsLoadingState());
    DioHelper.getData(path: ALL_POSTS, query: null,token: accessToken).then((value) {
      PostModel? postModel=PostModel.fromJson(value.data);
     // print(postModel.data![0].imageUrl);
      postModel.data!.forEach((element) {
        posts.add(element);
      });
      emit(GetAllPostsSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(GetAllPostsErrorState());

    });
  }
}