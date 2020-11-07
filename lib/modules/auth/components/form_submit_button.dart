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
    final accentColor = Theme.of(context).accentColor;
    final text = Text(this.text);
    final textColor = Colors.white;
    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(48),
    );

    if (loading)
      return RaisedButton.icon(
        color: accentColor,
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
        elevation: 0,
        shape: shape,
        onPressed: () => this.onSubmit(context),
      );

    return RaisedButton(
      color: accentColor,
      child: text,
      textColor: textColor,
      elevation: 0,
      shape: shape,
      onPressed: () => this.onSubmit(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, bool>(
      converter: (store) => store.state.authState.loading,
      builder: (BuildContext context, bool loading) => SizedBox(
        height: 48,
        child: getButton(context, loading),
      ),
    );
  }
}
