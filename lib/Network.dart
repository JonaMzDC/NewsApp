import 'dart:async';
import 'package:webfeed/webfeed.dart';
import 'package:http/http.dart' as http;


Future<RssFeed> getNews() async {

  var response = await http.get(Uri.encodeFull("https://www.rionegro.com.ar/feed/rss2/"));

  return RssFeed.parse(response.body);
}