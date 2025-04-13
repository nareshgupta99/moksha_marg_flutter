import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget cachedImage(
    {required String url, required double height, double? width, BoxFit? fit}) {
  return CachedNetworkImage(
    fit: fit ?? BoxFit.cover,
    imageUrl: url,
    placeholder: (context, url) => SizedBox(height: height, width: width),
    errorWidget: (context, url, error) =>
        SizedBox(height: height, width: width),
    height: height,
    width: width,
  );
}
