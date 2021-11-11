import 'package:flutter/cupertino.dart';
import 'package:fluttertwo/widgets/shimmer_widget.dart';

Widget buildNftShimmer() => Padding(
  padding: const EdgeInsets.all(10),
  child: ShimmerWidget.circular(
    width: 10,
    height: 10,
    shapeBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15)
    ),
  )
);