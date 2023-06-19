import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../reusable_widgets/reusable.dart';
import '../utils/color_utils.dart';
import 'home_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final _controller = TextEditingController();
  final _controller1 = TextEditingController();
  final _controller2 = TextEditingController();
  final _controller3 = TextEditingController();
  
  void dispose(){
    _emailTextController.dispose();
    _passwordTextController.dispose();
    _controller.dispose();
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    super.dispose();
  }



  Future insert() async{
    // await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _emailTextController.text.trim(),
    // password: _passwordTextController.text.trim());


   addsignupdetails(_controller.text.trim(),_controller1.text.trim(),
  _controller2.text.trim(),_controller3.text.trim());

  }

Future addsignupdetails(String dob,String medcon,String phno,String fullname)async{
  await FirebaseFirestore.instance.collection('users').add(
    {'dob': dob,
    //'email': username,
    'fullname': fullname,
    'medcon': medcon,
    //'password': password,
    'phno': phno,
    //'username': username,

    }
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Sign Up",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            hexStringToColor('20539E'),
            hexStringToColor('20797C'),
            hexStringToColor('209E5A')
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: SingleChildScrollView(
              child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * .2, 20, 0),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Email", Icons.person_outline, false,
                    _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Username", Icons.person_outline, false,
                    _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField1("Enter Password", Icons.person_outline, false,
                    _passwordTextController,),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Date of Birth", Icons.date_range,
                    false, _controller),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Full Name", Icons.person_outline,
                    false, _controller2),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Medical Condition",
                    Icons.person_outline, false, _controller1),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Phone number", Icons.phone_in_talk,
                    false, _controller3),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
      onPressed: () {
        FirebaseAuth.instance.createUserWithEmailAndPassword(email:_emailTextController.text,
                    password:_passwordTextController.text).then((value)  {
                       print("Created New Account");
                        Navigator.push(context,
                        MaterialPageRoute(
                           builder: (context) => const HomeScreen()));
                    }).onError((error, stackTrace) {
                      print("Error ${error.toString()}");
                    });
                    insert();
                   Navigator.push(
                       context,
                       MaterialPageRoute(
                           builder: (context) => const HomeScreen()));
                 },
       child: Text('SIGN UP',
        style: const TextStyle(
            color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 16),
      ),
      style: ButtonStyle
      (
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.black26;
            }
            return Colors.white;
          }),
      
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))
              ),
    ),
              ],
            ),
              ),
          ),
      ),
    );
  }
}
  

                 /* }
                )/*InkWell(
                  onTap: () {
                    FirebaseAuth.instance.createUserWithEmailAndPassword(email: _emailTextController.text,
                    password: _passwordTextController.text).then((value) {
                      print("Created new account!");
                      Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> HomeScreen()));
                  }).onError((error, stackTrace) {
                    print("Error ${error.toString()}");
                  });
                    insert();
                    }
                  

                
                  child: Container(
                    width: 280,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(35)),
                    child: Center(child: Text('Sign Up')),
                    
                  ),
                )*/
                /* signInSignUpButton(context, false, ()
                  {
                   FirebaseAuth.instance.createUserWithEmailAndPassword(email:_emailTextController.text,
                    password:_passwordTextController.text).then((value)  {
                       print("Created New Account");
                        Navigator.push(context,
                        MaterialPageRoute(
                           builder: (context) => const HomeScreen()));
                    }).onError((error, stackTrace) {
                      print("Error ${error.toString()}");
                    });
                    insert();
                   Navigator.push(
                       context,
                       MaterialPageRoute(
                           builder: (context) => const HomeScreen()));
                 }),*/
              ],
            ),
          ))),
    );
  }
}*/