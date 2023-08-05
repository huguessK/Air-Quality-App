
import 'package:flutter/material.dart';
import 'package:air_quality_app/constants/constants.dart';


String descriptionOfTheAirQuality(int level){


  if(level==1){
    return kDescription1;
  }

  else if(level==2){
    return kDescription2;
  }

  else if(level==3){
    return kDescription3;
  }

  else if(level==4){
    return kDescription4;
  }

  else if(level==5){
    return kDescription5;
  }

  else{
    return kDescription6;
  }
}





class AboutText extends StatelessWidget {
  const AboutText({super.key,required this.level});

  final int level;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xfffaf0c8),
        appBar: AppBar(
          title: const Text('Health Implication'),
          backgroundColor: Colors.black,
        ),
        body: SafeArea(
            child: Scrollbar(
              radius: const Radius.circular(5.0),
              thumbVisibility: true,
              thickness: 5.0,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    const  SizedBox(
                      height: 200.0,
                    ),
                    Image(
                        image: AssetImage('images/level$level.jpg'),
                      ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Text(descriptionOfTheAirQuality(level),
                          style: kAboutTextStyle.copyWith(
                              fontSize: 22.0,
                              color: Colors.orange,
                            fontWeight: FontWeight.bold
                          )
                      ),
                    ),

                  ]

                  ),
              ),
            ),
            )
        );
  }
}

