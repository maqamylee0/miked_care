import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miked_care/features/appointment/widgets/dashboard_button.dart';

class AppointmentFormPage extends StatefulWidget {
  const AppointmentFormPage({Key? key}) : super(key: key);

  @override
  State<AppointmentFormPage> createState() => _AppointmentFormPageState();
}

class _AppointmentFormPageState extends State<AppointmentFormPage> {
  late int selectedRadioTile;
  late int selectedRadio;
  late int selectedRadioTile2;
  late int selectedRadio2;

  @override
  void initState() {
    super.initState();
    selectedRadio = 1;
    selectedRadioTile = 1;
    selectedRadio2 = 1;
    selectedRadioTile2 = 1;
  }
  setSelectedRadioTile2(int val) {
    setState(() {
      selectedRadioTile2 = val;

    });
  }
  setSelectedRadioTile(int val) {
    setState(() {
      selectedRadioTile = val;

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(

                child: IconButton(onPressed:(){
                  Navigator.of(context).pop();
                }, icon: Icon(Icons.arrow_back_ios, color: Colors.grey)),
              ),
              Center(
                child: SizedBox(
                  height: 50,
                  width: 150,
                  child: Image.asset("assets/logo_black.png",
                      height: 200, width: 300),

                  //Image.asset("assets/img.png")
                ),
              ),
              Align(
                child: Text("Book appointment",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 27,
                        fontWeight: FontWeight.bold)),
              ),
              SizedBox(
                height: 20,
              ),

              Text("1. What kind of therapy would you like to have?",style:TextStyle(fontWeight: FontWeight.w600,fontSize:20 ),),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Expanded(
                      child: RadioListTile(
                        value: 1,
                        groupValue: selectedRadioTile,
                        contentPadding: EdgeInsets.all(0),
                        title: Text("Individual"),
                        dense: true,

                        // subtitle: Text("Radio 1 Subtitle"),
                        onChanged: (val) {
                          print("Radio Tile pressed $val");
                          setSelectedRadioTile(val!);
                        },
                        activeColor: Colors.cyanAccent,
                        // secondary: OutlineButton(
                        //   child: Text("Say Hi"),
                        //   onPressed: () {
                        //     print("Say Hello");
                        //   },
                        // ),
                        selected: true,
                      ),
                    ),

                    Expanded(
                      child: RadioListTile(
                        value: 2,
                        groupValue: selectedRadioTile,
                        title: Text("Couple"),
                        contentPadding: EdgeInsets.all(0),
                        dense: true,

                        // subtitle: Text("Radio 2 Subtitle"),
                        onChanged: (val) {
                          print("Radio Tile pressed $val");
                          setSelectedRadioTile(val!);
                        },
                        activeColor: Colors.cyanAccent,
                        // secondary: OutlineButton(
                        //   child: Text("Say Hi"),
                        //   onPressed: () {
                        //     print("Say Hello");
                        //   },
                        // ),
                        selected: false,
                      ),
                    ),
                    Expanded(
                      child: RadioListTile(
                        value: 3,
                        groupValue: selectedRadioTile,
                        title: Text("Family"),
                        contentPadding: EdgeInsets.all(0),
                        dense: true,
                        // subtitle: Text("Radio 2 Subtitle"),
                        onChanged: (val) {
                          print("Radio Tile pressed $val");
                          setSelectedRadioTile(val!);
                        },
                        activeColor: Colors.cyanAccent,
                        // secondary: OutlineButton(
                        //   child: Text("Say Hi"),
                        //   onPressed: () {
                        //     print("Say Hello");
                        //   },
                        // ),
                        selected: false,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 5,),

              Text("2. What kind of therapy would you like to have?",style:TextStyle(fontWeight: FontWeight.w600,fontSize:20 ),),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Expanded(
                      child: RadioListTile(
                        value: 1,
                        groupValue: selectedRadioTile2,
                        contentPadding: EdgeInsets.all(0),
                        title: Text("Fexible"),
                        dense: true,

                        // subtitle: Text("Radio 1 Subtitle"),
                        onChanged: (val) {
                          print("Radio Tile pressed $val");
                          setSelectedRadioTile2(val!);
                        },
                        activeColor: Colors.cyanAccent,
                        // secondary: OutlineButton(
                        //   child: Text("Say Hi"),
                        //   onPressed: () {
                        //     print("Say Hello");
                        //   },
                        // ),
                        selected: true,
                      ),
                    ),

                    Expanded(
                      child: RadioListTile(
                        value: 2,
                        groupValue: selectedRadioTile2,
                        title: Text("Structure"),
                        contentPadding: EdgeInsets.all(0),
                        dense: true,

                        // subtitle: Text("Radio 2 Subtitle"),
                        onChanged: (val) {
                          print("Radio Tile pressed $val");
                          setSelectedRadioTile2(val!);
                        },
                        activeColor: Colors.cyanAccent,
                        // secondary: OutlineButton(
                        //   child: Text("Say Hi"),
                        //   onPressed: () {
                        //     print("Say Hello");
                        //   },
                        // ),
                        selected: false,
                      ),
                    ),

                  ],
                ),
              ),
              SizedBox(height: 5,),
              Text("3. Set the date and time you would like to have the therapy",style:TextStyle(fontWeight: FontWeight.w600,fontSize:20 ),),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(" Date",style:TextStyle(fontWeight: FontWeight.w600,fontSize:20 ),),
              ),

              TextFormField(
                keyboardType: TextInputType.text,
                // controller: _emailController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                // validator: (email) =>
                // email != null && EmailValidator.validate(email)
                //     ? null
                //     : "Enter valid Email",
                decoration: InputDecoration(
                  labelText: '02/04/2022',
                  // hintText: '02/04/2022',
                  // Here is key idea
                  prefixIcon: IconButton(
                    icon: Icon(Icons.arrow_drop_down),
                    color: Colors.grey,
                    onPressed: () {

                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(" Time",style:TextStyle(fontWeight: FontWeight.w600,fontSize:20 ),),
              ),

              TextFormField(
                keyboardType: TextInputType.text,
                // controller: _emailController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                // validator: (email) =>
                // email != null && EmailValidator.validate(email)
                //     ? null
                //     : "Enter valid Email",
                decoration: InputDecoration(
                  labelText: '08:00 pm',
                  hintText: '02/04/2022',
                  // Here is key idea
                  prefixIcon: IconButton(
                    icon: Icon(Icons.arrow_drop_down),
                    color: Colors.grey,
                    onPressed: () {

                    },
                  ),
                ),
              ),
              SizedBox(height: 20,),
              SizedBox(
                height: 55,
                  child: LargeButton(title: "Continue",))
            ],
          ),
        ),
      ),
    );
  }
}
