import 'package:flutter/material.dart';

class BottomNavProvider extends ChangeNotifier { 

    int currentIndex = 0;

      bool showPopup = false;


  dynamic socketIo;

  updatePopUp(bool pop) {
    showPopup = pop;
    notifyListeners();
  }


  setNavbarIndex(index) {
    if (index==2) {
      showPopup =true;   
    }else{
        currentIndex = index;
      showPopup =false;
    }
    notifyListeners();
  }

}