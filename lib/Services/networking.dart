import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkingHelper {
  final String url;
  NetworkingHelper(this.url);

  Future getweather() async {
    final http.Response response = await http.get(
      Uri.parse(url),
    );
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      (response.statusCode);
    }
  }
}
