import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visita/logic/sign_up/state.dart';

class SignUpCubit extends Cubit <SignUpStates>{
  SignUpCubit() : super(SignUpInitialState());
  
Dio request = Dio();
  /// Build Function To Sign Up
/// params email,name,gender,phone,pass,confirmation pass
  Future signUp ({
    required String email,
    required String name,
    required String gender,
    required String phone ,
    required String pass,
    required String confirmationPass
}) async {
    emit(SignUpLoadingState());
    try{
     await request.post(
          "https://vcare.integration25.com/api/auth/register",
        data: {
            "name" : name,
          "email" : email,
          "phone" : phone,
          "gender" : gender,
          "password" : pass,
          "password_confirmation" : confirmationPass,
        },
      );
      emit(SignUpSuccessState());
      
    }catch(e){
      emit(SignUpErrorState(e.toString()));
    }
  }

}