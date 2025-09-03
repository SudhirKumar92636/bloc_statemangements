import 'package:equatable/equatable.dart';
import 'package:mvvm_apps/modules/post_api_modules.dart';
import 'package:mvvm_apps/utlis/post_api_status.dart';

class PostApiStates extends Equatable {
  final PostStatus postStatus;
  List<PostApiModules> postApiModules;

   PostApiStates({
    this.postStatus = PostStatus.loading,
     this.postApiModules =const <PostApiModules>[]});

  PostApiStates copyWith({PostStatus? status ,List<PostApiModules>? postApiModules}) {
    return PostApiStates(
        postStatus:  status ?? this.postStatus,
       postApiModules: postApiModules ?? this.postApiModules
    );
  }

  @override
  List<Object?> get props => [postStatus , postApiModules];
}
