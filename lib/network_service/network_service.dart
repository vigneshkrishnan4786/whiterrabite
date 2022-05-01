import 'package:http/http.dart' as http;

import '../model/user_model.dart';

class NetWorkService {
  final String baseURL = "http://www.mocky.io/";

  Future<List<UserModel>> getUserList(var prefs) async {
    http.Response res =
        await http.get(Uri.parse(baseURL + "v2/5d565297300000680030a986"));

    if (res.statusCode == 200) {
      List<UserModel> users = userModelFromJson(res.body.toString());
      await prefs.setString('UserModelData', res.body.toString());

      return users;
    } else {
      throw "Unable to retrieve posts.";
    }
  }
}
