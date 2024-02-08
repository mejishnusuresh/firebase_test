import 'package:firebase/Helper/uihelper.dart';
import 'package:firebase/Screens/homepage.dart';
import 'package:firebase/Screens/loginpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  TextEditingController emailController =TextEditingController();
  TextEditingController passwordController =TextEditingController();

  signUp(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      UIHelper.CustomAlertBox(context, "Enter Required Fields");
      return;
    }

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } catch (ex) {
      // Handle any errors during sign up
      if (ex is FirebaseAuthException) {
        UIHelper.CustomAlertBox(context, ex.code.toString());
      } else {
        // Handle other types of errors
        UIHelper.CustomAlertBox(context, "An error occurred: $ex");
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text("SignUp Page"),
        centerTitle: true,
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          UIHelper.CustomtextField(emailController, "Email", Icons.mail, false),
          const SizedBox(height: 10,),
          UIHelper.CustomtextField(passwordController, "password", Icons.password, true),
          const SizedBox(height: 10,),
          UIHelper.CustomButton(() {
            signUp(emailController.text.toString(), passwordController.text.toString());
          }, "SignUp"),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              const Text("Already Have a Account?",style: TextStyle(fontSize: 16,)),
              TextButton(
                  onPressed: (){
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LoginPage()
                        )
                    );
                  },
                  child: const Text(
                    "Log In",
                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                  )
              )

            ],
          ),


        ],
      ),

    );
  }
}
