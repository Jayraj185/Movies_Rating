import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:movies_rating/Screens/HomeScreen/View/HomePage.dart';
import 'package:sizer/sizer.dart';

void main()
{
  runApp(
    Sizer(
        builder: (context, orientation, deviceType) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            routes: {
              '/' : (context) => HomePage()
            },
          );
        },
    ),
  );
}