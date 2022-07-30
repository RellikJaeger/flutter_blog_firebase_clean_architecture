import 'package:flutter_blog_firebase/core/domain/entities/user_entity.dart';
import 'package:flutter_blog_firebase/core/use_case/use_case.dart';
import 'package:flutter_blog_firebase/core/value_objects/email_value_object.dart';
import 'package:flutter_blog_firebase/core/value_objects/password_value_object.dart';
import 'package:flutter_blog_firebase/features/auth/domain/repositories/auth_repo.dart';

class GetProfileUseCase implements UseCase<UserEntity, NoParams> {
  final AuthRepo authRepo;

  GetProfileUseCase(this.authRepo);

  @override
  UserEntity call(NoParams params) {
    return authRepo.getLoggedUser();
  }
}

class LoginParams {
  final EmailAddress emailAddress;
  final Password password;

  LoginParams({required this.emailAddress, required this.password});

  // from json
  factory LoginParams.fromJson(Map<String, dynamic> json) {
    return LoginParams(
      emailAddress: EmailAddress(json['email']),
      password: Password(json['password']),
    );
  }
}
