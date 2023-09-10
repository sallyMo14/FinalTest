import 'package:gsg_final_project_rgs/cores/helpers/token_helper.dart';
import 'package:gsg_final_project_rgs/cores/utils/constants.dart';
import 'package:gsg_final_project_rgs/view_features/auth/model/user.dart';

import '../../../cores/helpers/api_base_helper.dart';
import '../model/auth_model.dart';
import '../../../cores/helpers/shared_pref.dart';

class AuthRepository {
  final ApiBaseHelper _helper = ApiBaseHelper();

  Future<LoginModel> login(
    Map<String, String> body,
  ) async {
    final response = await _helper.post(loginUrl, body, {});

    return LoginModel.fromJson(response);
  }

  Future<Map<String, dynamic>> signup(Map<String, dynamic> body) async {
    final response = await _helper.post(registerUrl, body, {});
    return response;
  }
}
//{'Authorization': 'Bearer ${getToken()}'}