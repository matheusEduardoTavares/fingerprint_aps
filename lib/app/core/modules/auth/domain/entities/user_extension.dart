import 'package:fingerprint_aps/app/core/modules/auth/domain/entities/user.dart';
import 'package:fingerprint_aps/app/core/modules/auth/presenter/controller/view_models/user_view_model.dart';

extension UserExt on User {
  ///Outra alternativa e até mais interessante seria implementar o equality na 
  ///classe `User` e assim a validação
  ///de igualdade já seria feito automaticamente, uma vez que o operator method ==
  ///e o hashCode seriam sobrescritos
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