import 'package:get_storage/get_storage.dart';


class HomeData {
  final box = GetStorage();

  String token = '';
  String id = '';


  addToken() async {
    if (token.isNotEmpty) {
      await box.write("token", token);
    }
    box.save();
  }

  getToken() {
    if (box.hasData("token")) {
      if (token.isEmpty) {
        token = box.read("token");
      }
    }
  }
     removeToken() async{
      if (token.isNotEmpty) {
         await box.remove("token");
    }
  }


}