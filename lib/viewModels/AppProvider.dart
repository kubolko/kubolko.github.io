import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {
  List<Widget> elementsList = [];

  void addElement(Widget element) {
    elementsList.add(element);
    notifyListeners(); // Notify listeners to rebuild widgets
  }

  getElementsList() {
    return elementsList;
  }

  void removeElement(Widget element) {
    elementsList.remove(element);
    notifyListeners(); // Notify listeners to rebuild widgets
  }
}
