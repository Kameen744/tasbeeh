import 'package:get_it/get_it.dart';
import 'package:tasbeeh/scoped_models/counter_model.dart';
import 'package:tasbeeh/scoped_models/dhikr_model.dart';
import 'package:tasbeeh/scoped_models/home_model.dart';
import 'package:tasbeeh/scoped_models/records_model.dart';
import 'package:tasbeeh/services/counter_service.dart';
import 'package:tasbeeh/services/database_service.dart';
import 'package:tasbeeh/services/storage_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  //  register services
  locator.registerLazySingleton<StorageService>(() => StorageService());
  locator.registerLazySingleton<CounterService>(() => CounterService());
  locator.registerLazySingleton<DatabaseService>(() => DatabaseService());
  //  register models
  locator.registerFactory<CounterModel>(() => CounterModel());
  locator.registerFactory<HomeModel>(() => HomeModel());
  locator.registerFactory<DhikrModel>(() => DhikrModel());
  locator.registerFactory<RecordsModel>(() => RecordsModel());
}
