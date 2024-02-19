import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../viewmodel/registerviewmodel/register_cubit.dart';
import '../../viewmodel/registerviewmodel/register_state.dart';
import 'Login.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Timer? _timer;

    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 30),
        child: SingleChildScrollView(
          child: BlocProvider(
            create: (context) => RegisterCubit()
              ..getUniversityData()
              ..getGradeData(),
            child: BlocConsumer<RegisterCubit, RegisterState>(
                listener: (context, state) {
              if (state is RegisterSuccess) {
                Fluttertoast.showToast(
                    msg: "Register Successfully",
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    fontSize: 18.0);
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => Login()),
                    (Route<dynamic> route) => false);
              }
              if (state is RegisterError) {
                Fluttertoast.showToast(
                    msg: "Register Failed",
                    webBgColor: "linear-gradient(to right, #960b10, #9e1353)",
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 18.0);
              }
            }, builder: (context, state) {
              var myCubit = RegisterCubit.get(context);

              return (myCubit.universityModel == null &&
                      myCubit.gradeModel == null)
                  ? CircularProgressIndicator()
                  : Form(
                      key: RegisterCubit.get(context).formKeyRegister,
                      child: Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Orange",
                              style: GoogleFonts.poppins(
                                  color: Colors.orange,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(" Digital Center",
                                style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                        Container(
                            margin: EdgeInsets.only(left: 25, top: 40),
                            alignment: AlignmentDirectional.centerStart,
                            child: Text("Sign Up",
                                style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold))),
                        Container(
                          padding: EdgeInsets.all(20),
                          child: TextFormField(
                            controller: nameController,
                            validator: (e) {
                              if (e!.isEmpty) {
                                return "Please enter Name";
                              }
                            },
                            decoration: InputDecoration(
                              labelText: "Name",
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            controller: emailController,
                            validator: (e) {
                              if (e!.isEmpty) {
                                return "Please enter Email";
                              }
                            },
                            decoration: InputDecoration(
                              labelText: "Email",
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          child: TextFormField(
                            controller: passController,
                            obscureText: RegisterCubit.get(context).visible1,
                            validator: (e) {
                              if (e!.isEmpty) {
                                return "Please enter Password";
                              }
                            },
                            decoration: InputDecoration(
                              labelText: "Password",
                              suffixIcon: IconButton(
                                  icon: Icon(
                                      (!RegisterCubit.get(context).visible1)
                                          ? Icons.visibility
                                          : Icons.visibility_off),
                                  onPressed: () {
                                    RegisterCubit.get(context).changeVisible(1);
                                  },
                                  color: Colors.orange),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          child: TextFormField(
                            controller: confirmPassController,
                            obscureText: RegisterCubit.get(context).visible2,
                            validator: (e) {
                              if (e!.isEmpty) {
                                return "Please enter Password again";
                              }
                            },
                            decoration: InputDecoration(
                              labelText: "Confirm Password",
                              suffixIcon: IconButton(
                                  icon: Icon(
                                      (!RegisterCubit.get(context).visible2)
                                          ? Icons.visibility
                                          : Icons.visibility_off),
                                  onPressed: () {
                                    RegisterCubit.get(context).changeVisible(2);
                                  },
                                  color: Colors.orange),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          child: TextFormField(
                            keyboardType: TextInputType.phone,
                            controller: phoneController,
                            validator: (e) {
                              if (e!.isEmpty) {
                                return "Please enter Phone number";
                              }
                            },
                            decoration: InputDecoration(
                              labelText: "Phone Number",
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(children: [
                              Text("Gender",
                                  style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600)),
                              Container(
                                height: 60,
                                padding: EdgeInsets.all(9),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18),
                                    border: Border.all(
                                        color: Colors.orange, width: 2)),
                                child: DropdownButton(
                                  style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                  // Initial Value
                                  value: RegisterCubit.get(context)
                                      .dropdownGendervalue,

                                  // Down Arrow Icon
                                  icon: const Icon(Icons.keyboard_arrow_down),

                                  // Array list of items
                                  items: RegisterCubit.get(context)
                                      .gender
                                      .map((String gender) {
                                    return DropdownMenuItem(
                                      value: gender,
                                      child: Text(gender),
                                    );
                                  }).toList(),
                                  // After selecting the desired option,it will
                                  onChanged: (vale) {
                                    RegisterCubit.get(context)
                                        .genderChange(vale.toString());
                                  },
                                  // change button value to selected value
                                  underline: DropdownButtonHideUnderline(
                                      child: Container()),
                                ),
                              ),
                            ]),
                            Column(children: [
                              Text("University",
                                  style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600)),
                              Container(
                                width: 150,
                                height: 40,
                                // padding: EdgeInsets.all(9),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                        color: Colors.orange, width: 2)),
                                child: Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: DropdownButton(
                                    isExpanded: true,

                                    // Initial Value
                                    value: RegisterCubit.get(context)
                                        .dropdownUniversityvalue,

                                    // Down Arrow Icon
                                    icon: Icon(
                                      Icons.keyboard_arrow_down,
                                      color: Colors.grey,
                                    ),

                                    // Array list of items
                                    items: RegisterCubit.get(context)
                                        .universityModel
                                        .List_UniversityData
                                        .map((items) {
                                      return DropdownMenuItem<int>(
                                        value: items.id,
                                        child: Text("   ${items.name}"),
                                      );
                                    }).toList(),
                                    // After selecting the desired option,it will
                                    // change button value to selected value
                                    onChanged: (newValue) {
                                      RegisterCubit.get(context)
                                          .universityChange(
                                              int.parse(newValue.toString()));
                                    },
                                    underline: DropdownButtonHideUnderline(
                                      child: Container(),
                                    ),
                                  ),
                                ),
                              ),
                            ])
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 20),
                          child: Column(children: [
                            Text("Grade",
                                style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600)),
                            Container(
                              // padding: EdgeInsets.all(9),
                              width: 160,
                              height: 40,

                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                      color: Colors.orange, width: 2)),
                              child: Directionality(
                                textDirection: TextDirection.rtl,
                                child: DropdownButton<String>(
                                  isExpanded: true,
                                  // Initial Value
                                  value: RegisterCubit.get(context)
                                      .dropdownGradevalue,
                                  // isDense: true,
                                  underline: DropdownButtonHideUnderline(
                                    child: Container(),
                                  ),

                                  // Down Arrow Icon
                                  icon: const Icon(
                                    Icons.keyboard_arrow_down,
                                    color: Colors.grey,
                                  ),

                                  // Array list of items
                                  items: RegisterCubit.get(context)
                                      .gradeModel
                                      .data
                                      .where((e) => e.grade != null)
                                      .toSet()
                                      .map((items) {
                                    return DropdownMenuItem<String>(
                                      value: items.grade!,
                                      child: Text("   ${items.grade!}"),
                                    );
                                  }).toList(),
                                  // After selecting the desired option,it will
                                  // change button value to selected value
                                  onChanged: (newValue) {
                                    RegisterCubit.get(context)
                                        .gradeChange(newValue!);
                                  },
                                ),
                              ),
                            ),
                          ]),
                        ),
                        Container(
                          height: 40,
                          margin: EdgeInsets.only(
                              left: 20, right: 20, bottom: 22, top: 3),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(20)),
                          child: TextButton(
                            onPressed: () async {
                              var json = {
                                "name": nameController.text,
                                "email": emailController.text,
                                "password": passController.text,
                                "phoneNumber": phoneController.text,
                                "gender": RegisterCubit.get(context)
                                            .dropdownGendervalue ==
                                        "Male"
                                    ? 'm'
                                    : 'f',
                                'roleId': 2,
                                'universityId': 1,
                                'gradeId': 2
                              };

                              print("hereeeeeeeeeeeeeeeeeee");
                              RegisterCubit.get(context).register(json);
                            },
                            child: Text(
                              "Sign Up",
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 30, right: 30),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Divider(
                                height: 2,
                                color: Colors.black,
                              )),
                              Text(
                                " OR ",
                                style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                              Expanded(
                                  child: Divider(
                                height: 2,
                                color: Colors.black,
                              )),
                            ],
                          ),
                        ),
                        Container(
                          height: 40,
                          margin: EdgeInsets.only(
                              top: 20, left: 20, right: 20, bottom: 20),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              border:
                                  Border.all(color: Colors.orange, width: 2),
                              borderRadius: BorderRadius.circular(20)),
                          child: TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Login()));
                            },
                            child: Text(
                              "Login",
                              style: GoogleFonts.poppins(
                                  color: Colors.orange,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ]),
                    );
            }),
          ),
        ),
      ),
    );
  }
}
