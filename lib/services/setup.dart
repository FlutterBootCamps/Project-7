import 'package:cv_app/services/data_service.dart';
import 'package:get_it/get_it.dart';

class DataInjection {
  final locater = GetIt.instance;

  Future<void> setup() async {
   await locater.registerSingleton(DataBase());
  }
}
