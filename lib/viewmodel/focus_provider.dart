import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';

class FocusProvider extends ChangeNotifier {
final CountDownController controller = CountDownController();
bool isRunning = false;

void change(){
  isRunning=!isRunning;
  notifyListeners();

}



}