import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tasbeeh/enums/view_state.dart';
import 'package:tasbeeh/models/dhikr_data_model.dart';
import 'package:tasbeeh/services/database_service.dart';
import 'package:tasbeeh/services/service_locator.dart';
import 'package:tasbeeh/services/storage_service.dart';

class BaseModel extends Model {
  BaseModel() {
    initApp();
  }

  ViewState state = ViewState.loadinApp;
  late Database baseDB;
  bool themeDark = false;
  List<DhikrDataModel> dhikrs = locator<DatabaseService>().dhikrs;
  StorageService storageService = locator<StorageService>();
  DatabaseService databaseService = locator<DatabaseService>();
  ArabicNumbers arabicNumber = ArabicNumbers();
  String mode = locator<StorageService>().mode;
  int dhikrId = locator<StorageService>().dhikrId;
  List records = [];
  int counted = locator<StorageService>().counts;

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  AndroidInitializationSettings initializationSettingsAndroid =
  AndroidInitializationSettings('assets/images/logo.png');

  AndroidNotificationDetails androidPlatformChannelSpecifics =
  AndroidNotificationDetails('tasbeehId', 'tasbeehName', 'tasbeehDescription');

  initApp() async {
    setState(ViewState.loadinApp);
    baseDB = await databaseService.createDatabase();
    initTheme();
    setState(ViewState.retrieved);
  }

  initTheme() async {
    String theme = await storageService.getTheme(db: baseDB);
    if (theme == 'light') {
      themeDark = false;
    } else {
      themeDark = true;
    }
    setState(ViewState.retrieved);
  }

  setState(ViewState newState) {
    state = newState;
    notifyListeners();
  }

  setDhikrId(int sId) {
    locator<StorageService>().setDhikrId(sId);
  }

  setMode(String sMode) {
    locator<StorageService>().setMode(sMode);
  }

  setCounts(int count) {
    locator<StorageService>().setCounted(count);
  }

  double width(context) {
    return MediaQuery.of(context).size.width;
  }

  double height(context) {
    return MediaQuery.of(context).size.height;
  }

  double hPercent(context, percent) {
    return (height(context) / 100) * percent;
  }

  double wPercent(context, percent) {
    return (width(context) / 100) * percent;
  }

  Future gotoPage(context, page) async {
    await Navigator.push(
        context, MaterialPageRoute(builder: (context) => page));
  }

  Future gotoBack(context) async {
    Navigator.pop(context);
  }

  selectNotification(String payload) async {
    debugPrint('notification payload: $payload');

  }
}
