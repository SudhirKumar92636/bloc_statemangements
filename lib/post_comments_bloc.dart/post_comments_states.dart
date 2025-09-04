import 'package:equatable/equatable.dart';
import 'package:mvvm_apps/modules/post_comments_modules.dart';

class PostCommentsStates extends Equatable {
 final List<PostCommentsModules> postCommentsModules;
  const PostCommentsStates({this.postCommentsModules =const <PostCommentsModules>[]});

  PostCommentsStates copyWith({List<PostCommentsModules>  ?postcommentsData}){
    return PostCommentsStates(postCommentsModules: postcommentsData?? this.postCommentsModules);
  }


  List<Object?> get props => [PostCommentsModules];
}
