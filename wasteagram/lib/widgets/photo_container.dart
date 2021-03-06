import 'package:flutter/material.dart';

Widget photoContainer(BuildContext context, String? url){
  return Container(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height * 0.3,
    child: Semantics(
      enabled: true,
      label: 'Image URL: ' + url.toString(),
      child: FittedBox(
        fit: BoxFit.fill,
        child: Image.network(url.toString())
      ),
    ),
  );
}

Widget photoBoxDetailScreen(BuildContext context, String url){
  return Center(
    child: Container(
      width: MediaQuery.of(context).size.width * 0.7,
      height: MediaQuery.of(context).size.height *0.3,
      child: Semantics(
        enabled: true,
        label: 'Image URL: ' + url.toString(),
        child: FittedBox(
          fit: BoxFit.fill,
          child: Image.network(url)
        ),
      ),
    ),
  );
}

