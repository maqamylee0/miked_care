import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:miked_care/Utils/image_assets_constants.dart';
import 'package:miked_care/features/auth/models/user.dart';
import 'package:miked_care/services/appointment_service.dart';

import '../features/appointment/models/appointment.dart';
import '../services/auth.dart';

class UserProvider extends ChangeNotifier{

     late Users user;
     bool isLoaded = false;
     bool photonull = true;
     String username ='';
     String photoUrl='';
     var _auth ;
      AppointmentService appointmentService= AppointmentService();
      List appointments =[];

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
    photoUrl = 'assets/personimage/emily.jpg';
    if (kDebugMode) {
      print(isLoaded);
    }
    notifyListeners();
    // getAppointments(user.uid);
  }
     // Future<List> getAppointments(userId) async {
     //   appointments = await appointmentService.getAppointments(userId);
     //   // username = user.name!;
     //   notifyListeners();
     //   print('apppppppppppppppppppppppp ${appointments.length}');
     //   return appointments;
     // }


}