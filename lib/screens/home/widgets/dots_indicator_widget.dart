import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';

class CustomDotsIndicator extends StatelessWidget {
  final int pageLength;
  final double currentIndex;

  CustomDotsIndicator(this.pageLength, this.currentIndex);

  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      dotsCount: pageLength,
      position: currentIndex,
      decorator: DotsDecorator(
          activeColor: Theme.of(context).accentColor,
          spacing: EdgeInsets.all(5)),
    );
  }
}
