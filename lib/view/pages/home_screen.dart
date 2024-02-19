import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled1/view/pages/lectures_screen.dart';
import 'package:untitled1/view/pages/section_screen.dart';

import 'exams_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: RichText(
          text: TextSpan(
              text: 'Orange',
              style: TextStyle(
                  color: Color(0xFFFF6600),
                  fontSize: 26,
                  fontWeight: FontWeight.bold
              ),
              children: <TextSpan>[
                TextSpan(
                    text: " Digital Center",
                    style: TextStyle(
                        color: Colors.black
                    )
                ),
              ]
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10
        ),children: [
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>LecturesScreen()));
            },
            child: Card(
              elevation: 5.0,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    margin: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(120, 232, 231, 231),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.menu_book,
                      color: Color(0xFFFF6600),
                      size: 60,
                    ),
                  ),
                  SizedBox(height: 5.0,),
                  Text(
                      "Lectures",
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFFF6600)
                    ),
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>SectionsScreen()));
            },
            child: Card(
              elevation: 5.0,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    margin: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(120, 232, 231, 231),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.book,
                      color: Color(0xFFFF6600),
                      size: 60,
                    ),
                  ),
                  SizedBox(height: 5.0,),
                  Text(
                    "Sections",
                    style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFFF6600)
                    ),
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ExamsScreen()));
            },
            child: Card(
              elevation: 5.0,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    margin: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(120, 232, 231, 231),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.my_library_books_rounded,
                      color: Color(0xFFFF6600),
                      size: 60,
                    ),
                  ),
                  SizedBox(height: 5.0,),
                  Text(
                    "Midterms",
                    style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFFF6600)
                    ),
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ExamsScreen()));
            },
            child: Card(
              elevation: 5.0,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    margin: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(120, 232, 231, 231),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.my_library_books_sharp,
                      color: Color(0xFFFF6600),
                      size: 60,
                    ),
                  ),
                  SizedBox(height: 5.0,),
                  Text(
                    "Finals",
                    style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFFF6600)
                    ),
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: (){
              // Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
            },
            child: Card(
              elevation: 5.0,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    margin: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(120, 232, 231, 231),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.calendar_month,
                      color: Color(0xFFFF6600),
                      size: 60,
                    ),
                  ),
                  SizedBox(height: 5.0,),
                  Text(
                    "Events",
                    style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFFF6600)
                    ),
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>LecturesScreen()));
            },
            child: Card(
              elevation: 5.0,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    margin: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(120, 232, 231, 231),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.note_add,
                      color: Color(0xFFFF6600),
                      size: 60,
                    ),
                  ),
                  SizedBox(height: 5.0,),
                  Text(
                    "Lectures",
                    style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFFF6600)
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
        ),
      ),
    );
  }
}
