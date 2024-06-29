
abstract class AppState {}

class InitCubit extends AppState {}

class ToggleLightAndDark extends AppState {}
class Login extends AppState {}
class LoginSuccess extends AppState {}
class LoginError extends AppState {
  final String e;
  LoginError(this.e);
}
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

class SalaryCalculated extends AppState {
  final double totalSalary;

  SalaryCalculated(this.totalSalary);
}
class PickSingleFile extends AppState{}
class UploadFileSuccess extends AppState{}
class UploadFile extends AppState{}
class UploadFileFailed extends AppState{}
class DeleteFileSuccess extends AppState{}
class DeleteFile extends AppState{}
class DeleteFileFailed extends AppState{}
class PickMultipleFiles extends AppState{}
class UploadFiles extends AppState{}
class FilePickCancelled extends AppState{}
class UploadPhoto extends AppState{}
class PickSinglePhoto extends AppState{}
class PhotoPickCancelled extends AppState{}
class GetAllUsers extends AppState{}

