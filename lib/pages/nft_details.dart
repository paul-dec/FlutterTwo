import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertwo/class/list_nft.dart';
import 'package:fluttertwo/functions/nft_api.dart';
import 'package:fluttertwo/styles.dart';

class NFTDetails extends StatefulWidget {
  final String id;
  final String url;

  const NFTDetails({Key? key, required this.id, required this.url}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<NFTDetails> createState() => _NFTDetailsState(id: id, url: url);
}

class _NFTDetailsState extends State<NFTDetails> {
  final String id;
  final String url;

  _NFTDetailsState({required this.id, required this.url});

  late Future<NFTDesc?> _NFT;

  @override
  void initState() {
    super.initState();
    _NFT = getOneNFT(id, url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.xBlue,
      appBar: AppBar(
        title: const Text("NFT", style: ThemeText.whiteTextBold,),
        backgroundColor: ThemeColor.xPurple,
      ),
        body: FutureBuilder<NFTDesc?>(
          future: _NFT,
          builder: (BuildContext context, AsyncSnapshot<NFTDesc?> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
              case ConnectionState.active:
              {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              case ConnectionState.done:
              {
                if (snapshot.hasData) {
                  return Center(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 200,
                              child: Hero(
                                tag: snapshot.data!.name,
                                child: Image.network(
                                  url,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10,),
                            Text(snapshot.data!.name, style: ThemeText.whiteTextBold,),
                            const SizedBox(height: 10,),
                            Text(snapshot.data!.description, style: ThemeText.whiteTextBold),
                          ],
                        ),
                      )
                  );
                } else {
                  return Center(
                    child: Text(snapshot.error.toString(), style: ThemeText.whiteTextBold,),
                  );
                }
              }
            }
          }
        ),
    );
  }
}