import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visita/logic/sign_up/cubit.dart';
import 'package:visita/logic/sign_up/state.dart';
import 'package:visita/presentation/screens/home_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpStates>(
      listener: (context, state) {
        if (state is SignUpSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Login is Successfully ")));
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
        } else if (state is SignUpErrorState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.em)));
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 36,
                ),
                Text(
                  "Login",
                  style: TextStyle(
                    color: Color.fromRGBO(36, 124, 255, 1),
                    fontWeight: FontWeight.w700,
                    fontSize: 27,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Sign up now and start exploring all that our app has to offer. We're excited to welcome you to our community!",
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 12,
                      color: Color.fromRGBO(117, 117, 117, 1)),
                ),
                SizedBox(
                  height: 13,
                ),
                TextFormField(
                  controller: emailController,
                  style: TextStyle(color: Color.fromRGBO(194, 194, 194, 1)),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13),
                        borderSide: BorderSide(width: 1)),
                    hintText: "Email",
                    hintStyle: TextStyle(
                      color: Color.fromRGBO(194, 194, 194, 1),
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                SizedBox(
                  height: 13,
                ),
                TextFormField(
                  controller: passController,
                  style: TextStyle(color: Color.fromRGBO(194, 194, 194, 1)),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13),
                        borderSide: BorderSide(width: 1)),
                    hintText: "Password",
                    hintStyle: TextStyle(
                      color: Color.fromRGBO(194, 194, 194, 1),
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                SizedBox(
                  height: 13,
                ),


                InkWell(
                  onTap: (){},
                  child: Container(
                    width: 400,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.blue,
                    ),
                    child: Center(
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
