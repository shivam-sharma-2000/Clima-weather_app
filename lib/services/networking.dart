import 'dart:convert';
import 'package:http/http.dart' as http;


class NetworkHelper {
  final url;

  NetworkHelper(this.url);

  Future<dynamic> getData() async {
    http.Response response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      print(response.body);
      return jsonDecode(response.body);
    }else{
      print(response.statusCode);
    }
  }

}