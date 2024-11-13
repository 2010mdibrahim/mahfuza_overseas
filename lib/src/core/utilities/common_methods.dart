import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mahfuza_overseas/src/core/source/dio_client.dart';
import 'package:mahfuza_overseas/src/core/utilities/theme_config.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'dart:ui' as ui;

import '../../../main.dart';
import '../network/configuration.dart';
import 'assets_image.dart';
class CommonMethods{
  static showToast(String message, color) {
    Fluttertoast.showToast(
      msg: message,
      textColor: color,
      toastLength: Toast.LENGTH_LONG,
      timeInSecForIosWeb: 4,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.grey,
    );
  }
  static cachedNetworkImage(String url, {double? height, double? width, BoxFit? fit}){
  return  CachedNetworkImage(
      imageUrl: "${box.read("baseUrl")}$url",
      height: height,
      width: width,
      fit: fit ?? BoxFit.cover,
      progressIndicatorBuilder:
          (context, url, downloadProgress) =>
          Transform.scale(
            scale: 0.5,
            child:
             Center(child: CircularProgressIndicator(backgroundColor: ThemeConfig.logoColor)),
          ),
      errorWidget: (context, url, error) =>
      const Icon(Icons.image),
    );
  }


  static Widget notFoundArc({String title = "Data is not available"}) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            AssetImagePath.NOT_FOUND_IMAGE,
            height: 100,
            width: 100,
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.only(right: 22),
            child: Text(
              title,
              textDirection: ui.TextDirection.ltr,
              style:  TextStyle(
                color: ThemeConfig.logoColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
  browseURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }
}