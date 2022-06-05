import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:weather_app_ios/src/models/albums.dart';
import 'package:weather_app_ios/src/service/albums_service.dart';

import 'rest_test.mocks.dart';

class AlbumsRepoTest extends Mock implements AlbumsRepo {}

@GenerateMocks([AlbumsRepoTest])
void main() {
  late MockAlbumsRepoTest mockAlbumsRepoTest;
  late List<Albums>? albumModel = [Albums(id: 1, userId: 10, title: "Title")];

  setUpAll(() {
    mockAlbumsRepoTest = MockAlbumsRepoTest();
  });
  group("Test API Calls for Albums", () {
    test("Test get Albums from network", () async {
      when(mockAlbumsRepoTest.getAlbums()).thenAnswer((_) async {
        return albumModel;
      });
      List<Albums>? res = await mockAlbumsRepoTest.getAlbums();
      expect(res, isA<List<Albums>?>());
      expect(res, albumModel);
    });

    test("Error ", () async {
      when(mockAlbumsRepoTest.getAlbums()).thenAnswer((realInvocation) async {
        throw Exception("Error while fetching data");
      });
      expect(mockAlbumsRepoTest.getAlbums(), throwsException);
    });
  });
}
