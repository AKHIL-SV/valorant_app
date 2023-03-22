import 'package:http/http.dart' as http;
import 'package:valorant_app/model/valo_model.dart';

class RemoteServices {
  Future<Valorant?> getValoData() async {
    var client = http.Client();
    var url = Uri.parse('https://valorant-api.com/v1/agents');
    var response = await client.get(url);
    if (response.statusCode == 200) {
      var json = response.body;
      return valorantFromJson(json);
    }
  }
}
