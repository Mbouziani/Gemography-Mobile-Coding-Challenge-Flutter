import 'package:flutter/material.dart';
import 'package:gemography_challenge/View/Screen/Home_Screen.dart';
import 'package:gemography_challenge/View/Widget/CostumText_Widget.dart';

class CardItem extends StatelessWidget {
  final String RepoName, RepoDesc, OwnerName, OwnerAvatar;
  final int RepoStarCount;

  const CardItem(
      {Key? key,
      required this.RepoName,
      required this.RepoDesc,
      required this.OwnerName,
      required this.OwnerAvatar,
      required this.RepoStarCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CostumText(
              fontWeight: FontWeight.w800,
              fontSize: 17,
              fontColor: Colors.black,
              Data: RepoName,
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: CostumText(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                fontColor: Colors.black,
                Data: RepoDesc,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 12,
                      backgroundImage: NetworkImage(
                        OwnerAvatar,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    CostumText(
                      fontWeight: FontWeight.w800,
                      fontSize: 16,
                      fontColor: Colors.black,
                      Data: OwnerName,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      size: 25,
                      color: Colors.black.withOpacity(0.8),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    CostumText(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      fontColor: Colors.black,
                      Data: RepoStarCount.toString(),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
