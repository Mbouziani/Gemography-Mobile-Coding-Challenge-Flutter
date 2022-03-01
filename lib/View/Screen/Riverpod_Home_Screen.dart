// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gemography_challenge/Controler/GithubData_Api.dart';
import 'package:gemography_challenge/Controler/GithubData_Api_Riverpod.dart';
import 'package:gemography_challenge/Model/GithubUser_Model.dart';
import 'package:gemography_challenge/View/Widget/CardItem_Widget.dart';

class RiverHomeScreen extends StatelessWidget {
  final keyrefrech = GlobalKey<RefreshIndicatorState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Trending Repos',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.grey.shade200,
        centerTitle: true,
      ),
      body: Consumer(builder: (context, ref, child) {
        AsyncValue<List<Items>> data = ref.watch(GetFuturData);

        return data.when(
            data: (value) {
              return SizedBox(
                child: RefreshIndicator(
                  key: keyrefrech,
                  onRefresh: (() {
                    return GetDataFromApi().GetData();
                  }),
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: value.length,
                    itemBuilder: (context, index) => CardItem(
                      RepoName: value[index].name.toString(),
                      RepoDesc: value[index].description.toString(),
                      OwnerName: value[index].owner!.login.toString(),
                      OwnerAvatar: value[index].owner!.avatarUrl.toString(),
                      RepoStarCount: value[index].stargazersCount!,
                    ),
                    separatorBuilder: (context, index) => const Divider(
                      height: 1,
                      color: Colors.grey,
                    ),
                  ),
                ),
              );
            },
            error: (error, stack) => const Center(
                  child: Text('Error'),
                ),
            loading: () => const Center(
                  child: CircularProgressIndicator(),
                ));
      }),
    );
  }
}
