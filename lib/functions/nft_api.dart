import 'dart:convert';

import 'package:fluttertwo/class/list_nft.dart';
import 'package:http/http.dart' as http;

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
      await sleepCustom();
      return (tmp);
    } else {
      throw Exception('Failed to get NFTs.');
    }
  } catch(e) {
    return (_allNFTs);
  }
}