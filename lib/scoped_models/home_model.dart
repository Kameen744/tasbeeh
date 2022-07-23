import 'package:tasbeeh/scoped_models/base_model.dart';

class HomeModel extends BaseModel {
  setTheme(String theme) {
    storageService.setTheme(theme: theme, db: baseDB);
    initTheme();
  }

  resetCounter() {
    storageService.resetCounter();
  }
}
