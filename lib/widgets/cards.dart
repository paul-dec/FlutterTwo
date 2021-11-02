import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NFTCard extends StatelessWidget {

  final String img;

  const NFTCard({Key? key, required this.img}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      margin: const EdgeInsets.all(10),
      color: Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Image.asset(
        img,
        fit: BoxFit.fill,
      ),
    );
  }
}