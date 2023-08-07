
import 'package:authentication/register/registerpatient/state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../user_model.dart';

class RegisterCubit extends Cubit< RegisterpatientStates> {
  RegisterCubit() : super(RegisterPatientInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  void userRegister({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String phone,
    required String birthdate,
  }) {
    print('hello');

    emit(RegisterPatientLoadingState());

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
        birthdate:birthdate,
      );
      emit(RegisterPatientSuccessState(value.user!.uid));
    }).catchError((error) {
      emit(RegisterPatientErrorState(error.toString()));
    });
  }

  void userCreate({
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String uId,
    required String birthdate,
  }) {
    UserModel model = UserModel(
      firstName: firstName,
      lastName: firstName,
      birthdate:birthdate,
      email: email,
      phone: phone,
      uId: uId,
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
      emit(PatientCreateUserSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(PatientCreateUserErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(RegisterPatientChangePasswordVisibilityState());
  }
}
