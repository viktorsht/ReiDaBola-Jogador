import '../../../../valueobject/email.dart';
import '../../../../valueobject/name.dart';
import '../../../../valueobject/password.dart';

class CreateUser {
  Name? firstName;
  Name? lastName;
  Name? username;
  Email? email;
  Password? password;
  Password? passwordConfirmation;

  CreateUser(
      {this.firstName,
      this.lastName,
      this.username,
      this.email,
      this.password,
      this.passwordConfirmation});

  CreateUser.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    username = json['username'];
    email = json['email'];
    password = json['password'];
    passwordConfirmation = json['password_confirmation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['username'] = username;
    data['email'] = email;
    data['password'] = password;
    data['password_confirmation'] = passwordConfirmation;
    return data;
  }

    factory CreateUser.empty(){
    return CreateUser(
      email: Email(''),
      firstName: Name(''),
      lastName: Name(''),
      username: Name(''),
      password: Password(''),
      passwordConfirmation: Password(''),
    );
  }

}
