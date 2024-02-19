import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NoteScreen extends StatelessWidget {
  const NoteScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    TextEditingController titleController = new TextEditingController();
    TextEditingController dataController = new TextEditingController();
    TextEditingController descController = new TextEditingController();


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.black ,size: 26,),

          onPressed: (){
            Navigator.pop(context);
          },),
        title:  Padding(
          padding: const EdgeInsets.all(30.0).copyWith(bottom: 30,right: 80),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Add Notes",
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w400))
              ],),
          ),

        ),
      ),
      body: SafeArea(
        child: Form(
            child: Column(
              children: [
                SizedBox(height: 10),

                TextFormField(
                  controller: titleController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter The Title";
                    }
                  },
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(15) , bottomRight: Radius.circular(15)),
                        borderSide: BorderSide(color: Color(0xFFFF6600) , width: 1)
                    ),


                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(color: Colors.green , width: 1)
                    ),
                    labelText: 'Title',


                  ),
                ),

                SizedBox(height: 30),

                TextFormField(
                  controller: dataController,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(15) , bottomRight: Radius.circular(15)),
                        borderSide: BorderSide(color: Color(0xFFFF6600) , width: 1)
                    ),


                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(color: Colors.green , width: 1)
                    ),
                    labelText: 'Title',


                  ),
                ),

                SizedBox(height: 30),

                TextFormField(

                  maxLines: 8,
                  controller: descController,
                  decoration: InputDecoration(
                    alignLabelWithHint: true,
                    isCollapsed: true,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(15) , bottomRight: Radius.circular(15)),
                        borderSide: BorderSide(color: Color(0xFFFF6600) , width: 1)
                    ),


                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(color: Colors.green , width: 1)
                    ),

                    labelText: 'Note',

                  ),
                ),

                Container(
                  width: 50,
                  child: ElevatedButton(
                      onPressed: (){},
                      child: Row(
                        children: [
                          Icon(Icons.add),
                          Text("Add",
                              style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400))
                        ],
                      )
                  ),
                )
              ],
            ),

        ),
      ),
    );

  }
}
