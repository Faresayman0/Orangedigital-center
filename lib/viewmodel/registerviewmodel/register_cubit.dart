import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/viewmodel/registerviewmodel/register_state.dart';

import '../../model/grade_model.dart';
import '../../model/signup_model.dart';
import '../../model/university_model.dart';
import '../../utils/network/dio_helper.dart';
import '../../utils/network/end_points.dart';
import '../loginviewmodel/login_cubit.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  static RegisterCubit get(context) => BlocProvider.of(context);

  var signupModel = SignUpModel();
  UniversityModel universityModel = UniversityModel();
  GradeModel gradeModel = GradeModel();
  var dropdownGradevalue = null;
  String dropdownGendervalue = 'Male';
  var dropdownUniversityvalue = null;
  bool visible1 = true;
  bool visible2 = true;
  var gender = [
    'Male',
    'Female',
  ];
  var formKeyRegister = GlobalKey<FormState>();
  var formKeyLogin = GlobalKey<FormState>();

  Future register(json) async {
    emit(RegisterLoading());
  print(json);
    await DioHelper.postData(url: registerEndPoint, data: json).then((value) {
      if (value.statusCode == 200) {
        print("gaaaaaaaaaaaaaaamed");
        emit(RegisterSuccess());
      }
    }).catchError((error) {
      print(error);
      print("hhhhhhhhhhhhhhh");
      emit(RegisterError(error.toString()));
    });
  }

  Future getUniversityData() async {
    emit(getUniversityDataLoading());
    var token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NjMsInJvbGUiOjQsImlhdCI6MTY2MzIzNTc1OCwiZXhwIjoxNzQ5NjM1NzU4fQ.1CLJofA7XDA0yxzzgH3om9R4BLBvkcFyLxhmES1cd9w";
    DioHelper.getData(url: universityEndPoint, token: token).then(
      (value) {
        if (value.statusCode == 200) {
          universityModel = UniversityModel.fromJson(value.data);
          print(universityModel.List_UniversityData[0].name);
          emit(getUniversityDataSuccess());
        }
      },
    ).catchError((onError) {
      emit(getUniversityDataError(onError.toString()));
    });
  }

  Future getGradeData() async {
    emit(getGradeDataLoading());
    var token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NjIsInJvbGUiOjQsImlhdCI6MTY2MzAyODMyNiwiZXhwIjoxNzQ5NDI4MzI2fQ.aTR7ZOpgvd5ub4i3bFDrQjrBKXIu10n-eecvxnObt_w";
    DioHelper.getData(url: gradeEndPoint, token: token).then(
      (value) {
        if (value.statusCode == 200) {
          gradeModel = GradeModel.fromJson(value.data);
          print(gradeModel.data[0].grade);
          emit(getGradeDataSuccess());
        }
      },
    ).catchError((onError) {
      emit(getGradeDataError(onError.toString()));
    });
  }

  void genderChange(String v) {
    dropdownGendervalue = v;
    emit(genderSelected());
    print(v);
  }

  void universityChange(int? v) {
    dropdownUniversityvalue = v!;
    emit(universitySelected());
    print(v);
  }

  void gradeChange(String? v) {
    dropdownGradevalue = v!;
    emit(gradeSelected());
    print(v);
  }

  void changeVisible(int num) {
    if (num == 1) {
      visible1 = !visible1;
      emit(changeVisibility1());
    } else {
      visible2 = !visible2;
      emit(changeVisibility2());
    }
  }
}
