import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';
import 'package:tasbeeh/scoped_models/base_model.dart';

class CounterModel extends BaseModel {
  int maxIndex = 0;
  double maxCounted = 0;
  bool sound = false;
  final player = AudioCache();

  CounterModel() {
    if (mode == 'prayer') {
      maxCounted = dhikrs[dhikrId].dNumber.toDouble();
      maxIndex = 3;
    } else {
      maxIndex = dhikrs.length;
      maxCounted = 9999999;
    }
  }

  bool continueIndex() {
    if (dhikrId < maxIndex) {
      return true;
    }
    return false;
  }

  bool continueCount() {
    if (counted < maxCounted - 1) {
      return true;
    }
    return false;
  }

  void incrementCounter() {
    if (continueIndex()) {
      if (continueCount()) {
        counted++;
        clickSound();
      } else {
        // set dhikrId(dhikrId + 1);
        dhikrId = dhikrId + 1;
        resetCounter();
      }
    }
    notifyListeners();
  }

  void resetCounter() {
    counted = 0;
    maxCounted = dhikrs[dhikrId].dNumber.toDouble();
    notifyListeners();
  }

  saveCounts() {
    String title = dhikrs[dhikrId].title;
    int id = dhikrs[dhikrId].id;
    String image = dhikrs[dhikrId].image;
    String createdAt = DateTime.now().toString();

    storageService.saveCounts(
      data: [id, title, counted, image, createdAt],
      db: baseDB,
    );
  }

  soundOn() {
    sound = !sound;
    notifyListeners();
  }

  decreamentCounter() {
    if(counted > 0) {
      counted -= 1;
    }
    notifyListeners();
  }

  void clickSound() {
    if(sound) {
      player.play('sound/click.wav');
    }
  }
}
