import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VerifySuccess extends StatefulWidget {
  const VerifySuccess({Key? key}) : super(key: key);

  @override
  State<VerifySuccess> createState() => _VerifySuccessState();
}

class _VerifySuccessState extends State<VerifySuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(

        child:
        Column(
          children: [
            SizedBox(height: 100,),
            Icon(Icons.check_circle_outline_outlined,size: 100,color: Colors.cyanAccent),
            SizedBox(height: 50,),
            Text("Verification Successful",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
            Padding(padding:EdgeInsets.all(20),
            child:
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(55), // fromHeight use double.infinity as width and 40 is the height
                ),
                onPressed: () {onPressed();},
                child: const Text('Continue',style: TextStyle(color: Colors.white),)
            ) ,)
          ],
        )
      ),
    );
  }

  void onPressed() {}
}
