import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notify_inapp/notify_inapp.dart';
import 'package:untitled1/view/pages/home_screen.dart';
import 'package:untitled1/view/pages/signup.dart';
import 'package:untitled1/viewmodel/loginviewmodel/login_cubit.dart';
import 'Setting.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = new TextEditingController();
    TextEditingController passwordController = new TextEditingController();

    var formKey = GlobalKey<FormState>();

    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();

    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            Fluttertoast.showToast(
                msg: "Register Successfully",
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 18.0);
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => HomeScreen()),
                (Route<dynamic> route) => false);
          }
          if (state is LoginError) {
            Fluttertoast.showToast(
                msg: "Login Failed",
                webBgColor: "linear-gradient(to right, #960b10, #9e1353)",
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 18.0);
          }
        },
        builder: (context, state) {
          LoginCubit myCubit = LoginCubit.get(context);

          return Scaffold(
            key: _scaffoldKey,
            body: SafeArea(
              child: SingleChildScrollView(
                child: Center(
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        SizedBox(height: 50),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Orange",
                                style: GoogleFonts.poppins(
                                    color: Color(0xFFFF6600),
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600)),
                            SizedBox(width: 5),
                            Text("Digital Center",
                                style: GoogleFonts.poppins(
                                    wordSpacing: 5,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700))
                          ],
                        ),
                        SizedBox(height: 60),
                        Row(
                          children: [
                            SizedBox(width: 20),
                            Text("Login",
                                style: GoogleFonts.poppins(
                                    wordSpacing: 5,
                                    fontSize: 28,
                                    fontWeight: FontWeight.w600))
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 15, left: 20, right: 20),
                          child: TextFormField(
                            controller: emailController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please Enter The Email";
                              }
                            },
                            obscureText: false,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                      color: Color(0xFFFF6600), width: 2)),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                              labelText: 'E-mail',
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                          child: TextFormField(
                            controller: passwordController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please Enter Password";
                              }
                            },
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: Icon(
                                  Icons.visibility_off,
                                  color: Color(0xFFFF6600),
                                ),
                                onPressed: () {},
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                      color: Color(0xFFFF6600), width: 2)),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                              labelText: 'Password',
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            SizedBox(width: 20),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Settings()));
                              },
                              child: Text("Forget Password?",
                                  style: GoogleFonts.poppins(
                                      color: Color(0xFFFF6600),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      decoration: TextDecoration.underline)),
                            ),
                          ],
                        ),
                        // (state is LoginLoading)?
                        // Center(child: CircularProgressIndicator(backgroundColor: Colors.blue)) :
                        SizedBox(height: 60),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 50,
                                margin: EdgeInsets.only(right: 20, left: 20),
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            8), // <-- Radius
                                      ),
                                      primary: Color(0xFFFF6600),
                                    ),
                                    onPressed: () {
                                      if (formKey.currentState!.validate()) {
                                        myCubit.login(emailController.text,
                                            passwordController.text);
                                      }
                                    },
                                    child: Text("Login",
                                        style: GoogleFonts.poppins(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700))),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),

                        Row(children: <Widget>[
                          Expanded(
                            child: new Container(
                                margin: const EdgeInsets.only(
                                    left: 30.0, right: 10.0),
                                child: Divider(
                                  color: Colors.black,
                                  height: 36,
                                )),
                          ),
                          Text("OR",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400, fontSize: 18)),
                          Expanded(
                            child: new Container(
                                margin: const EdgeInsets.only(
                                    left: 10.0, right: 30.0),
                                child: Divider(
                                  color: Colors.black,
                                  height: 36,
                                )),
                          ),
                        ]),
                        SizedBox(height: 10),

                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 50,
                                margin: EdgeInsets.only(right: 20, left: 20),
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              12), // <-- Radius
                                        ),
                                        side: BorderSide(
                                          width: 2,
                                          color: Color(0xFFFF6600),
                                        ),
                                        primary: Colors.white,
                                        textStyle: TextStyle(
                                          color: Color(0xFFFF6600),
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                        )),
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) => SignUp()));
                                      print("object");
                                    },
                                    child: Text("SignUp",
                                        style: GoogleFonts.poppins(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xFFFF6600),
                                        ))),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
