import 'package:flutter/material.dart';

class NewCategory extends StatefulWidget {
   NewCategory({super.key}){
    print("new category page is calling with construcggtor");
  }
  @override
  State<NewCategory> createState() {
     print("category page state is calling");
   return _NewCategoryState();
  }
}

class _NewCategoryState extends State<NewCategory> {

  @override
  Widget build(BuildContext context) {
    print(' the category  page build function is calling is calling');
    return Scaffold(
      backgroundColor: Color.fromRGBO(18, 18, 18, 1),

      body: Padding(
        padding: const EdgeInsets.only(left: 30, top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            Text('Create new category', style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Color.fromRGBO(255, 255, 255, 0.87),
            ),),
            SizedBox(height: 10,),
            Text('Category name :', style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 0.87),
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),),
            SizedBox(height: 15,),
            Container(
              height: 48,
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Color.fromRGBO(29, 29, 29, 1),
                border: Border.all(
                  color: Color.fromRGBO(151, 151, 151, 1),
                )
              ),
              child: TextField(
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
                decoration: InputDecoration(
                  hintText: ' Category name',
                  hintStyle: TextStyle(
                    color: Color.fromRGBO(175, 175, 175, 1),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  )
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Text('Category icon :', style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: Color.fromRGBO(255, 255, 255, 0.87),
            ),),
            SizedBox(height: 15,),
            Container(
              height: 40,
              width: 165,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Color.fromRGBO(255, 255, 255, 0.21),
              ),
              child: Center(
                child: Text('Choose icon from library', style: TextStyle(
                  fontSize: 11,
                  fontWeight:FontWeight.w400,
                  color: Color.fromRGBO(255, 255, 255, 0.87),
                ),),
              ),
            ),
            SizedBox(height: 20,),
            Text('Category color :', style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: Color.fromRGBO(255, 255, 255, 0.87),
            ),),
            SizedBox(height: 20,),
            Row(
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(201, 204, 65, 1),
                   shape: BoxShape.circle,
                  ),
                ),
                SizedBox(width: 8,),
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(102, 204, 65, 1),
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(width: 8,),
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(65, 204, 167, 1),
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(width: 8,),
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(65, 129, 204, 1),
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(width: 8,),
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(65, 162, 204, 1),
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(width: 8,),
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(204, 132, 65, 1),
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(width: 8,),
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(151, 65, 204, 1),
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(width: 8,),
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(204, 65, 115, 1),
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
           Spacer(),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  InkWell(
                    onTap:(){
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 55,
                      width: 155,
                      decoration: BoxDecoration(
                        color:   Color.fromRGBO(18, 18, 18, 1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Center(child: Text('Cancel', style: TextStyle(
                        color:  Color.fromRGBO(134, 135, 231, 1),
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),)),
                    ),
                  ),
                  SizedBox(width: 15,),
                  Container(
                    height: 55,
                    width: 155,
                    decoration: BoxDecoration(
                      color:  Color.fromRGBO(134, 135, 231, 1),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Center(child: Text('Create Category', style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),)),
                  ),
                ],
              ),
            ),
            SizedBox(height: 25,),

          ],
        ),
      ),
    );
  }
}
