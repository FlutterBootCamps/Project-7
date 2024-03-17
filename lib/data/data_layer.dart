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
  removeToken() async {
    if (token.isNotEmpty) {
     await box.remove("token");
    }
  }

  lognOut()async{

    if (token.isEmpty){
      await box.remove("token");
    }
  }

  getToken() {
    if (box.hasData("token")) {
      if (token.isEmpty) {
        token = box.read("token");
      }
    }
  }

}
