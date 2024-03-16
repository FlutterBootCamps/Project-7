import 'package:cv_maker_app/pages/community_page.dart';
import 'package:cv_maker_app/pages/home_page.dart';
import 'package:cv_maker_app/services/db_service.dart';
import 'package:cv_maker_app/utils/colors.dart';
import 'package:cv_maker_app/utils/fonts.dart';
import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

class HomeData {
  HomeData() {
    getToken();
    getUserId();
    refreshToken();
  }

  DateTime? currentlySelectedStartDate;
  DateTime? currentlySelectedEndDate;

  final box = GetStorage();

  int currentPageIndex = 0;
  List<Widget> pageList = [const HomePage(), const CommunityPage()];

  String token = "";
  String currentUserId = "";

  void addToken() async {
    if (token.isNotEmpty) {
      await box.write("token", token);
    }
  }

  void getToken() {
    token = box.read("token") ?? "";
  }

  void removeToken() async {
    if (token.isNotEmpty) {
      await box.remove("token");
    }
  }

  void getUserId() async {
    if (token.isNotEmpty) {
      currentUserId = await DBService().getUserId(token: token);
    }
  }

  void refreshToken() async {
    if (!await DBService().isTokenExpired()) {
      await DBService().refreshToken();
      token = DBService().supabase.auth.currentSession!.accessToken;
      currentUserId = await DBService().getUserId(token: token);
    } else {
      await DBService().signout();
      token = "";
      currentUserId = "";
      removeToken();
    }
  }

  String formatDate(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }

  Future<DateTime?> showCustomDatePicker(BuildContext context) async {
    return await showDatePickerDialog(
      context: context,
      maxDate: DateTime(2120, 1, 1),
      minDate: DateTime(1980, 1, 1),
      currentDateDecoration: BoxDecoration(
          color: noColor,
          shape: BoxShape.circle,
          border: Border.all(color: brownColor, width: 3)),
          currentDateTextStyle: const TextStyle(color: brownColor, fontFamily: nohemiFont, fontSize: 16, fontWeight: FontWeight.w600),
          highlightColor: brownColor,
          daysOfTheWeekTextStyle: const TextStyle(color: brownColor, fontFamily: nohemiFont, fontSize: 14, fontWeight: FontWeight.w500),
          leadingDateTextStyle: const TextStyle(color: brownColor, fontFamily: nohemiFont, fontSize: 20, fontWeight: FontWeight.w600),
          enabledCellsTextStyle: const TextStyle(color: brownColor, fontFamily: nohemiFont, fontSize: 14, fontWeight: FontWeight.w500),
          splashColor: brownColor
          
    );
  }
}
