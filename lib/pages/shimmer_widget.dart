import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:fluttertwo/widgets/cards.dart';

class ShimmerWidget extends StatelessWidget {
  final double width;
  final double height;
  final ShapeBorder shapeBorder;

  const ShimmerWidget.rectangular({
    this.width = double.infinity,
    required this.height,
  }) :this.shapeBorder = const RoundedRectangleBorder();

  const ShimmerWidget.circuler({
    required this.width,
    required this.height,
    this.shapeBorder = const CircleBorder(),
  });

  Widget build(BuildContext context) => Shimmer.fromColors(
    baseColor: Colors.grey[400]!,
    highlightColor: Colors.grey[300]!,
    child: Container(
    width: width,
    height: height,
    decoration: ShapeDecoration (
      color: Colors.grey[400]!,
      shape: shapeBorder
      ),
    ),
  );
}