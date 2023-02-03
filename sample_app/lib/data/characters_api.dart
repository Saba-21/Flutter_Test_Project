import '../data_models/response.dart';
import 'dart:convert';
import 'package:http/http.dart';

const String apiAddress = 'https://rickandmortyapi.com/api/character';

class CharacterApi {
  Future<CharacterListResponse> getAllCharacters(int page) async {
    final url = Uri.parse('$apiAddress?page=$page');

    print('requesting page =====================================================================================================> $page');
    Response response = await get(url);

    if (response.statusCode == 200) {
      final data = CharacterListResponse.fromJson(jsonDecode(response.body));
      return data;
    } else {
      throw Exception('api error');
    }
  }
}
