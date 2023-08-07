abstract class Registerstate {}

class RegisterPatientCompanionInitialState extends Registerstate {}

class RegisterPatientCompanionLoadingState extends Registerstate {}

class RegisterPatientCompanionSuccessState extends Registerstate {
  final String uId;

  RegisterPatientCompanionSuccessState(this.uId);
}

class RegisterPatientCompanionErrorState extends Registerstate
{
  final String error;

  RegisterPatientCompanionErrorState(this.error);
}

class PatientCompanionCreateUserSuccessState extends Registerstate {


}

class PatientCompanionCreateUserErrorState extends Registerstate
{
  final String error;

  PatientCompanionCreateUserErrorState(this.error);
}

class RegisterPatientCompanionChangePasswordVisibilityState extends Registerstate {}
