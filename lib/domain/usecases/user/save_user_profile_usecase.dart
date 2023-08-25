import 'package:dartz/dartz.dart';
import 'package:fashion_app/core/errors/failure.dart';
import 'package:fashion_app/domain/entities/account/user.dart';
import 'package:fashion_app/domain/repository/repositories.dart';
import 'package:fashion_app/domain/usecases/base_usecase.dart';

class SaveUserProfileUsecase extends BaseUsecase<void, SaveUserInputs> {
  final FirebaseUserRepository _repository;
  SaveUserProfileUsecase(this._repository);
  @override
  Future<Either<Failure, void>> call(SaveUserInputs parameters) async {
    print('show in svaeUserProfile');
    print(parameters.userModel);
    return await _repository.createUserProfile(
        parameters.userModel, parameters.userName, parameters.passWord);
  }
}

class SaveUserInputs {
  UserModel userModel;
  String userName;
  String passWord;

  SaveUserInputs(this.userModel, this.userName, this.passWord);
}
