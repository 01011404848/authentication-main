
import 'package:authentication/register/registerpatientCompanion/state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../user_model.dart';

class RegisterCubit extends Cubit<Registerstate> {
  RegisterCubit() : super(RegisterPatientCompanionInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  void userRegister({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String phone,
    required String patientID,
  }) {
    print('hello');

    emit(RegisterPatientCompanionLoadingState());

    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      userCreate(
        uId: value.user!.uid,
        phone: phone,
        email: email,
        firstName: firstName,
        lastName: lastName,
        patientID :patientID,
      );
      emit(RegisterPatientCompanionSuccessState(value.user!.uid));
    }).catchError((error) {
      emit(RegisterPatientCompanionErrorState(error.toString()));
    });
  }

  void userCreate({
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String uId,
    required String patientID,

  }) {
    UserModel model = UserModel(
      firstName: firstName,
      lastName: firstName,
      email: email,
      phone: phone,
      uId: uId,
      patientID :patientID,
      bio: 'write you bio ...',
      cover:
          'https://image.freepik.com/free-photo/photo-attractive-bearded-young-man-with-cherful-expression-makes-okay-gesture-with-both-hands-likes-something-dressed-red-casual-t-shirt-poses-against-white-wall-gestures-indoor_273609-16239.jpg',
      image:
          'https://image.freepik.com/free-photo/photo-attractive-bearded-young-man-with-cherful-expression-makes-okay-gesture-with-both-hands-likes-something-dressed-red-casual-t-shirt-poses-against-white-wall-gestures-indoor_273609-16239.jpg',
      isEmailVerified: false,
    );

    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toMap())
        .then((value) {
      emit(PatientCompanionCreateUserSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(PatientCompanionCreateUserErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(RegisterPatientCompanionChangePasswordVisibilityState());
  }
}
