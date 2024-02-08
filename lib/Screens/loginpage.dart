import 'package:firebase/Helper/uihelper.dart';
import 'package:firebase/Screens/signuppage.dart';
import 'package:flutter/material.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController emailController =TextEditingController();
  TextEditingController passwordController =TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text("Login Page"),
        centerTitle: true,
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          UIHelper.CustomtextField(emailController, "Email", Icons.mail, false),
          const SizedBox(height: 10,),
          UIHelper.CustomtextField(passwordController, "password", Icons.password, true),
          const SizedBox(height: 10,),
          UIHelper.CustomButton(() { }, "Login"),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              const Text("Dont Have an Account?",style: TextStyle(fontSize: 16,)),
              TextButton(
                  onPressed: (){
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignupPage()
                        )
                    );
                  },
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                  )
              ),

            ],
          ),


        ],
      ),

    );
  }
}
