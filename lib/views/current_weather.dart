

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget currentWeather(IconData icon, String temp, String temp_min , String temp_max, String location){
   return Center(
     child: Column(
       crossAxisAlignment: CrossAxisAlignment.center,
       mainAxisAlignment: MainAxisAlignment.center,
       children: [
         Icon(
           icon,
           color: Colors.orange,
           size: 64.0,
         ),
         SizedBox(
           height: 10.0,
         ),
         Text(
           "$temp",
           style: TextStyle(
             fontSize: 25.0
           ),
         ),
         SizedBox(
           height: 10.0,
         ),
         Text(
           "$location",
           style: TextStyle(
             fontSize: 22.0,
             color: Color(0XFF5a5a5a),
           ),
         ),
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           crossAxisAlignment: CrossAxisAlignment.center,
           children: [
             Text(
               "$temp_min",
               style:  TextStyle(
                 fontSize:  15.0,
                 color:  Colors.blue,
               ),
             ),

             Text(
               "$temp_max",
               style:  TextStyle(
                 fontSize:  15.0,
                 color:  Colors.redAccent,
               ),
             ),

           ],

         )
       ],
     ),
   );
}