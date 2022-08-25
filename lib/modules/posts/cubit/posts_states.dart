class PostsStates {}

class InitialState extends PostsStates {}

class CreatePostLoadingState extends PostsStates {}

class CreatePostSuccessState extends PostsStates {}

class CreatePostErrorState extends PostsStates {
  String error;
  CreatePostErrorState(this.error);
}

class GetAllPostsLoadingState extends PostsStates {}

class GetAllPostsSuccessState extends PostsStates {}

class GetAllPostsErrorState extends PostsStates {}

class PickImageLoadingState extends PostsStates {}

class PickImageSuccessState extends PostsStates {}

class PickImageErrorState extends PostsStates {}

class LikePostSuccessState extends PostsStates {}

class LikePostErrorState extends PostsStates {}

