class PostsStates {}

class InitialState extends PostsStates {}

class CreatePostLoadingState extends PostsStates {}

class CreatePostSuccessState extends PostsStates {}

class CreatePostErrorState extends PostsStates {
  String error;
  CreatePostErrorState(this.error);
}

class GetMyPostsLoadingState extends PostsStates {}

class GetMyPostsSuccessState extends PostsStates {}

class GetMyPostsErrorState extends PostsStates {}

class PickImageLoadingState extends PostsStates {}

class PickImageSuccessState extends PostsStates {}

class PickImageErrorState extends PostsStates {}

class LikePostSuccessState extends PostsStates {}

class LikePostErrorState extends PostsStates {}

