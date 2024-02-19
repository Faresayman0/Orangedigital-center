abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {}

class RegisterError extends RegisterState {
  final String? error;
  RegisterError(this.error);
}

class getUniversityDataLoading extends RegisterState {}

class getUniversityDataSuccess extends RegisterState {}

class getUniversityDataError extends RegisterState {
  final String? error;
  getUniversityDataError(this.error);
}

class getGradeDataLoading extends RegisterState {}

class genderSelected extends RegisterState {}

class universitySelected extends RegisterState {}

class gradeSelected extends RegisterState {}

class changeVisibility1 extends RegisterState {}

class changeVisibility2 extends RegisterState {}

class getGradeDataSuccess extends RegisterState {}

class getGradeDataError extends RegisterState {
  final String? error;
  getGradeDataError(this.error);
}
  