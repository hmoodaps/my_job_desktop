
abstract class AppState {}

class InitCubit extends AppState {}

class ToggleLightAndDark extends AppState {}
class Login extends AppState {}
class LoginSuccess extends AppState {}
class LoginError extends AppState {}
class LoggedOut extends AppState {}
class LoginFailed extends AppState {}
class LoggingOut extends AppState {}
class LogoutError extends AppState {
  final String error;
  LogoutError(this.error);
}
class UpdateCategory extends AppState {
  final String category;
  UpdateCategory(this.category);
}
class AddUser extends AppState {}
class FetchUserData extends AppState {}
class SuccessGettingAllUser extends AppState {}
class ErrorGettingAllUser extends AppState {}

class AddUserError extends AppState {
  final String errorMessage;

  AddUserError(this.errorMessage);

  @override
  String toString() => 'AddUserError: $errorMessage';
}

class CreateUser extends AppState {}

class CreateUserSuccess extends AppState {}

class CreateUserError extends AppState {
  final String errorMessage;

  CreateUserError(this.errorMessage);

  @override
  String toString() => 'CreateUserError: $errorMessage';
}


