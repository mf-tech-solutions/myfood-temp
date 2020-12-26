import 'package:flutter/material.dart';

import '../../resource.dart';

class EmptyCard extends StatelessWidget {
  final Function onBackToMenuButtonTapHandler;

  const EmptyCard({
    Key key,
    @required this.onBackToMenuButtonTapHandler,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 96,
            width: 96,
            child: CircleAvatar(
              backgroundColor: Colors.black12,
              child: Icon(
                Icons.remove_shopping_cart_rounded,
                size: 36,
                color: Colors.black87,
              ),
            ),
          ),
          SizedBox(height: 12),
          Text(CartResource.emptyCart),
          SizedBox(height: 12),
          RaisedButton(
            elevation: 0,
            textColor: Colors.white,
            child: Text(CartResource.addToCartTitle),
            onPressed: onBackToMenuButtonTapHandler,
          ),
        ],
      ),
    );
  }
}
