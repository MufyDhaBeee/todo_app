import 'package:flutter/material.dart';
import 'package:todolist/ui/Register/Register.dart';
import 'package:todolist/ui/login/login.dart';

class WelcomeTodo extends StatefulWidget {
  const WelcomeTodo({super.key});

  @override
  State<WelcomeTodo> createState() => _WelcomeTodoState();
}

class _WelcomeTodoState extends State<WelcomeTodo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Icon(Icons.arrow_back_ios_sharp, color: Colors.white),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 100,
            child: Center(
              child: Text(
                'Welcome to UpTodo',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Center(
            child: Text(
              'Please login to your account or create',
              style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 0.67),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(height: 5,),
          Center(
            child: Text(
              'new account to continue',
              style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 0.67),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(height: 450),
          Padding(
            padding: EdgeInsets.only(left: 25, right: 25),
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Color.fromRGBO(136, 117, 255, 1),
                ),
                child: Center(
                  child: Text(
                    'LOGIN',
                    style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1), fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.only(left: 25, right: 25),
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Register()));

              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.black,
                  border: Border.all(
                    color: Color.fromRGBO(136, 117, 255, 1),
                    width: 2,
                  ),
                ),
                child: Center(
                  child: Text(
                    'CREATE ACCOUNT',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
