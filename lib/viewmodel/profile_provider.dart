import 'package:flutter/cupertino.dart';

class ProfileProvider extends ChangeNotifier{
//---Change Account Password Section------------------------------------------------>>>
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPassWordController= TextEditingController();

  //--visibility passwords :-------------------------------------->>>
  bool _obscureOld = true;
  bool _obscureNew = true;
  bool get obscureOld => _obscureOld;
  bool get obscureNew => _obscureNew;

  void toggleOldPasswordVisibility(){
    _obscureOld = !_obscureOld;
    notifyListeners();
  }

  void toggleNewPasswordVisibility(){
    _obscureNew = !_obscureNew;
    notifyListeners();
  }

  bool processPasswordChange(){
    String oldPass = oldPasswordController.text;
    String newPass = newPassWordController.text;

    if(oldPass.isEmpty || newPass.isEmpty){
      return false;
    }
    if(oldPass == newPass){
      return false;
    }
    return true;
  }



}
