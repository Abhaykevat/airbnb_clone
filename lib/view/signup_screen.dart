// import 'dart:io';
//
// import 'package:airbnb_clone/view/home_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class SignupScreen extends StatefulWidget {
//   const SignupScreen({Key? key}) : super(key: key);
//
//   @override
//   State<SignupScreen> createState() => _SignupScreenState();
// }
//
// class _SignupScreenState extends State<SignupScreen> {
//   final _formKey=GlobalKey<FormState>();
//   TextEditingController _emailTextEditingController=TextEditingController();
//   TextEditingController _passwordTextEditingController=TextEditingController();
//   TextEditingController _firstNameTextEditingController=TextEditingController();
//   TextEditingController _lastnameTextEditingController=TextEditingController();
//   TextEditingController _cityTextEditingController=TextEditingController();
//   TextEditingController _countryTextEditingController=TextEditingController();
//   TextEditingController _bioTextEditingController=TextEditingController();
//   File? imageFileOfUser;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Stack(
//           children: [
//             // Background Image
//             Positioned(
//               child: Image.asset(
//                 'images/login.jpg',
//               ),
//             ),
//             // Login Form
//             Padding(
//               padding: const EdgeInsets.only(top: 180.0),
//               child: Container(
//                 decoration: const BoxDecoration(
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(40),
//                     topRight: Radius.circular(40),
//                   ),
//                   color: Colors.white,
//                 ),
//                 // width: double.infinity,
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 18.0),
//                   child: Form(
//                     key: _formKey,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const SizedBox(height: 20),
//                         const Text("Create An Account ",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
//                         const SizedBox(height: 20),
//                         MaterialButton(onPressed: (){},child: imageFileOfUser,),
//                         TextFormField(
//                           validator: (text)
//                           {
//                             if(text!.isEmpty){
//                               return "Please write your First Name ";
//                             }
//                             return null;
//                           },
//                           controller: _firstNameTextEditingController,
//                           decoration: InputDecoration(
//                             suffixIcon: Icon(Icons.check, color: Colors.grey),
//                             labelText: 'First Name',
//                             labelStyle: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               color: Colors.black,
//                             ),
//                           ),
//                         ),
//                         TextFormField(
//                           validator: (text)
//                           {
//                             if(text!.isEmpty){
//                               return "Please write your Last Name ";
//                             }
//                             return null;
//                           },
//                           controller: _lastnameTextEditingController,
//                           decoration: InputDecoration(
//                             suffixIcon: Icon(Icons.check, color: Colors.grey),
//                             labelText: 'Last Name',
//                             labelStyle: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               color: Colors.black,
//                             ),
//                           ),
//                         ),
//                         TextFormField(
//                           validator: (text)
//                           {
//                             if(text!.isEmpty){
//                               return "Please write your City Name ";
//                             }
//                             return null;
//                           },
//                           controller: _cityTextEditingController,
//                           decoration: InputDecoration(
//                             suffixIcon: Icon(Icons.check, color: Colors.grey),
//                             labelText: 'City Name',
//                             labelStyle: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               color: Colors.black,
//                             ),
//                           ),
//                         ),
//                         TextFormField(
//                           validator: (text)
//                           {
//                             if(text!.isEmpty){
//                               return "Please write your Country Name ";
//                             }
//                             return null;
//                           },
//                           controller: _countryTextEditingController,
//                           decoration: InputDecoration(
//                             suffixIcon: Icon(Icons.check, color: Colors.grey),
//                             labelText: 'Country Name',
//                             labelStyle: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               color: Colors.black,
//                             ),
//                           ),
//                         ),
//                         TextFormField(
//                           controller: _emailTextEditingController,
//                           validator: (valueEmail)
//                           {
//                             if(!valueEmail!.contains("@")){
//                               return "Please write Valid email ";
//                             }
//                             return null;
//                           },
//                           decoration: InputDecoration(
//                             suffixIcon: Icon(Icons.check, color: Colors.grey),
//                             labelText: 'Email Address',
//                             labelStyle: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               color: Colors.black,
//                             ),
//                           ),
//                         ),
//                         // const SizedBox(height: 20),
//                         TextFormField(
//                           validator: (valuePassword)
//                           {
//                             if(valuePassword!.length<5){
//                               return "Password must be atleast 6 or more";
//                             }
//                             return null;
//                           },
//                           controller: _passwordTextEditingController,
//                           decoration: InputDecoration(
//                             suffixIcon: Icon(Icons.visibility_off, color: Colors.grey),
//                             labelText: 'Password',
//                             labelStyle: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               color: Colors.black,
//                             ),
//                           ),
//                         ),
//                         TextFormField(
//                           maxLines: 2,
//                           textCapitalization: TextCapitalization.sentences,
//                           controller: _bioTextEditingController,
//                           decoration: InputDecoration(
//                             labelText: 'Bio',
//                             labelStyle: TextStyle(
//                               color: Colors.black,
//                             ),
//                           ),
//                         ),
//
//                          SizedBox(height: 20),
//                         // const Align(
//                         //   alignment: Alignment.centerRight,
//                         //   child: Text(
//                         //     'Forgot Password?',
//                         //     style: TextStyle(
//                         //       fontWeight: FontWeight.bold,
//                         //       fontSize: 17,
//                         //       color: Colors.black,
//                         //     ),
//                         //   ),
//                         // ),
//                         const SizedBox(height: 25),
//                         Padding(
//                           padding: const EdgeInsets.only(left: 14.0),
//                           child: SizedBox(
//                             height: 50,
//                             width: 350,
//                             child: ElevatedButton(
//                                 style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
//                                 onPressed: (){}, child: Text("Log In",style: TextStyle(color: Colors.white,fontSize: 20),)),
//                           ),
//                         ),
//
//                         const SizedBox(height: 5),
//                         Align(
//                           alignment: Alignment.center,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               TextButton(
//                                   onPressed: (){
//                                     Get.to(Home());
//                                   }, child: Text("Don't have an account? Sign up",style:
//                               TextStyle(color: Colors.black,fontWeight: FontWeight.bold),))
//                               // Text(
//                               //   "Don't have an account?",
//                               //   style: TextStyle(
//                               //     fontWeight: FontWeight.bold,
//                               //     color: Colors.grey,
//                               //   ),
//                               // ),
//                               // Text(
//                               //   "Sign up",
//                               //   style: TextStyle(
//                               //     fontWeight: FontWeight.bold,
//                               //     fontSize: 17,
//                               //     color: Colors.black,
//                               //   ),
//                               // ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



