import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertwo/class/list_nft.dart';
import 'package:fluttertwo/pages/settings.dart';
import 'package:fluttertwo/styles.dart';
import 'package:fluttertwo/widgets/cards.dart';
import 'package:fluttertwo/widgets/shimmer_widget.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  final String pseudo;
  final String email;
  final String id;

  const HomePage({Key? key, required this.pseudo, required this.email, required this.id}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<HomePage> createState() => _HomePageState(pseudo: pseudo, email: email, id: id);
}

class _HomePageState extends State<HomePage> {
  final String pseudo;
  final String email;
  final String id;

  _HomePageState({required this.pseudo, required this.email, required this.id});

  late Future<AllNFT?> _allNFTs;
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

  Future sleepCustom() {
    return Future.delayed(const Duration(seconds: 2), () => "2");
  }

  Future<AllNFT?> initNFTs(id) async {
    try {
      final response = await http.post(
        Uri.parse('http://localhost:8080/user/getNFTs'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "id": id,
        }),
      );

      if (response.statusCode == 200) {
        AllNFT tmp = AllNFT.fromJson(jsonDecode(response.body)['message']);
        await sleepCustom();
        return tmp;
      } else {
        throw Exception('Failed to get NFTs.');
      }
    } catch(e) {
      return null;
    }
  }

  Future<void> refreshNFTs() async {
    try {
      final response = await http.post(
        Uri.parse('http://localhost:8080/user/getNFTs'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "id": id,
        }),
      );

      if (response.statusCode == 200) {
        AllNFT tmp = AllNFT.fromJson(jsonDecode(response.body)['message']);
        await sleepCustom();
        setState(() {
          _allNFTs = tmp as Future<AllNFT?>;
        });
      } else {
        throw Exception('Failed to get NFTs.');
      }
    } catch(e) {
      return null;
    }
  }

  @override
  void initState() {
    super.initState();
    _allNFTs = initNFTs(id);
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
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage(pseudo: pseudo, email: email, id: id,)))
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
                return RefreshIndicator(
                    key: _refreshIndicatorKey,
                    onRefresh: refreshNFTs,
                    child: GridView.count(
                        crossAxisCount: 2,
                        children: List.generate(snapshot.data!.all.length, (index) {
                          return Center(
                              child: NFTCard(url: snapshot.data!.all[index].url, name: snapshot.data!.all[index].name, description: snapshot.data!.all[index].description,)
                          );
                        })
                    ));
              }
          }
        }
    ));
  }

  Widget buildNftShimmer() => Padding(
    padding: const EdgeInsets.all(10),
    child: ShimmerWidget.circular(
      width: 10,
      height: 10,
      shapeBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15)
      ),
    )
  );
}