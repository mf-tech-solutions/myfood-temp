import 'dart:math';

import 'package:flutter/material.dart';
import 'package:skeleton_text/skeleton_text.dart';

class HomeScreenLoader extends StatelessWidget {
  final skeletonColor = Colors.white;

  Widget get searchBox {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: SkeletonAnimation(
        shimmerColor: skeletonColor,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(48),
            color: Colors.black12,
          ),
          height: 48,
        ),
      ),
    );
  }

  Widget get categoriesTitle {
    return SkeletonAnimation(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(36),
          color: Colors.black38,
        ),
        height: 36,
        width: 144,
      ),
    );
  }

  Widget get categorySection {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SkeletonAnimation(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.black26,
            ),
            height: 30,
            width: 128,
          ),
        ),
        SizedBox(height: 24),
        ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: Random().nextInt(4) + 2,
          itemBuilder: (_, __) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.black12,
              ),
              height: 48,
            );
          },
          separatorBuilder: (_, __) {
            return SizedBox(height: 16);
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final padding = EdgeInsets.fromLTRB(12, 32, 12, 24);

    return ListView(
      padding: padding,
      children: [
        searchBox,
        SizedBox(height: 32),
        categoriesTitle,
        SizedBox(height: 40),
        categorySection,
        SizedBox(height: 32),
        categorySection,
      ],
    );
  }
}
