import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mvvm_apps/modules/post_api_modules.dart';

class ApiRepository {
  Future<List<PostApiModules>> fetchData() async {
    var urls = "https://jsonplaceholder.typicode.com/posts";
    var response = await http.get(Uri.parse(urls),
    headers: {
      "Content-Type": "application/json",
      "Accept": "application/json"
    });
    if (response.statusCode == 200) {
     List<PostApiModules> postData = List<PostApiModules>.from(json.decode(response.body).map((x) => PostApiModules.fromJson(x)));
     return postData;
    } else {
      throw Exception("Failed to load posts");
    }
  }
}
