import 'package:flutter/material.dart';
import 'package:sample_app/screens/home/character_item.dart';
import 'package:sample_app/data_models/character.dart';
import 'package:sample_app/ui_components/error_dialog.dart';
import 'package:sample_app/ui_components/loader.dart';
import '../../data/characters_api.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import '../../ui_components/web_header.dart';

class CharacterList extends StatefulWidget {
  const CharacterList({Key? key}) : super(key: key);

  @override
  State<CharacterList> createState() => _CharacterListState();
}

class _CharacterListState extends State<CharacterList> {
  late bool _isLastPage;
  late int _pageNumber;
  late bool _error;
  late bool _loading;

  late List<Character> _characters;
  late ScrollController _scrollController;

  CharacterApi api = CharacterApi();

  @override
  void initState() {
    super.initState();
    _pageNumber = 1;
    _characters = [];
    _isLastPage = false;
    _loading = true;
    _error = false;
    _scrollController = ScrollController();
    fetchData();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  fetchData() async {
    try {
      final data = await api.getAllCharacters(_pageNumber);
      setState(() {
        _isLastPage = data.results.length < 20;
        _loading = false;
        _pageNumber = _pageNumber + 1;
        _characters.addAll(data.results);

        print(
            "total characters --------------------------------------------------------------------------------${_characters.length}");
      });
    } catch (e) {
      setState(() {
        _loading = false;
        _error = true;
      });
    }
  }

  retry() {
    setState(() {
      _loading = true;
      _error = false;
      fetchData();
    });
  }

  void setupScrollListener() {
    _scrollController.addListener(() {
      var nextPageTrigger = 0.8 * _scrollController.position.maxScrollExtent;
      if (_scrollController.position.pixels > nextPageTrigger &&
          !_loading &&
          !_isLastPage) {
        _loading = true;
        fetchData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    setupScrollListener();
    return createListWithState();
  }

  Widget createListWithState() {
    if (_characters.isEmpty) {
      if (_loading) {
        return const Center(child: LoaderIndicator());
      } else if (_error) {
        return Center(child: ErrorDialog(retry));
      }
    }
    var webIndexDiff = kIsWeb ? 1 : 0;
    return ListView.builder(
        controller: _scrollController,
        itemCount: _characters.length +
            (_isLastPage ? 0 + webIndexDiff : 1 + webIndexDiff),
        itemBuilder: (context, index) {
          if (index + webIndexDiff == _characters.length) {
            if (_error) {
              return Center(child: ErrorDialog(retry));
            } else {
              return const Center(child: LoaderIndicator());
            }
          } else {
            if (index == 0 && kIsWeb) {
              return const WebHeader();
            } else {
              return CharacterItem(_characters[index - webIndexDiff]);
            }
          }
        });
  }
}
