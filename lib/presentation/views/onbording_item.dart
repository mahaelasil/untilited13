
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../data/models/onbording_model.dart';

import '../widgets/defult_text.dart';

class OnBoardingItem extends StatelessWidget {
  final OnBoardingModel model;

  const OnBoardingItem({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 4,
          child: Image.asset(
            model.image,
            fit: BoxFit.contain,
          ),
        ),
        Flexible(
          child: Padding(
            padding: EdgeInsets.only(top: 2.h, bottom: 3.h),
            child: DefaultText(
              text: model.title,
              maxLines: 2,
              textAlign: TextAlign.start,
              textSize: 20.sp,
              weight: FontWeight.bold,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        Flexible(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: DefaultText(
              text: model.body,
              maxLines: 4,
              textAlign: TextAlign.center,
              textSize: 14.sp,
              weight: FontWeight.bold,
              overflow: TextOverflow.ellipsis,
              textColor: Colors.grey[700],
            ),
          ),
        ),
      ],
    );
  }
}