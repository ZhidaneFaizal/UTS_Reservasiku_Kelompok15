
import 'package:flutter/material.dart';

class Workoutpage extends StatefulWidget {
  const Workoutpage ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(title: const Text('Workout')),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => main()));
          },
           child: const Text ('Home'),
        ),
      ),
       );
  }

}