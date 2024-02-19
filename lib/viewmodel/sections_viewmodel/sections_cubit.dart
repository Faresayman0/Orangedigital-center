import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/const.dart';
import 'package:untitled1/viewmodel/sections_viewmodel/sections_state.dart';

import '../../model/section_model.dart';
import '../../utils/network/dio_helper.dart';
import '../../utils/network/end_points.dart';

class SectionsCubit extends Cubit<SectionsState> {
  SectionsCubit() : super(SectionsInitial());

  //single instance
  static SectionsCubit get(context) => BlocProvider.of(context);
  SectionModel sectionModel = SectionModel();
  Future<void> getData() async {
    emit(Sectionloading());
    var token = Token;
    DioHelper.getData(url: sectionEndPoint, token: token);
    emit(GetSectionsLoadingState());
    {
      await DioHelper.getData(url: lectureEndPoint, token: token).then((value) {
        sectionModel = SectionModel.fromJson(value.data);
        emit(GetSectionsSuccessState());
      });
    }
  }
}
