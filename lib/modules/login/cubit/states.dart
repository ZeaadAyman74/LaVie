class LoginStates {}

class InitialState extends LoginStates {}

class ChangeNavBarState extends LoginStates {}

class SignUpLoadingState extends LoginStates {}

class SignUpSuccessState extends LoginStates {}

class SignUpErrorState extends LoginStates {
  String message;
  SignUpErrorState(this.message);
}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {}

class LoginErrorState extends LoginStates {
  String message;
  LoginErrorState(this.message);
}

