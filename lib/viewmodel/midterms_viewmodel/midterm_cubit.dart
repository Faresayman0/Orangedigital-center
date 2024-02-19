import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/model/section_model.dart';
import '../../utils/network/dio_helper.dart';
import '../../utils/network/end_points.dart';

part 'midterm_state.dart';

class MidTermCubit extends Cubit<SectionState> {
  MidTermCubit() : super(FinalInitial());

  //single instance
  static MidTermCubit get(context) => BlocProvider.of(context);
}
