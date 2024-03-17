import 'package:project8/service/database.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
class DataLayer{
  final locator = GetIt.instance;
Future<void> setup() async {
await GetStorage.init();
locator.registerSingleton<DataBase>((DataBase()));
}}
