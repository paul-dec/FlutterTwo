import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertwo/pages/nft_details.dart';
import 'package:shimmer/shimmer.dart';

class NFTCard extends StatelessWidget {

  final String url;
  final String name;
  final String description;

  const NFTCard({Key? key, required this.url, required this.name, required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => NFTDetails(url: url, name: name, description: description,))),
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        margin: const EdgeInsets.all(10),
        color: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Image.network(
          url,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}