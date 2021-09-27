import 'package:fingerprint_aps/app/core/modules/auth/domain/entities/user.dart';
import 'package:fingerprint_aps/app/modules/core/presenter/controller/view_models/user_view_model.dart';

extension UserExt on User {
  bool isEqual(User? other) {
    final isEqualAttributes = authStatusEnum == other?.authStatusEnum && 
      login == other?.login && password == other?.password &&
        permissionsUserEnum == other?.permissionsUserEnum;

    return isEqualAttributes;
  }

  bool isEqualViewModel(UserViewModel? other) {
    final isEqualAttributes = login == other?.login && password == other?.password &&
      permissionsUserEnum == other?.permissionsUserEnum;

    return isEqualAttributes;
  }

  bool compaireToLogin(UserViewModel? other) {
    final isEqualAttributes = login == other?.login && password == other?.password;

    return isEqualAttributes;
  }
}