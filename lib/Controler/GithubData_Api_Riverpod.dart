import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gemography_challenge/Model/GithubUser_Model.dart';
import 'package:http/http.dart' as http;

final GetFuturData = FutureProvider(
  (ref) async {
    return GetDataFromApi().GetData();
  },
);

class GetDataFromApi {
  GetDataFromApi() {
    GetData();
  }
  List<Items> ItemList = [];
  int index = 1;
  Future<List<Items>> GetData() async {
    ItemList = [];
    http.Response response = await http.get(Uri.parse(
        "https://api.github.com/search/repositories?q=created:%3E2017-10-22&sort=stars&order=desc&page=$index"));

    var body = jsonDecode(response.body);

    for (int i = 0; i < body['items'].length; i++) {
      ItemList.add(Items.fromJson(body['items'][i]));
    }

    print(ItemList.length);
    return ItemList;
  }
}
