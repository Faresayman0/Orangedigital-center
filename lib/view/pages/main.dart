import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:untitled1/utils/local/database.dart';
import 'package:untitled1/view/pages/Login.dart';
import 'package:untitled1/view/pages/home_screen.dart';
import 'package:untitled1/view/pages/notes_screen.dart';
import 'package:untitled1/viewmodel/bloc_observer/bloc_observer.dart';
import 'package:untitled1/viewmodel/loginviewmodel/login_cubit.dart';
import 'package:untitled1/viewmodel/registerviewmodel/register_cubit.dart';
import 'package:untitled1/viewmodel/sections_viewmodel/sections_cubit.dart';

import '../../utils/network/dio_helper.dart';
import '../../viewmodel/final_viewmodel/final_cubit.dart';
import '../../viewmodel/lecture_viewmodel/lectures_cubit.dart';
import '../../viewmodel/midterms_viewmodel/midterm_cubit.dart';
import '../../viewmodel/newsviewmodel/news_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  await SQLHelper.initDb();

  Bloc.observer = MyBlocObserver();
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context) => RegisterCubit()),
    BlocProvider<RegisterCubit>(create: (context) => RegisterCubit()),
    BlocProvider(create: (context) => SectionsCubit()),
    BlocProvider(create: (context) => LecturesCubit()),
    BlocProvider(create: (context) => NewsCubit()),
    BlocProvider(create: (context) => ExamsCubit()),
    BlocProvider(create: (context) => MidTermCubit()),
  ], child: MaterialApp(home: NoteScreen())));
  configLoading();
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 4000)
    ..indicatorType = EasyLoadingIndicatorType.cubeGrid
    ..loadingStyle = EasyLoadingStyle.light
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..backgroundColor = Colors.black
    ..indicatorColor = Colors.orange
    ..textColor = Colors.orange
    ..maskColor = Colors.black.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
          child: AnimatedSplashScreen(
        nextScreen: HomeScreen(),
        duration: 2200,
        splash: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Orange",
                      style: GoogleFonts.poppins(
                          color: Color(0xFFFF6600),
                          fontSize: 24,
                          fontWeight: FontWeight.w700)),
                  SizedBox(height: 5),
                  Text("Digital Center",
                      style: GoogleFonts.poppins(
                          wordSpacing: 5,
                          fontSize: 24,
                          fontWeight: FontWeight.w700))
                ],
              ),
              SizedBox(height: 20),
              LinearPercentIndicator(
                barRadius: Radius.circular(10),
                alignment: MainAxisAlignment.center,
                width: 350,
                percent: 1,
                animation: true,
                animationDuration: 3000,
                progressColor: Color(0xFFFF6600),
              ),
            ],
          ),
        ),
      )),
    ));
  }
}










// ListView.builder(
// shrinkWrap: true,
// itemCount: count,
// itemBuilder: (BuildContext context, int index) {
//   return ListTile(
//       leading: const Icon(Icons.list),
//       trailing: const Text(
//         "GFG",
//         style: TextStyle(color: Colors.green, fontSize: 15),
//       ),
//       title: Text("List item $index"));
// }),
//
//
//
//
// GestureDetector(
//     onTap: (){
//
//       if (color == Colors.green){
//         color = Colors.red;
//         wi = 500;
//         hi = 300;
//
//       } else {
//         color = Colors.green;
//         wi = 300;
//         hi = 500;
//       }
//
//     } ,
//
//     child: AnimatedContainer(
//       duration: const Duration(milliseconds: 500) ,
//       width: wi,
//       height: hi,
//       color: color,
//     ),
//   ),
//


