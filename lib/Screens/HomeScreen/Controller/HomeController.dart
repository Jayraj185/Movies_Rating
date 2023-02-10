import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController
{
  Rx<TextEditingController> txtSearch = TextEditingController(text: "").obs;
  RxBool isOn = false.obs;
  RxString search = "".obs;
  void Search()
  {
    search.value = txtSearch.value.text;
  }
}