import 'package:flutter/material.dart';

import '../../corre/screens.dart';
import '../../corre/my_cache_key.dart';
import '../../data/data_score/my_cache.dart';
import '../../data/models/onbording_model.dart';


class OnBoardingProvider with ChangeNotifier{
  bool isLast = false;

  PageController onBoardingPageController = PageController();

  final List<OnBoardingModel> onBoardingList = [
    OnBoardingModel(
      image: 'assets/sammy-finance.gif',
      title: 'First Title',
      body: 'TestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTest',
    ),
    OnBoardingModel(
      image: 'assets/sammy-searching.gif',
      title: 'Second Title',
      body: 'TestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTest',
    ),
    OnBoardingModel(
      image: 'assets/sammy-service-support.gif',
      title: 'Third Title',
      body: 'TestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTest',
    ),
  ];

  void finishOnBoarding(BuildContext context){
    MyCache.putBool(key: MyCacheKeys.isOnBoardingViewed, value: isLast);
    Navigator.pushNamedAndRemoveUntil(context, loginScreen, (route) => false);
  }

  void checkIfLast(int index){
    if(index == onBoardingList.length-1){
      isLast = true;
    }else{
      isLast = false;
    }
    notifyListeners();
  }

}