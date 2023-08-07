abstract class RegisterdoctorStates {}


class RegisterDoctorInitialState extends RegisterdoctorStates {}

class RegisterDoctorLoadingState extends RegisterdoctorStates {}

class RegisterDoctorSuccessState extends RegisterdoctorStates {
  final String uId;

  RegisterDoctorSuccessState(this.uId);
}

class RegisterDoctorErrorState extends RegisterdoctorStates
{
  final String error;

  RegisterDoctorErrorState(this.error);
}

class DoctorCreateUserSuccessState extends RegisterdoctorStates {


}

class DoctorCreateUserErrorState extends RegisterdoctorStates
{
  final String error;

  DoctorCreateUserErrorState(this.error);
}

class RegisterDoctorChangePasswordVisibilityState extends RegisterdoctorStates {}

