import 'package:flutter/material.dart';
import 'package:loginapp/models/user_model.dart';
import 'package:loginapp/services/pref_services.dart';

class HomePage extends StatefulWidget {
 static final String id = 'home_page';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();


  void _doLogin(){
    String email =emailController.text.toString().trim();
    String password =passwordController.text.toString().trim();
    User  user=User.from(email: email, password: password);
    Prefs.storeUser(user);

    Prefs.loadUser().then((user) => {
      print(user.email)
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
          children: [
       Column(
         mainAxisAlignment: MainAxisAlignment.start,
         children: [
           SizedBox(height: 10,),
           //#image
           Container(
             height: 300,
             width: 350,
             decoration: BoxDecoration(
                 image: DecorationImage(
                     image: AssetImage("assets/images/login_1.png"),
                     fit: BoxFit.cover
                 )
             ),
           ),
           SizedBox(height: 10,),
           //#texts
           Text("Welcome back!", style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.w800),),

           SizedBox(height: 10,),
           //#text 2
           Text("Login into your existant account of Q Allure", style: TextStyle(color: Colors.grey.shade700, fontSize: 17) ,),
           SizedBox(height: 30,),
           //#register place
           Container(
             padding: EdgeInsets.only(left: 15, right: 15),
             margin: EdgeInsets.only(left: 20, right: 20),
             height: 60,
             width: double.infinity,
             decoration: BoxDecoration(
               border: Border.all(
                   color: Colors.blue
               ),
               color: Colors.grey.shade100,
               borderRadius: BorderRadius.circular(30),
             ),
             child: TextField(
               controller: emailController,
               decoration: InputDecoration(
                 border: InputBorder.none,
                 fillColor: Colors.blue,
                 hintText: "Email",
                 icon: Icon(Icons.person, color: Colors.blue,),
               ),
             ),
           ),
           SizedBox(height: 13,),
           Container(
             padding: EdgeInsets.only(left: 15, right: 15),
             margin: EdgeInsets.only(left: 20, right: 20),
             height: 60,
             width: double.infinity,
             decoration: BoxDecoration(
               border: Border.all(
                   color: Colors.blue
               ),
               color: Colors.grey.shade100,
               borderRadius: BorderRadius.circular(30),
             ),
             child: TextField(
               controller: passwordController,
               decoration: InputDecoration(
                 border: InputBorder.none,
                 fillColor: Colors.blue,
                 hintText: "Password",
                 icon: Icon(Icons.lock_open, color: Colors.blue,),
               ),
             ),
           ),
           SizedBox(height: 5,),
           //#Forgot password
           Container(
             margin: EdgeInsets.only(right: 25),
             alignment: Alignment.bottomRight,
             child:Text("Forgot password?", style: TextStyle(color: Colors.grey.shade700, fontWeight: FontWeight.bold, fontSize: 15),),
           ),
           SizedBox(height: 15,),
           //#Log in button
           Container(
             height: 50,
             width: 200,
             decoration: BoxDecoration(
               color: Colors.blue.shade900,
               borderRadius: BorderRadius.circular(25),
             ),
             child: FlatButton(
               onPressed: _doLogin,
               child: Text("Log In", style: TextStyle(color: Colors.white, ),),
             ),
           ),
           SizedBox(height: 40,),
           //#text3
           Text("Or connect using", style: TextStyle(color: Colors.grey, fontSize: 13),),
           SizedBox(height: 15,),
           //#facebook google
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Container(
                 height: 50,
                 width: 150,
                 decoration: BoxDecoration(
                   color: Colors.blue.shade800,
                   borderRadius: BorderRadius.circular(20),
                 ),
                 child: Center(
                   child: Text("Facebook", style: TextStyle(color: Colors.white),),
                 )
               ),
               SizedBox(width: 10,),
               Container(
                 height: 50,
                 width: 150,
                 decoration: BoxDecoration(
                   color: Colors.redAccent,
                   borderRadius: BorderRadius.circular(20),
                 ),
                 child: Center(
                   child:  Text("Google", style: TextStyle(color: Colors.white),),
                 )
               ),

             ],
           ),
           SizedBox(height: 40,),
           //#Sign up
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Text("Don't have an account?", style:  TextStyle(color: Colors.black),),
               SizedBox(width: 5,),
               Text("Sign Up", style: TextStyle(color: Colors.blue, fontSize: 15),)
             ],
           ),
         ],
       ),

     ],
      )
    );
  }
}
