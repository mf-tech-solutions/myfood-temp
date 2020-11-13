import 'package:flutter/material.dart';

typedef SearchCallback = void Function(String text);

class SearchBox extends StatelessWidget {
  final _height = 48.0;
  final _inputController = TextEditingController();

  final double elevation;

  final bool autoFocus;
  final String hintText;
  final SearchCallback searchCallback;
  final Function onTapCallback;

  SearchBox({
    Key key,
    this.elevation = 1,
    this.autoFocus = false,
    this.hintText = 'Pesquisar',
    this.searchCallback,
    this.onTapCallback,
  }) : super(key: key);

  Widget getInput() {
    return TextField(
      autofocus: autoFocus,
      textInputAction: TextInputAction.search,
      controller: _inputController,
      onEditingComplete: () => searchCallback(_inputController.text),
      onTap: onTapCallback,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hintText,
        prefixIcon: Icon(Icons.search_rounded),
        contentPadding: EdgeInsets.symmetric(
          vertical: (_height - 20) / 2,
          horizontal: 16,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: SizedBox(
        height: _height,
        width: double.infinity,
        child: Material(
          color: Colors.white,
          elevation: elevation,
          borderRadius: BorderRadius.circular(_height),
          child: getInput(),
        ),
      ),
    );
  }
}
