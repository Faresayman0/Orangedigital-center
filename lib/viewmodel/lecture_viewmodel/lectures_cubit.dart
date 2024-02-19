import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/const.dart';

import '../../model/lecture_model.dart';
import '../../utils/network/dio_helper.dart';
import '../../utils/network/end_points.dart';

part 'lectures_state.dart';

class LecturesCubit extends Cubit<LecturesState> {
  LecturesCubit() : super(LecturesInitial());

  //single instance
  static LecturesCubit get(context) => BlocProvider.of(context);
  LectureModel lectureModel = LectureModel();
  Future<void> getData() async {
    var token = Token;
    emit(LecturesLoading());
    try {
      await DioHelper.getData(url: lectureEndPoint, token: token).then((value) {
        lectureModel = LectureModel.fromJson(value.data);
        emit(LectureSuccess());
      });
    } catch (e) {
      emit(LectureError());
      print(e.toString());
    }
  }
}
