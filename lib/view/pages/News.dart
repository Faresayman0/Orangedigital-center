import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../viewmodel/newsviewmodel/news_cubit.dart';

class News extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit(),
      child: BlocConsumer<NewsCubit,NewsState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      "News",
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) =>
                        Center(
                          child: Card(
                            elevation: 20,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20.0),

                                  child: Text("fff"),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                            "",
                                            style: GoogleFonts.poppins(
                                                color: Colors.black,
                                                fontSize: 25,
                                                fontWeight: FontWeight.w600)),
                                        Container(
                                          margin:
                                          EdgeInsets.only(top: 10, right: 10),
                                          decoration: BoxDecoration(
                                              color: Colors.orange,
                                              borderRadius:
                                              BorderRadius.circular(11)),
                                          child: IntrinsicHeight(
                                            child: Row(
                                              children: [
                                                Container(
                                                  child: IconButton(
                                                      onPressed: () {},
                                                      icon: Icon(
                                                        Icons.share_outlined,
                                                        color: Colors.white,

                                                      )),
                                                ),
                                                VerticalDivider(
                                                  indent: 7,
                                                  endIndent: 7,
                                                  color: Colors.white,
                                                  thickness: 1,
                                                ),
                                                Container(
                                                  child: IconButton(
                                                    onPressed: () {},
                                                    icon: Icon(
                                                      Icons.copy_rounded,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 60),
                                      padding: EdgeInsets.only(
                                          left: 5, right: 5),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment
                                            .end,
                                        children: [

                                          Flexible(
                                            child: Container(
                                              // padding: new EdgeInsets.only(right: 2.0),

                                              child: Text(
                                                "Text",
                                                overflow: TextOverflow.ellipsis,
                                                style: GoogleFonts.poppins(

                                                    color: Colors.black,
                                                    fontSize: 15,
                                                    fontWeight: FontWeight
                                                        .w600),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: 25, right: 5),
                                            child: Text(
                                              "Text",
                                              style: GoogleFonts.poppins(
                                                  color: Colors.black,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                        ],),
                                    )

                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                  ),
                ],
              ),
            ),
          );
        }),
    );
  }
}
