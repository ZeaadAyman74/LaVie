import 'dart:convert';
import 'dart:io';
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

  Future<String?>convertToBase64(File image)async{
    List<int> bytes =await File(image.path).readAsBytes();
    String image64 =base64Encode(bytes);
    return image64;
  }

  void createNewPost({
     required String title,
    required String description,
})async{
    if(postImage!=null){
      emit(CreatePostLoadingState());
      String? baseImage=await convertToBase64(postImage!);
      print('$baseImage *********************************');
    await  DioHelper.postData(
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
        getPosts();
        emit(CreatePostSuccessState());
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
   getPosts(){
    emit(GetMyPostsLoadingState());
    posts=[];
    DioHelper.getData(path: MY_POSTS, query: null,token: accessToken).then((value) {
      PostModel? postModel=PostModel.fromJson(value.data);
     // print(postModel.data![0].imageUrl);
      postModel.data!.forEach((element) {
        posts.add(element);
      });
      emit(GetMyPostsSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(GetMyPostsErrorState());

    });
  }

  void likePost(String id){
DioHelper.postData(url: LIKE_POST, data: null,
query: {
  'forumId':id,
},
  token: accessToken,
).then((value){
emit(LikePostSuccessState());
}).catchError((error){
  emit(LikePostErrorState());
});
  }
}