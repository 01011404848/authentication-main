import 'package:authentication/register/registerDoctor/state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../user_model.dart';

class RegisterCubit extends Cubit<RegisterdoctorStates> {
  RegisterCubit() : super(RegisterDoctorInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  void userRegister({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String phone,
    required String registrationNumber,
    required String about,
    required String education,
    required String addrees,
  }) {
    print('hello');

    emit(RegisterDoctorLoadingState());

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
        registrationNumber :registrationNumber,
        about:about,
        education :education ,
        addrees : addrees,
      );
      emit(RegisterDoctorSuccessState(value.user!.uid));
    }).catchError((error) {
      emit(RegisterDoctorErrorState(error.toString()));
    });
  }

  void userCreate({
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String uId,
    required String registrationNumber,
    required String about,
    required String education,
    required String addrees,
  }) {
    UserModel model = UserModel(
      firstName: firstName,
      lastName: firstName,
      email: email,
      phone: phone,
      registrationNumber :registrationNumber,
      about:about,
      education :education ,
      addrees : addrees,
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
      emit(DoctorCreateUserSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(DoctorCreateUserErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(RegisterDoctorChangePasswordVisibilityState());
  }
}
