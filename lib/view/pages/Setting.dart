import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [

              Text("Settings" , style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w700
              )),

              settingItem("FAQ"),
              Container(
                margin: EdgeInsets.only(right: 20 , left: 20),
                child:Divider(height: 2, color: Colors.black),
              ),

              settingItem("Terms & Conditions"),
              Container(
                margin: EdgeInsets.only(right: 20 , left: 20),
                child:Divider(height: 2, color: Colors.black),
              ),

              settingItem("Our Partenrs"),
              Container(
                margin: EdgeInsets.only(right: 20 , left: 20),
                child:Divider(height: 2, color: Colors.black),
              ),

              settingItem("Support"),
              Container(
                margin: EdgeInsets.only(right: 20 , left: 20),
                child:Divider(height: 2, color: Colors.black),
              ),

              settingItem("Log out"),

            ],
          ),
        ),
      ),
    );
  }
}


Container settingItem(String title){

  return  Container(
      margin: EdgeInsets.only(left: 20 , right: 10 , bottom: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title , style: GoogleFonts.poppins(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.w400
          )),
          IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios_outlined , size: 18,)),
        ],
      ));

}

