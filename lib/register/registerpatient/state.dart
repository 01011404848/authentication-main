abstract class RegisterpatientStates {}

class RegisterPatientInitialState extends RegisterpatientStates {}

class RegisterPatientLoadingState extends RegisterpatientStates {}

class RegisterPatientSuccessState extends RegisterpatientStates {
  final String uId;

  RegisterPatientSuccessState(this.uId);
}

class RegisterPatientErrorState extends RegisterpatientStates
{
  final String error;

  RegisterPatientErrorState(this.error);
}

class PatientCreateUserSuccessState extends RegisterpatientStates {


}

class PatientCreateUserErrorState extends RegisterpatientStates
{
  final String error;

  PatientCreateUserErrorState(this.error);
}

class RegisterPatientChangePasswordVisibilityState extends RegisterpatientStates {}


