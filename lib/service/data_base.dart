import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:project7/service/db.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../data/data_layer.dart';

class DataInjection{
  final locator = GetIt.I;

  void setup(){
    locator.registerSingleton<DBService>(DBService());
  }

}

databaseConfig()async{
    await dotenv.load(fileName: ".env");
   await Supabase.initialize(
    url: dotenv.env["urlSupabase"]!,
    anonKey: dotenv.env["aninoKeySup"]!,
  );
}


Future<void> setup() async {
  await GetStorage.init();
  GetIt.instance;
  GetIt.I.registerSingleton<HomeData>(HomeData());
 
} 


