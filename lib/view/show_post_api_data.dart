import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_apps/api_bloc/post_api_bloc.dart';
import 'package:mvvm_apps/api_bloc/post_api_event.dart';
import 'package:mvvm_apps/api_bloc/post_api_states.dart';

class ShowPostApiData extends StatefulWidget {
  const ShowPostApiData({super.key});

  @override
  State<ShowPostApiData> createState() => _ShowPostApiDataState();
}

class _ShowPostApiDataState extends State<ShowPostApiData> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<PostApiBloc>().add(GetPostApiData());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Show Post Api Data"),
        backgroundColor: Colors.blue,
      ),
      body: BlocBuilder<PostApiBloc , PostApiStates>(builder: (context, state) {
       return ListView.builder(
         itemCount: state.postApiModules.length,
         itemBuilder: (context, index) {
           final postApiModule = state.postApiModules[index];
           return Card(
             shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(10)
             ),
             child: Column(
               children: [
                 Text("UserId:---${postApiModule.userId}"),
                 Text("UserId:---${postApiModule.id}"),
                 Text("UserId:---${postApiModule.title}"),
                 Text("UserId:---${postApiModule.body}"),
               ],
             ),
           );
         },
       );
      },),
    );
  }
}
