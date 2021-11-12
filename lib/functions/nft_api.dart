import 'dart:convert';

import 'package:fluttertwo/class/list_nft.dart';
import 'package:http/http.dart' as http;

Future sleepCustom1() {
  return Future.delayed(const Duration(seconds: 1), () => "1");
}

Future sleepCustom2() {
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
      await sleepCustom2();
      return tmp;
    } else {
      throw Exception('Failed to get NFTs.');
    }
  } catch(e) {
    if (e.toString() == 'Exception: Failed to get NFTs.') {
      throw Exception('Failed to get NFTs.');
    }
    throw Exception('Invalid internet connexion or API is down');
  }
}

Future<AllNFT> refreshNFTs(id, _allNFTs) async {
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
      await sleepCustom2();
      return (tmp);
    } else {
      throw Exception('Failed to get NFTs.');
    }
  } catch(e) {
    return (_allNFTs);
  }
}

Future<NFTDesc?> getOneNFT(id, url) async {
  try {
    final response = await http.post(
      Uri.parse('http://localhost:8080/user/getNFT'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "id": id,
        "url": url
      }),
    );

    if (response.statusCode == 200) {
      NFTDesc tmp = NFTDesc.fromJson(jsonDecode(response.body));
      await sleepCustom1();
      return tmp;
    } else {
      throw Exception('Failed to get NFT.');
    }
  } catch(e) {
    if (e.toString() == 'Exception: Failed to get NFT.') {
      throw Exception('Failed to get NFT.');
    }
    throw Exception('Invalid internet connexion or API is down');
  }
}