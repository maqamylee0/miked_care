import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:miked_care/Utils/image_assets_constants.dart';
import 'package:miked_care/features/auth/models/user.dart';

import '../services/auth.dart';

class UserProvider extends ChangeNotifier{

     late UserModel _user;
     bool isLoaded = false;
     bool photonull = true;
     String username ='';
     String photoUrl='';
     var _auth ;

    UserProvider(){
      _auth = Auth();
      isLoaded = false;
       getUserDetails();
    }


  void getUserDetails() async {
    _user = await _auth.getUserDetails() as UserModel;
    isLoaded = true;
    photonull = false;
    username  = _user.name!;
    photoUrl = _user.photoUrl!;
    if (kDebugMode) {
      print(isLoaded);
    }
    notifyListeners();
  }


}