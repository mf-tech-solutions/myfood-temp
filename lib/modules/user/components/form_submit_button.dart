import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart' show StoreConnector;

import '../../../store/state.dart';

typedef FunctionWithContext = void Function(BuildContext context);

class FormSubmitButton extends StatelessWidget {
  final FunctionWithContext onSubmit;
  final String text;

  const FormSubmitButton({
    Key key,
    @required this.onSubmit,
    @required this.text,
  }) : super(key: key);

  Widget getButton(BuildContext context, bool loading) {
    final backgroundColor = Theme.of(context).primaryColor;
    final text = Text(this.text);
    final textColor = Colors.white;
    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(48),
    );
    final elevation = 2.0;

    if (loading)
      return RaisedButton.icon(
        color: backgroundColor,
        icon: SizedBox(
          height: 24,
          width: 24,
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            strokeWidth: 4,
          ),
        ),
        label: text,
        textColor: textColor,
        elevation: elevation,
        shape: shape,
        onPressed: null,
      );

    return RaisedButton(
      color: backgroundColor,
      child: text,
      textColor: textColor,
      elevation: elevation,
      shape: shape,
      onPressed: () => this.onSubmit(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, bool>(
      converter: (store) => store.state.userState.loading,
      builder: (BuildContext context, bool loading) {
        return SizedBox(
          height: 48,
          child: getButton(context, loading),
        );
      },
    );
  }
}
