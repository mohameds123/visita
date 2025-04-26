import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visita/logic/sign_up/cubit.dart';
import 'package:visita/logic/sign_up/state.dart';
import 'package:visita/presentation/screens/home_screen.dart';

class SignUpScreen extends StatelessWidget {
   SignUpScreen({super.key});
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmationPassController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: BlocConsumer<SignUpCubit, SignUpStates>(
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
                    "Create Account",
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
                  TextFormField(
                    controller: confirmationPassController,
                    style: TextStyle(color: Color.fromRGBO(194, 194, 194, 1)),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                          borderSide: BorderSide(width: 1)),
                      hintText: "Confirm Password",
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
                    controller: genderController,
                    style: TextStyle(color: Color.fromRGBO(194, 194, 194, 1)),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                          borderSide: BorderSide(width: 1)),
                      hintText: "Gender",
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
                    controller: phoneController,
                    style: TextStyle(color: Color.fromRGBO(194, 194, 194, 1)),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                          borderSide: BorderSide(width: 1)),
                      hintText: "Your Number",
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
                    controller: nameController,
                    style: TextStyle(color: Color.fromRGBO(194, 194, 194, 1)),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                          borderSide: BorderSide(width: 1)),
                      hintText: "name",
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
                    onTap: (){
                      context.read<SignUpCubit>().signUp(
                          email: emailController.text,
                          name: nameController.text,
                          gender: genderController.text,
                          phone: phoneController.text,
                          pass: passController.text,
                          confirmationPass: confirmationPassController.text
                      );
                    },
                    child: Container(
                      width: 400,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.blue,
                      ),
                      child: Center(
                        child: Text(
                          "Create",
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
      ),
    );
  }
}
