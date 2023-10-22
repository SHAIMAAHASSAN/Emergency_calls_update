import 'package:emergency_call_app/views/mainscreen.dart';
import 'package:emergency_call_app/views/signupscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Emeregency Calls'),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20,),
              CircleAvatar(backgroundImage:AssetImage("images/emergency.png") ,maxRadius: 100,) ,
              //SizedBox(height: 10,),
              Container(
                margin: EdgeInsets.all(15),
                child: TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email address.';
                    }
                    return null;
                  },
                ),
              ),
              //SizedBox(height: 10,),
              Container(
                margin: EdgeInsets.only(right: 15,left: 15,bottom: 15),
                child: TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password.';
                    }
                    return null;
                  },
                ),
              ),
              //SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    // Sign in the user with Firebase Authentication.
                    final userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: _emailController.text,
                      password: _passwordController.text,
                    );

                    // Navigate to the next screen.
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainScreen(),
                        ));
                    _emailController.clear();
                    _passwordController.clear();

                  }
                },
                child: Text('Sign In'),
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?"),
                  SizedBox(width: 5,),
                  GestureDetector(onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpScreen(),
                        ));
                  },
                  child: Text("Sign Up",style: TextStyle(color: Colors.blue,fontSize: 18),),)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
