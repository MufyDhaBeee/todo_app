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
      body: SingleChildScrollView(
        child: Column(
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
            //-------------------------Circular Counter-------------------------------------->
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
            //-----------------------------Text-------------------------------------->
            Text('While your focus mode is on, all of your notifications will be off', textAlign: TextAlign.center, style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: Color.fromRGBO(255, 255, 255, 0.87),
            ),),
            SizedBox(height: 25,),
            //--------------------------------------Start Focusing----------------------------------->
            Container(
              height: 48,
              width: 200,
              decoration: BoxDecoration(
                color: Color.fromRGBO(134, 135, 231, 1),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Center(child: Text('Start Focusing', style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 1),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),)),
            ),
            SizedBox(height: 30,),
            //----------------Overview Section----------------------------------------------->
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Overview', style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(255, 255, 255, 1)
                  ),),
                  Container(
                    width: 100,
                    height: 36,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 0.21),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('This Week', style: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.87), fontWeight: FontWeight.w400, fontSize: 12),),
                          Icon(Icons.keyboard_arrow_down_outlined,color: Color.fromRGBO(255, 255, 255, 0.87), size: 17, ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),

            //-----------------------------------Graph------------------------------------------------------------->
         Row(
           children: [
             Column(
         children: [
           Text('6h'),
           Text('5h'),
           Text('4h'),
           Text('3h'),
           Text('2h'),
           Text('1h'),
         ],
             ),
             Column(
         children: [
           Container(),
           Row(
             children: [
               Text('SUN'),
               Text('MON'),
               Text('TUE'),
               Text('WED'),
               Text('THU'),
               Text('FRI'),
               Text('SAT'),
             ],
           )
         ],
             ),

           ],
         )


          ],
        ),
      ),


    );
  }
}
