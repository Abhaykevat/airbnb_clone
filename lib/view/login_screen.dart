// import 'package:flutter/material.dart';
//
// class LoginScreen extends StatelessWidget {
//   const LoginScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: SafeArea(
//             child: Container(
//                 width: MediaQuery.of(context).size.width,
//                 height: 1000,
//                 // color: Colors.red,
//                 child: Stack(
//                   children: [
//                     Image.asset('images/login.jpg'),
//                     Positioned(
//                       bottom: 0,
//                       child: Container(
//                         decoration: BoxDecoration(color: Colors.white,
//                             borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))),
//                         width: MediaQuery.of(context).size.width,
//                         height: 500,
//                         child:Column(children: [
//                           Text("Sign in to continue"),
//                           SizedBox(width:300,height: 60,child: TextFormField(
//                               decoration: InputDecoration(hintText: "Email",
//                                 prefixIcon: Icon(Icons.email,color: Colors.blue),
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(10),
//                                 ),
//                               )
//                           )
//                           ),
//                           SizedBox(height: 10,),
//                           SizedBox(width:300,height: 60,child: TextFormField(
//                               decoration: InputDecoration(hintText: "Password",
//                                 prefixIcon: Icon(Icons.password,color: Colors.blue),
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(10),
//                                 ),
//                               )
//                           )
//                           ),
//                         ]) ,
//                       ),
//                     )
//                   ],
//                 )
//             ),
//             ),
//         );
//     }
// }

import 'package:airbnb_clone/view/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey=GlobalKey<FormState>();
  TextEditingController _emailTextEditingController=TextEditingController();
  TextEditingController _passwordTextEditingController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            // Background Image
            Positioned(
              child: Image.asset(
                'images/swimming-pool.jpg',
              ),
            ),
            // Login Form
            Padding(
              padding: const EdgeInsets.only(top: 440.0),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  color: Colors.white,
                ),
                // width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        const Text("Sign in to Continue ",style: TextStyle(fontSize: 24),),
                        const SizedBox(height: 20),
                         TextFormField(
                          controller: _emailTextEditingController,
                          validator: (valueEmail)
                           {
                             if(!valueEmail!.contains("@")){
                               return "Please write Valid email ";
                             }
                             return null;
                           },
                          decoration: InputDecoration(
                            suffixIcon: Icon(Icons.check, color: Colors.grey),
                            labelText: 'Email Address',
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                         TextFormField(
                           validator: (valuePassword)
                           {
                             if(valuePassword!.length<5){
                               return "Password must be atleast 6 or more";
                             }
                             return null;
                           },
                          controller: _passwordTextEditingController,
                          decoration: InputDecoration(
                            suffixIcon: Icon(Icons.visibility_off, color: Colors.grey),
                            labelText: 'Password',
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(height: 25),
                        Padding(
                          padding: const EdgeInsets.only(left: 14.0),
                          child: SizedBox(
                            height: 50,
                            width: 350,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                                onPressed: (){}, child: Text("Log In",style: TextStyle(color: Colors.white,fontSize: 20),)),
                          ),
                        ),

                        const SizedBox(height: 5),
                         Align(
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              TextButton(
                                  onPressed: (){
                                    Get.to(SignupScreen());
                                  }, child: Text("Don't have an account? Sign up",style:
                              TextStyle(color: Colors.black,fontWeight: FontWeight.bold),))
                              // Text(
                              //   "Don't have an account?",
                              //   style: TextStyle(
                              //     fontWeight: FontWeight.bold,
                              //     color: Colors.grey,
                              //   ),
                              // ),
                              // Text(
                              //   "Sign up",
                              //   style: TextStyle(
                              //     fontWeight: FontWeight.bold,
                              //     fontSize: 17,
                              //     color: Colors.black,
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
