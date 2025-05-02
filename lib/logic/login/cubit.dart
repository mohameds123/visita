import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:visita/core/api_links.dart';
import 'package:visita/logic/login/state.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());
  Dio request = Dio();

  Future login({
    required String email,
    required String pass,
  }) async {
    emit(LoginLoadingState());
    try {
      final response = await request.post(
        ApiLinks.loginUrl,
        data: {
          "email": email,
          "password": pass,
        },
      );
      if (response.statusCode == 200) {
        //get token
        final userToken = response.data["data"]["token"];
        //save token
        final prefs = await SharedPreferences.getInstance();
        prefs.setString("user_token", userToken);
        emit(LoginSuccessState());
      }
    } catch (e) {
      emit(LoginErrorState(e.toString()));
    }
  }
}
