import 'package:cache_manager/cache_manager.dart';
import 'package:http/http.dart' as http;
import 'package:travel_kuy_app/models/favorite_model.dart';
import 'package:travel_kuy_app/models/user_model.dart';

Future<List<FavoriteModel>?> getFavoritePlacebyid({required String idUser}) async {
  var client = http.Client();
  var uri = Uri.parse('http://10.0.2.2:3000/api/v1/favorite/$idUser');
  var respone = await client.get(uri);
  if (respone.statusCode == 200) {
    var json = respone.body;
    return favoriteModelFromJson(json);
  }
}
