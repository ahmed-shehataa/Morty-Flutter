
import '../../../user/data/model/user_data_model.dart';

abstract class LoginRemoteDataSource {

  Future<UserDataModel> login(String email, String password);

}
