import 'package:flutter/material.dart';

import '../../components/alert_dialog.dart';
import '../../components/app_bar/app_bar.dart';
import '../../components/search_box.dart';
import '../../modules/food/components/search/search_result.dart';
import '../../modules/food/models/search_result.dart';
import '../../modules/food/resource.dart';
import '../../modules/food/store/selectors.dart';
import '../../utils.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  SearchResult _searchResult;

  Widget get _emptySearchTextWarning {
    return MyAlertDialog(
      title: Text(FoodResource.warning),
      content: Text(FoodResource.requiredSearchTextWarning),
      actions: [
        TextButton(
          child: Text(FoodResource.ok),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    );
  }

  void _search(String searchText) async {
    if (searchText.length == 0) {
      await Utils.showContentOnlyDialog(
        context: context,
        child: _emptySearchTextWarning,
      );
      return;
    }

    setState(() {
      _searchResult = search(searchText);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: ''),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 24, horizontal: 12),
        child: Column(
          children: [
            Hero(
              tag: 'foodSearchBox',
              child: Material(
                color: Colors.transparent,
                child: SearchBox(
                  elevation: 4,
                  autoFocus: true,
                  searchCallback: _search,
                ),
              ),
            ),
            SizedBox(height: 32),
            Expanded(
              child: SearchResultView(resultModel: _searchResult),
            ),
          ],
        ),
      ),
    );
  }
}
