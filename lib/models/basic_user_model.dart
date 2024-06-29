
class BasicUserModel {
  String? uid;
  String? password;
  String? email;

  BasicUserModel({
    this.email,
    this.password,
    this.uid,

  });

  factory BasicUserModel.fromJson(Map<String, dynamic> json) {
    return BasicUserModel(

      password: json['password'],
      uid: json['uid'],
      email: json['email'],


    );}


  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'password': password,

    };
  }
}
