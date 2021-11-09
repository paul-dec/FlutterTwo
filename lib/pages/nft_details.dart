import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NFTDetails extends StatefulWidget {
  final String url;
  final String name;
  final String description;

  const NFTDetails({Key? key, required this.url, required this.name, required this.description}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<NFTDetails> createState() => _NFTDetailsState(url: url, name: name, description: description);
}

class _NFTDetailsState extends State<NFTDetails> {
  final String url;
  final String name;
  final String description;

  _NFTDetailsState({required this.url, required this.name, required this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("NFT " + name),
        ),
        body: Column(
          children: [
            Text(description),
          ],
        )
    );
  }
}