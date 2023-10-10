import 'dart:developer';
import 'package:rest_api_samp_prj/modal/usermodel.dart';
import 'package:rest_api_samp_prj/constants.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<UserModel>?> getUsers() async {
    try {
      String url = ApiConstants.url + ApiConstants.usersEndpoint;
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        List<UserModel> model = userModelformJson(response.body);
        return model;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
