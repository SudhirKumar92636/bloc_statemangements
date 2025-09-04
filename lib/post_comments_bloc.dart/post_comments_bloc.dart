import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_apps/post_comments_bloc.dart/post_comments_event.dart';
import 'package:mvvm_apps/post_comments_bloc.dart/post_comments_repositry/post_comments_repositry.dart';
import 'package:mvvm_apps/post_comments_bloc.dart/post_comments_states.dart';

class PostCommentsBloc extends Bloc<PostCommentsEventData ,PostCommentsStates> {
  PostCommentsRepositry postCommentsRepositry = PostCommentsRepositry();
  PostCommentsBloc():super(PostCommentsStates()){
    on<PostCommentsEventData>(_fetchPostCommentsData);
  }
  void _fetchPostCommentsData (PostCommentsEventData event , Emitter<PostCommentsStates> emit)async{
    final value = await postCommentsRepositry.fetchdata();
   emit(state.copyWith(
     postcommentsData: value
   ));
  }
}