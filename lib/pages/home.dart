import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertwo/class/list_nft.dart';
import 'package:fluttertwo/class/user.dart';
import 'package:fluttertwo/functions/build_shimmer.dart';
import 'package:fluttertwo/functions/nft_api.dart';
import 'package:fluttertwo/pages/settings.dart';
import 'package:fluttertwo/styles.dart';
import 'package:nft_card/nft_card.dart';

import 'nft_details.dart';

class HomePage extends StatefulWidget {
  final User user;

  const HomePage({Key? key, required this.user}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<HomePage> createState() => _HomePageState(user: user);
}

class _HomePageState extends State<HomePage> {
  final User user;

  _HomePageState({required this.user});

  late Future<AllNFT?> _allNFTs;
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
    _allNFTs = initNFTs(user.id);
  }

  Future<void> _refresh() async {
    setState(() {
      _allNFTs = refreshNFTs(user.id, _allNFTs);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.xBlue,
      appBar: AppBar(
        backgroundColor: ThemeColor.xPurple,
        title: const Text("NFT Wallet", style: ThemeText.whiteTextBold,),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage(user: user,)))
          ),
        ],
      ),
      body: FutureBuilder<AllNFT?>(
        future: _allNFTs,
        builder: (BuildContext context, AsyncSnapshot<AllNFT?> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
            case ConnectionState.active:
            {
              return GridView.count(
                crossAxisCount: 2,
                children: List.generate(9, (index) {
                  return (buildNftShimmer());
                }),
              );
            }
            case ConnectionState.done:
            {
              if (snapshot.hasData) {
                return RefreshIndicator(
                    key: _refreshIndicatorKey,
                    onRefresh: _refresh,
                    child: GridView.count(
                        crossAxisCount: 2,
                        children: List.generate(snapshot.data!.all.length, (index) {
                          return Center(
                              child: NFTCard(
                                url: snapshot.data!.all[index].url,
                                name: snapshot.data!.all[index].name,
                                description: snapshot.data!.all[index].description,
                                function: () => Navigator.push(context, MaterialPageRoute(builder: (context) => NFTDetails(id: user.id, url: snapshot.data!.all[index].url))),)
                          );
                        })
                    )
                );
              } else {
                return Center(
                  child: Text(snapshot.error.toString(), style: ThemeText.whiteTextBold),
                );
              }
            }
          }
        }
      )
    );
  }
}