import 'dart:io';

import 'package:airbnb_clone/global.dart';
import 'package:airbnb_clone/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey=GlobalKey<FormState>();
  TextEditingController _emailTextEditingController=TextEditingController();
  TextEditingController _passwordTextEditingController=TextEditingController();
  TextEditingController _firstNameTextEditingController=TextEditingController();
  TextEditingController _lastnameTextEditingController=TextEditingController();
  TextEditingController _cityTextEditingController=TextEditingController();
  TextEditingController _countryTextEditingController=TextEditingController();
  TextEditingController _bioTextEditingController=TextEditingController();
  File? imageFileOfUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Stack(
              children: [
                // Background Image
                Positioned(
                  child: Image.asset(
                    'images/login.jpg',
                  ),
                ),
                // Login Form
                Padding(
                  padding: const EdgeInsets.only(top: 180.0),
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
                            const Text("Create An Account ",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
                            const SizedBox(height: 20),
                            Padding(
                              padding: const EdgeInsets.only(left: 70),
                              child: MaterialButton(onPressed: () async{
                                var imageFile=await ImagePicker().pickImage(source: ImageSource.gallery);
                                if(imageFile != null)
                                  {
                                    imageFileOfUser = File(imageFile!.path);

                                    setState(() {
                                      imageFileOfUser;
                                    });
                                  }
                              },
                                child: imageFileOfUser==null ?const Icon(Icons.add_a_photo):CircleAvatar(

                                  backgroundColor: Colors.blue,
                                  radius: MediaQuery.of(context).size.width/5.0,
                                  child: CircleAvatar(
                                    backgroundImage: FileImage(imageFileOfUser!),
                                    radius: MediaQuery.of(context).size.width/5.2,
                                  ),
                                ),),
                            ),
                            TextFormField(
                              validator: (text)
                              {
                                if(text!.isEmpty){
                                  return "Please write your First Name ";
                                }
                                return null;
                              },
                              controller: _firstNameTextEditingController,
                              decoration: InputDecoration(
                                suffixIcon: Icon(Icons.check, color: Colors.grey),
                                labelText: 'First Name',
                                labelStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            TextFormField(
                              validator: (text)
                              {
                                if(text!.isEmpty){
                                  return "Please write your Last Name ";
                                }
                                return null;
                              },
                              controller: _lastnameTextEditingController,
                              decoration: InputDecoration(
                                suffixIcon: Icon(Icons.check, color: Colors.grey),
                                labelText: 'Last Name',
                                labelStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            TextFormField(
                              validator: (text)
                              {
                                if(text!.isEmpty){
                                  return "Please write your City Name ";
                                }
                                return null;
                              },
                              controller: _cityTextEditingController,
                              decoration: InputDecoration(
                                suffixIcon: Icon(Icons.check, color: Colors.grey),
                                labelText: 'City Name',
                                labelStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            TextFormField(
                              validator: (text)
                              {
                                if(text!.isEmpty){
                                  return "Please write your Country Name ";
                                }
                                return null;
                              },
                              controller: _countryTextEditingController,
                              decoration: InputDecoration(
                                suffixIcon: Icon(Icons.check, color: Colors.grey),
                                labelText: 'Country Name',
                                labelStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
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
                            // const SizedBox(height: 20),
                            TextFormField(
                              validator: (valuePassword)
                              {
                                if(valuePassword!.length<5){
                                  return "Password must be atleast 6 or more";
                                }
                                return null;
                              },
                              controller: _passwordTextEditingController,
                              obscureText: true ,
                              decoration: InputDecoration(
                                suffixIcon: Icon(Icons.visibility_off, color: Colors.grey),
                                labelText: 'Password',
                                labelStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            TextFormField(
                              maxLines: 2,
                              textCapitalization: TextCapitalization.sentences,
                              controller: _bioTextEditingController,
                              decoration: InputDecoration(
                                labelText: 'Bio',
                                labelStyle: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ),

                            SizedBox(height: 20),
                            // const Align(
                            //   alignment: Alignment.centerRight,
                            //   child: Text(
                            //     'Forgot Password?',
                            //     style: TextStyle(
                            //       fontWeight: FontWeight.bold,
                            //       fontSize: 17,
                            //       color: Colors.black,
                            //     ),
                            //   ),
                            // ),
                            const SizedBox(height: 25),
                            Padding(
                              padding: const EdgeInsets.only(left: 14.0),
                              child: SizedBox(
                                height: 50,
                                width: 350,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                                    onPressed: (){
                                      if(!_formKey.currentState!.validate() ||imageFileOfUser ==null )
                                      {
                                        Get.snackbar("Filled missing", "Please choose image and fill out complete signup form");
                                        return;
                                      }
                                      if(_emailTextEditingController.text.isEmpty && _passwordTextEditingController.text.isEmpty)
                                        {
                                          Get.snackbar("Filled missing", "Please fill out complete signup form");
                                          return;

                                        }
                                      userViewModel.signUp(
                                          _emailTextEditingController.text.trim(),
                                          _passwordTextEditingController.text.trim(),
                                          _firstNameTextEditingController.text.trim(),
                                          _lastnameTextEditingController.text.trim(),
                                          _cityTextEditingController.text.trim(),
                                          _countryTextEditingController.text.trim(),
                                          _bioTextEditingController.text.trim(),
                                          imageFileOfUser,
                                      );
                                    }, child: Text("Creare Account",style: TextStyle(color: Colors.white,fontSize: 20),)),
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
                                        Get.to(Home());
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