import 'package:flutter/material.dart';
import 'package:air_quality_app/constants/constants.dart';
import 'package:air_quality_app/classes/classes.dart';

class AirPollutionLevel extends StatelessWidget {
  const AirPollutionLevel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('AQI Levels'),
          backgroundColor: Colors.black,
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 10.0,
              ),
              Container(
                margin: const EdgeInsets.only(left:5.0, right:5.0),
                child: Text(
                  'Press on each box to see the health implication according to the AQI level',
                  style:  kAboutTextStyle.copyWith(
                    color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    fontSize: 22.0
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Expanded(
                  child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return const AboutText(level:1);
                        }));
                      },
                      child: Container(
                        //height: 100,
                        color: Colors.green,
                        child: const Center(
                            child: Text(
                              'AQI of 0-50',
                              style: TextStyle(
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.w800
                              ),
                            )
                        ),

                      )
                  )
              ),
              Expanded(
                  child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return const AboutText(level:2);
                        }));
                      },
                      child: Container(
                        //height: 100,
                        color: Colors.yellow,
                        child: const Center(
                            child: Text(
                              'AQI of 51-100',
                              style: TextStyle(
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.w800
                              ),
                            )
                        ),

                      )
                  )
              ),
              Expanded(
                  child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return const AboutText(level:3);
                        }));
                      },
                      child: Container(
                        //height: 100,
                        color: Colors.orange,
                        child: const Center(
                            child: Text(
                              'AQI of 101-150',
                              style: TextStyle(
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.w800
                              ),
                            )
                        ),

                      )
                  )
              ),
              Expanded(
                  child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return const AboutText(level:4);
                        }));
                      },
                      child: Container(
                        //height: 100,
                        color: Colors.red,
                        child: const Center(
                            child: Text(
                              'AQI of 151-200',
                              style: TextStyle(
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.w800
                              ),
                            )
                        ),

                      )
                  )
              ),
              Expanded(
                  child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return const AboutText(level:5);
                        }));
                      },
                      child: Container(
                        color: Colors.purple,
                        //height: 100,
                        child: const Center(
                            child: Text(
                              'AQI of 201-300',
                              style: TextStyle(
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.w800
                              ),
                            )
                        ),

                      )
                  )
              ),
              Expanded(
                  child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return const AboutText(level:6);
                        }));
                      },
                      child: Container(
                        //height: 100,
                        color: const Color(0xff7e0023),
                        child: const Center(
                            child: Text('AQI >300',
                              style: TextStyle(
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.w800
                              ),
                            )
                        ),

                      )
                  )
              ),

            ],

          )
        )
    );
  }
}