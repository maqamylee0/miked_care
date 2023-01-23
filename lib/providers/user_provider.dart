import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:miked_care/Utils/image_assets_constants.dart';
import 'package:miked_care/features/auth/models/user.dart';

import '../services/auth.dart';

class UserProvider extends ChangeNotifier{

     late Users user;
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
    user = await _auth.getUserDetails() ;
    isLoaded = true;
    photonull = false;
    username  = user.name!;
    photoUrl = user.photoUrl!;
    if (kDebugMode) {
      print(isLoaded);
    }
    notifyListeners();
  }


}