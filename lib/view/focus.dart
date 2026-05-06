import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';

class FocusPage extends StatefulWidget {
  const FocusPage({super.key});

  @override
  State<FocusPage> createState() => _FocusPageState();
}

class _FocusPageState extends State<FocusPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color.fromRGBO(18, 18, 18, 1),
      body: Column(
        children: [
          // ----- Header -------------------------------------------------------->
          const Padding(
            padding: EdgeInsets.only(top: 24, bottom: 16),
            child: Center(
              child: Text(
                'Focus Mode',
                style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 0.87),
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ),
          CircularCountDownTimer(
              width: MediaQuery.of(context).size.width / 2,
              height:MediaQuery.of(context).size.height / 2,
              duration: 15,
              fillColor: Color.fromRGBO(134, 135, 231, 1),
              ringColor: Color.fromRGBO(85, 85, 85, 1),
            strokeWidth: 15.0,
            strokeCap: StrokeCap.round,
            textStyle: TextStyle(
                fontSize: 33.0, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Text('While your focus mode is on, all of your notifications will be off', style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: Color.fromRGBO(255, 255, 255, 0.87),
          ),),
        ],
      ),


    );
  }
}
