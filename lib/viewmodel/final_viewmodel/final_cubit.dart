
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/exam_model.dart';
import '../../utils/network/dio_helper.dart';
import '../../utils/network/end_points.dart';
import 'final_state.dart';


class ExamsCubit extends Cubit<ExamsState> {
  ExamsCubit() : super(ExamsInitial());

  //single instance
  static ExamsCubit get(context) => BlocProvider.of(context);

}
