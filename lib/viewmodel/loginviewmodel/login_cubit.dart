import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/login_model.dart';
import '../../utils/network/dio_helper.dart';
import '../../utils/network/end_points.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);

  var data = LoginModel();
  var isWrong = false;
  var isLoading = false;

  Future login(String email, String password) async {
    emit(LoginLoading());

    DioHelper.postData(
        url: loginEndPoint,
        data: {'email': email, 'password': password}).then((value) {
      if (value.statusCode == 200) {
        data = LoginModel.fromJson(value.data);
        print(value.data);
        emit(LoginSuccess());
        isLoading = false;
        isWrong = false;
      } else {
        emit(LoginError());
        isLoading = false;
        isWrong = true;
      }
    }).catchError((error) {
      emit(LoginError());
      isWrong = true;
      print(isWrong);
    });
  }
}
