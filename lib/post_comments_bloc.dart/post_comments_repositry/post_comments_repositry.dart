import 'dart:convert';

import 'package:mvvm_apps/modules/post_comments_modules.dart';
  import 'package:http/http.dart' as https;

class PostCommentsRepositry {
  Future<List<PostCommentsModules>?> fetchdata()async{
    var url = "https://jsonplaceholder.typicode.com/comments";
    var response = await https.get(Uri.parse(url));
    if(response.statusCode ==200|| response.statusCode == 201){
      List<PostCommentsModules> postCommentsModules = List<PostCommentsModules>.from(json.decode(response.body).map((x) => PostCommentsModules.fromJson(x)));
      return postCommentsModules;
    }else{
      return null;
    }
  }
}