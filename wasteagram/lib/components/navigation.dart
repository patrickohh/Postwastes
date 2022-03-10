import 'package:flutter/material.dart';
import 'package:wasteagram/screens/add_post_screen.dart';
import 'package:wasteagram/screens/detailed_post_screen.dart';
import 'package:wasteagram/screens/choose_photo_screen.dart';
import 'package:wasteagram/screens/posts_screen.dart';



void pushDetailedPostScreen(BuildContext context, int index, String url){
  Navigator.push(context, MaterialPageRoute(builder: (context) => DetailedPost(index: index, url: url)));
}

void pushChoosePhotoScreen(BuildContext context){
  Navigator.push(context, MaterialPageRoute(builder: ((context) => ChoosePhoto())));
}

void pushAddPostScreen(BuildContext context, String? url){
  Navigator.push(context, MaterialPageRoute(builder: ((context) => AddPost(url: url))));
}

void pushPostsListScreen(BuildContext context){
  Navigator.push(context, MaterialPageRoute(builder: ((context) => PostsList())));
}



