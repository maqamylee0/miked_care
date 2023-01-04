import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../appointment/widgets/dashboard_button.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(

                  child: IconButton(onPressed:(){
                    Navigator.of(context).pop();
                  }, icon: Icon(Icons.arrow_back_ios, color: Colors.grey)),
                ),

                Align(
                  alignment: Alignment.center,
                  child: Text("Edit Profile",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: 10,),

                Align(
                  alignment: Alignment.center,
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage("assets/emily.jpg"), fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(100)
                    ),
                    height: 100,
                    width: 100,

                  ),
                ),
                SizedBox(height: 20,),
                TextFormField(
                  keyboardType: TextInputType.text,
                  // controller: _emailController,

                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  // validator: (email) =>
                  // email != null && EmailValidator.validate(email)
                  //     ? null
                  //     : "Enter valid Email",

                  decoration: InputDecoration(
                    labelText: 'FullName',
                    hintText: 'Sarah Doe',
                    // Here is key idea


                    suffixIcon: IconButton(
                      icon: Icon(Icons.edit_outlined),
                      color: Colors.grey,
                      onPressed: () {

                      },
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                TextFormField(
                  keyboardType: TextInputType.text,
                  // controller: _emailController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  // validator: (email) =>
                  // email != null && EmailValidator.validate(email)
                  //     ? null
                  //     : "Enter valid Email",
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    hintText: '+2348080110323',
                    // Here is key idea
                    suffixIcon: IconButton(
                      icon: Icon(Icons.edit_outlined),
                      color: Colors.grey,
                      onPressed: () {

                      },
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                TextFormField(
                  keyboardType: TextInputType.text,
                  // controller: _emailController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  // validator: (email) =>
                  // email != null && EmailValidator.validate(email)
                  //     ? null
                  //     : "Enter valid Email",
                  decoration: InputDecoration(
                    labelText: 'Email Address',
                    hintText: 'sarahdoe@gmail.com',
                    // Here is key idea
                    suffixIcon: IconButton(
                      icon: Icon(Icons.edit_outlined),
                      color: Colors.grey,
                      onPressed: () {

                      },
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                TextFormField(
                  keyboardType: TextInputType.text,
                  // controller: _emailController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  // validator: (email) =>
                  // email != null && EmailValidator.validate(email)
                  //     ? null
                  //     : "Enter valid Email",
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: '*************',
                    // Here is key idea
                    suffixIcon: IconButton(
                      icon: Icon(Icons.edit_outlined),
                      color: Colors.grey,
                      onPressed: () {

                      },
                    ),
                  ),
                ),
                SizedBox(height: 50,),
                SizedBox(
                  height: 50,
                  child: LargeButton(title:"Save", path: 'profile',),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
