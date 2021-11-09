class AllNFT {
  final List<NFT> all;

  AllNFT({required this.all});

  factory AllNFT.fromJson(Map<dynamic, dynamic> json) {
    var data = <NFT>[];
    json['NFTs'].forEach((v) {
      data.add(NFT.fromJson(v));
    });
    return AllNFT(
      all: data,
    );
  }
}

class NFT {
  final String url;
  final String name;
  final String description;

  NFT({required this.url, required this.name, required this.description});

  factory NFT.fromJson(Map<dynamic, dynamic> json) {
    return NFT(
      url: json['url'],
      name: json['name'],
      description: json['description']
    );
  }
}