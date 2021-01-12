import 'package:flutter/material.dart';

import '../../../navigation/store/actionCreators.dart';
import '../../resource.dart';

class EmptyCard extends StatelessWidget {
  const EmptyCard({Key key}) : super(key: key);

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
          TextButton.icon(
            icon: Icon(Icons.add_rounded),
            label: Text(CartResource.addToCartTitle),
            onPressed: () => setCurrentIndex(0),
          ),
        ],
      ),
    );
  }
}
