import 'package:tetatet/services/objects.dart';
import 'package:http/http.dart' as http;

class Network {
  static const String url = "https://tetatet.fun/test/";

  static Future<UserModel> addUser(userId, date) async {
    final responce = await http.post(Uri.parse(url + 'checkUser.php'),
        body: {"user_id": userId, "date": date});

    return userModelFromJson(responce.body);
  }

  static Future<PacksModel> getGames(uid) async {
    try {
      final responce = await http
          .post(Uri.parse(url + 'getPacks.php'), body: {"user_id": uid});

      final PacksModel packs = packsModelFromJson(responce.body);
      return packs;
    } catch (e) {
      throw Exception(e);
    }
  }
}
