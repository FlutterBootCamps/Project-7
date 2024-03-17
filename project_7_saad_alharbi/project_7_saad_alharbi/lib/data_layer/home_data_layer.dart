import 'package:get_storage/get_storage.dart';

class HomeData {
  final box = GetStorage();

  String token = '';
  String id = '';

  HomeData() {
    getToken();
  }

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

  removeToken() async {
    await box.remove("token");
  }
}
