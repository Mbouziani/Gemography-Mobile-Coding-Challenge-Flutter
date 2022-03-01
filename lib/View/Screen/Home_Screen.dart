// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gemography_challenge/Controler/GithubData_Api.dart';
import 'package:gemography_challenge/Model/GithubUser_Model.dart';
import 'package:gemography_challenge/View/Widget/CardItem_Widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageindex = 1;
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
        body: Column(
          children: [
            FutureBuilder<List<Items>>(
              future: FetchData(pageindex),
              builder: (context, snapshot) {
                return snapshot.hasData
                    ? Expanded(
                        child: ListView.separated(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) => CardItem(
                            RepoName: snapshot.data![index].name.toString(),
                            RepoDesc:
                                snapshot.data![index].description.toString(),
                            OwnerName:
                                snapshot.data![index].owner!.login.toString(),
                            OwnerAvatar: snapshot.data![index].owner!.avatarUrl
                                .toString(),
                            RepoStarCount:
                                snapshot.data![index].stargazersCount!,
                          ),
                          separatorBuilder: (context, index) => const Divider(
                            height: 1,
                            color: Colors.grey,
                          ),
                        ),
                      )
                    : const Center(
                        child: CircularProgressIndicator(),
                      );
              },
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FloatingActionButton(
                    child: Icon(Icons.arrow_back_ios_outlined),
                    onPressed: () {
                      setState(() {
                        pageindex == 1 ? pageindex = 1 : pageindex--;
                      });
                    },
                  ),
                  Text(" Page $pageindex/30"),
                  FloatingActionButton(
                    child: Icon(Icons.arrow_forward_ios_outlined),
                    onPressed: () {
                      setState(() {
                        pageindex == 30 ? pageindex = 30 : pageindex++;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
