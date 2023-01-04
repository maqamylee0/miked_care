import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:miked_care/Utils/image_assets_constants.dart';
import 'package:miked_care/features/auth/models/user.dart';

import '../services/auth.dart';

class UserProvider extends ChangeNotifier{

     late UserModel _user;
     bool isLoaded = false;
     bool photonull = true;
     var _auth ;

    UserProvider(){
      _auth = Auth();
      isLoaded = false;
       getUserDetails();
    }


   String? getUserName() => _user.name;
   Future<String?> getPhotoUrl() async {
     return await getPhoto();
   }




     // void setUserProvider(){
   //    user = auth.getUserDetails() as UserModel;
   //    notifyListeners();
   //  }
     Future<String?> getPhoto() async {
       if(isLoaded == true && _user.photoUrl != null)
       photonull = false;
       notifyListeners();
       if (kDebugMode) {
         print(isLoaded);
       }
       return _user.photoUrl;
     }
  void getUserDetails() async {
    _user = await _auth.getUserDetails() as UserModel;
    isLoaded = true;
    notifyListeners();
    if (kDebugMode) {
      print(isLoaded);
    }
  }


}