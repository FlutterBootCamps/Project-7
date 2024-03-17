import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:try_auth_suba/api/serves.dart';




class gitIt{
  final locator = GetIt.instance;
void init()async{
  await GetStorage.init();
  locator.registerSingleton<Serves>(Serves());
}
}