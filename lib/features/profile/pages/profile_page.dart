import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:miked_care/features/profile/pages/about_us.dart';
import 'package:miked_care/features/profile/pages/edit_profile.dart';
import 'package:miked_care/features/profile/pages/faq_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    String pathToIcon = 'assets/icons/logout.svg';
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               Text("Profile",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 27,
                          fontWeight: FontWeight.bold)),

                Align(
                  alignment: Alignment.center,
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage("assets/emily.jpg"), fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(100)
                    ),
                    height: 90,
                    width: 90,

                  ),
                ),
                SizedBox(height: 10,),
                Text("Account",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600),),
                Divider(
                  indent: 2,
                  endIndent: 5,
                  color: Colors.purple,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Edit Profile",style: TextStyle(color: Colors.grey)),
                    IconButton(
                        onPressed: (){
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => const EditProfile()));
                        },
                        icon:Icon(Icons.arrow_forward_ios,size: 14,))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Change Password",style: TextStyle(color: Colors.grey)),
                    IconButton(
                        onPressed: (){},
                        icon:Icon(Icons.arrow_forward_ios,size: 14,))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Notification",style: TextStyle(color: Colors.grey)),
                    IconButton(
                        onPressed: (){},
                        icon:Icon(Icons.arrow_forward_ios,size: 14,))
                  ],
                ),
                Divider(
                  indent: 2,
                  endIndent: 5,
                  color: Colors.purple,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("FAQs",style: TextStyle(color: Colors.grey)),
                    IconButton(
                        onPressed: (){
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => const FaqPage()));
                        },
                        icon:Icon(Icons.arrow_forward_ios,size: 14,))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("About Us",style: TextStyle(color: Colors.grey)),
                    IconButton(
                        onPressed: (){
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => const AboutUs()));
                        },
                        icon:Icon(Icons.arrow_forward_ios,size: 14,))
                  ],
                ),
                Divider(
                  indent: 2,
                  endIndent: 5,
                  color: Colors.purple,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Privacy Policy",style: TextStyle(color: Colors.grey)),
                    IconButton(
                        onPressed: (){},
                        icon:Icon(Icons.arrow_forward_ios,size: 14,))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Help & Support",style: TextStyle(color: Colors.grey)),
                    IconButton(
                        onPressed: (){},
                        icon:Icon(Icons.arrow_forward_ios,size: 14,))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Terms and Conditions",style: TextStyle(color: Colors.grey),),
                    IconButton(
                        onPressed: (){},
                        icon:Icon(Icons.arrow_forward_ios,size: 14,))
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                      height: 20,
                      child: SvgPicture.asset(
                        '$pathToIcon',
                        height: 40.0,
                        width: 40.0,
                        allowDrawingOutsideViewBox: true,
                      ),
                    ),
                    TextButton(onPressed: (){}, child: Text("Logout"))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}