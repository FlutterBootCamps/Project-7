import 'package:cv_maker_app/pages/community_page.dart';
import 'package:cv_maker_app/pages/home_page.dart';
import 'package:cv_maker_app/services/db_service.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class HomeData {

  HomeData(){
    getToken();
    getUserId();
  }

  final box = GetStorage();

  int currentPageIndex = 0;
  List<Widget> pageList = [
    const HomePage(),
    const CommunityPage()
  ];

  String token = "";
  String currentUserId = "";

  void addToken() async{
    if (token.isNotEmpty){
      await box.write("token", token);
    }
  }

  void getToken(){
    token = box.read("token") ?? "";
  }

  void removeToken() async{
    if(token.isNotEmpty){
      await box.remove("token");
    }
  }

  void getUserId() async {
    if(token.isNotEmpty){
      currentUserId = await DBService().getUserId(token: token);
    }
  }
}