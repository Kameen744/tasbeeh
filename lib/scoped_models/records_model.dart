import 'package:tasbeeh/scoped_models/base_model.dart';
import 'package:tasbeeh/screens/counter_screen.dart';

class RecordsModel extends BaseModel {
  // List records = [];
  // List getSavedRecords() {
  //   return storageService.getAllSavedCount(db: baseDB);
  // }

  Future<List<dynamic>> getRecords() async {
    records = await storageService.getAllSavedCount(db: baseDB);
    if (records.length > 0) {
      return records;
    } else {
      return [];
    }
  }

  resumeCount({
    required id,
    required title,
    required prevCount,
    required context,
  }) async {
    setMode(title);
    setDhikrId(id);
    setCounts(prevCount);
    gotoPage(context, CounterScreen());
  }

  deleteRecord(dhikrId) {
    storageService.deleteCountRecord(db: baseDB, id: dhikrId);
  }

  // Future getSavedRecords() async {
  //   records = await storageService.getAllSavedCount(db: baseDB);
  //   print(records);
  // }
}
