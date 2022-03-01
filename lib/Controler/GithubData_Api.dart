// ignore_for_file: non_constant_identifier_names, avoid_print

import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gemography_challenge/Model/GithubUser_Model.dart';
import 'package:http/http.dart' as http;

Future<List<Items>> FetchData(int Pagenumber) async {
  http.Response response = await http.get(Uri.parse(
      "https://api.github.com/search/repositories?q=created:%3E2017-10-22&sort=stars&order=desc&page=$Pagenumber"));

  var body = jsonDecode(response.body);
  List<Items> _ItemList = [];
  for (int i = 0; i < body['items'].length; i++) {
    _ItemList.add(Items.fromJson(body['items'][i]));
  }
  print(_ItemList.length);
  return _ItemList;
}
