import 'package:flutter/material.dart';
import 'package:my_job_desktop/components/components.dart';
import 'package:my_job_desktop/screens/login.dart';

import '../backend/auth_service.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color(0xFF00008B),
      body: Column(
        children: [
          const Align(
            alignment: Alignment.topLeft,
              child: TypewriterText(
                  text: 'Welcome'
                      '\n about this program :: '
                      '\n* this program made special for ........ company .'
                      '\n* this program powered by JUST4PROGRAMMING . '
                      '\n* the idea of this prog. is special for the JUST4PROGRAMMING company and they have a copyrights for it .'
                      '\n* this prog. made by the programming language dart and flutter frame work '
                      '\n* this copy no one can use it expect the ............. company owner .'
              )),
          const SizedBox(height: 150,),

          FadeIn(delay: 30,
            child: GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>  Auth(),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      var begin = const Offset(1.0, 0.0);
                      var end = Offset.zero;
                      var curve = Curves.ease;

                      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

                      return SlideTransition(
                        position: animation.drive(tween),
                        child: child,
                      );
                    },
                  ),
                );

              },
              child: Container(
                width: 220,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white,
                ),
                child: const Center(child: Text('Login' , style: TextStyle(color: Colors.black , fontSize: 20 , fontWeight: FontWeight.bold , fontFamily: 'rocky'),),),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
