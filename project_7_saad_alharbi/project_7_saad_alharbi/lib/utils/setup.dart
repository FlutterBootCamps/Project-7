import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:project_7_saad_alharbi/data_layer/home_data_layer.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

databaseConfig() async {
  await dotenv.load(fileName: ".env");
  await Supabase.initialize(
      url: dotenv.env["UrlSupabase"]!,
      anonKey: dotenv.env["AnonKeySupabase"]!);
}

setup() async {
  await GetStorage.init();
  GetIt.I.registerSingleton<HomeData>(HomeData());
}
