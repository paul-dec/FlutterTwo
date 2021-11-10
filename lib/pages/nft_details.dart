import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertwo/styles.dart';

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
      backgroundColor: ThemeColor.xBlue,
      appBar: AppBar(
        title: Text("NFT " + name, style: ThemeText.whiteTextBold,),
        backgroundColor: ThemeColor.xPurple,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
          child: Column(
            children: [
              SizedBox(
                height: 200,
                child: Hero(
                  tag: name,
                  child: Image.network(
                    url,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              Text(description, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
            ],
          ),
        )
      )
    );
  }
}