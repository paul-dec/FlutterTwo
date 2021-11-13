import 'package:flutter_test/flutter_test.dart';
import 'package:fluttertwo/class/auth.dart';
import 'package:fluttertwo/class/list_nft.dart';
import 'package:fluttertwo/class/user.dart';
import 'package:fluttertwo/functions/nft_api.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';

// Generate a MockClient using the Mockito package.
// Create new instances of this class in each test.
@GenerateMocks([http.Client])
void main() {
  group('Test API', () {
    test('Get User', () {
      expect(getUser("babypop@gmail.com", "test"), isA<Future<User?>>());
    });

    test('Get Bad User', () {
      expect(getUser("azerty@gmail.com", "test"), throwsException);
    });

    test('Get all NFTs', () {
      expect(initNFTs('618fed6eeac35cfd6d9e6c9e'), isA<Future<AllNFT?>>());
    });

    test('Get bad NFTs', () {
      expect(initNFTs('618fed6eeac35cfd6d9e6c9a'), throwsException);
    });
  });
}