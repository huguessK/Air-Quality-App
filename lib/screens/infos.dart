import 'package:air_quality_app/screens/airpollutionlevel.dart';
import 'package:air_quality_app/screens/aboutdatas.dart';
import 'package:air_quality_app/screens/aboutaqi.dart';
import 'package:flutter/material.dart';



class Infos extends StatelessWidget {

  const Infos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Infos'),
          backgroundColor: Colors.black,
        ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            /*SizedBox(
              height: 20,
            ),*/
            Expanded(
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return const AboutAqi();
                    }));
                  },
                  child: Container(
                    //height: 100,
                    color: Colors.orange,
                    child: const Center(
                        child: Text(
                            'About the AQI',
                          style: TextStyle(
                            fontSize: 40.0,
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
                        return const AirPollutionLevel();
                      }));
                    },
                    child: Container(
                      //height: 100,
                      color: Colors.green,
                      child: const Center(
                          child: Text(
                              'AQI Levels',
                            style: TextStyle(
                                fontSize: 40.0,
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
                        return const AboutData();
                      }));
                    },
                    child: Container(
                      //height: 30,
                      color: Colors.purple,
                      child: const Center(
                          child: Text(
                              'About the data',
                            style: TextStyle(
                                fontSize: 40.0,
                                fontWeight: FontWeight.w800
                            ),
                          )
                      ),

                    )
                )
            )
          ],
        ),
      )
    );
  }
}