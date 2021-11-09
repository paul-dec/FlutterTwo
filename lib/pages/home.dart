import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:fluttertwo/widgets/cards.dart';
import 'package:fluttertwo/pages/shimmer_widget.dart';

class HomePage extends StatefulWidget {
  final String pseudo;
  final String email;
  final String nft;

  const HomePage({Key? key, required this.pseudo, required this.email, required this.nft}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(9, (index) {
          // return Center(
          //     child: NFTCard(img: "assets/nft${index + 1}.png")
          // );
          return (buildNftShimmer());
        }),
      ),
      // body: ListView.builder(
      //   itemCount: 5,
      //   itemBuilder: (context, index) {
      //     return (buildNftShimmer());
      //   },
      // ),
    );
  }

  Widget buildNftShimmer() => ListTile(
    leading: ShimmerWidget.circuler(
      width: 150,
      height: 150,
      shapeBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
      ),
    ),
  );
}