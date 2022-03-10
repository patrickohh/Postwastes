import 'package:flutter/material.dart';

Widget photoContainer(BuildContext context, String? url){
  return Container(
    width: 200,
    height: 200,
    child: FittedBox(
      fit: BoxFit.fill,
      child: Image.network(url.toString())
    ),
  );
}

Widget photoBoxDetailScreen(BuildContext context, String url){
  return Container(
    width: 200,
    height: 200,
    child: FittedBox(
      fit: BoxFit.fill,
      child: Image.network(url)
    ),
  );
}

