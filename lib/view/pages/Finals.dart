// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:untitled1/viewmodel/final_viewmodel/final_state.dart';
//
// import '../../viewmodel/final_viewmodel/final_cubit.dart';
//
// class Finals extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<ExamsCubit, ExamsState>(
//       listener: (context, state) {},
//       builder: (context, state) {
//         ExamsCubit myCubit = ExamsCubit.get(context);
//         return MaterialApp(
//           home: Scaffold(
//             appBar: AppBar(
//               leading: Icon(
//                 Icons.arrow_back_ios_rounded,color: Colors.orange,
//               ),
//               title: Text('                 Exam',style: TextStyle(
//                   color: Colors.black
//               ),),
//               actions: [Icon(Icons.filter_alt,color: Colors.orange,)],
//               backgroundColor: Colors.white,
//             ),
//             body: myCubit.isLoading == true
//                 ? Center(child: Text("Loading .. "))
//                 : Container(
//               width: double.infinity,
//               height: double.infinity,
//               child: ListView.builder(
//                 itemCount: myCubit.data!.data!.length,
//                 itemBuilder: (context, index) {
//                   return Card(
//                     shadowColor: Colors.white,
//                     shape: Border(bottom: BorderSide(
//                         width: 1,
//                         color: Colors.black
//                     )),
//                     borderOnForeground: true,
//                     elevation: 1,
//                     color: Colors.white,
//                     margin: EdgeInsets.symmetric(vertical: 3,horizontal: 20),
//                     child: Column(
//                       children: [
//                         Container(
//                           margin: EdgeInsets.only(bottom: 30),
//                           child: Row(
//                             mainAxisAlignment:
//                             MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(myCubit
//                                   .data!.data![index].examSubject
//                                   .toString(),style: TextStyle(
//                                 fontWeight: FontWeight.w800,
//                                 fontSize: 20,
//                               ),),
//                               Row(
//                                 children: [
//                                   Icon(Icons.timer_rounded),
//                                   Text("2h")
//                                 ],
//                               )
//                             ],
//                           ),
//                         ),
//
//                         Row(
//                           mainAxisAlignment:
//                           MainAxisAlignment.spaceAround,
//                           children: [
//                             Column(
//                               children: [
//                                 Text("Lecture Day",style: TextStyle(
//                                   color: Colors.grey  ,
//                                 ),),
//                                 Row(
//                                   children: [
//                                     Icon(Icons.calendar_month),
//                                     Text(myCubit
//                                         .data!.data![index].examDate
//                                         .toString())
//                                   ],
//                                 )
//                               ],
//                             ),
//                             Column(
//                               children: [
//                                 Text("start time",style: TextStyle(
//                                   color: Colors.grey  ,
//                                 ),),
//                                 Row(
//                                   children: [
//                                     Icon(Icons.watch_later,color: Colors.green),
//                                     Text(myCubit
//                                         .data!.data![index].examStartTime
//                                         .toString())
//                                   ],
//                                 )
//                               ],
//                             ),
//                             Column(
//                               children: [
//                                 Text("end time",style: TextStyle(
//                                   color: Colors.grey  ,
//                                 ),),
//                                 Row(
//                                   children: [
//                                     Icon(Icons.watch_later,color: Colors.red),
//                                     Text(myCubit
//                                         .data!.data![index].examEndTime
//                                         .toString())
//                                   ],
//                                 )
//                               ],
//                             ),
//                           ],
//                         )
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
