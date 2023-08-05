import 'package:flutter/material.dart';
import 'package:air_quality_app/chart/chart.dart';
import 'package:air_quality_app/services/airdata.dart';
import 'package:air_quality_app/screens/infos.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;



final dominentPollutants = ['co','no2','so2','pm10','pm25','o3'];
const int maxCityNameLen = 33;



class AqiMainScreen extends StatefulWidget {
  const AqiMainScreen({super.key,required this.datas});

  final dynamic datas;

  @override
  _AqiMainScreen createState() => _AqiMainScreen();
}

class _AqiMainScreen extends State<AqiMainScreen> {

  dynamic forecast;
  int? currentAqi;
  String? dominentPol;
  String? dominentPolCopy;
  dynamic iaqi;
  String? timeIso;
  String? cityName;
  String? aqiMessage;
  dynamic pollutants;

  //android
  List<DropdownMenuItem<String>> dropdownItems = [];
  //iOs
  List<Text> pickerItems = [];

  @override
  void initState() {
    super.initState();
    //widget.location = Town or current location
    updateUI(widget.datas);
  }


  List<String> getpollutantsList(){
    return forecast.keys.toList();
  }

  void updateUI(dynamic aqiDatas) {
    setState(() {
      if (aqiDatas['status'] != 'ok') {
        forecast = '';
        currentAqi = 0;
        dominentPol = '';
        dominentPolCopy = '';
        timeIso = '';
        iaqi = '';
        cityName = '';
        aqiMessage = aqiDatas['data'];
        pollutants = [];
        return;
      }


      forecast = aqiDatas['data']['forecast']['daily'];
      currentAqi = aqiDatas['data']['aqi'];
      dominentPol = aqiDatas['data']['dominentpol'];
      dominentPolCopy = dominentPol;
      timeIso = aqiDatas['data']['time']['iso'];
      iaqi = aqiDatas['data']['iaqi'];
      cityName = aqiDatas['data']['city']['name'].length>maxCityNameLen?aqiDatas['data']['city']['name'].substring(0,maxCityNameLen):aqiDatas['data']['city']['name'];
      aqiMessage = '';
      pollutants = getpollutantsList();


      //security to avoid the app (dropdown part) to crash
      if(!pollutants.contains(dominentPol)){
        dominentPol = pollutants[0];
      }

      if (!Platform.isIOS) {
        for (String pollutant in pollutants) {
          if(dominentPollutants.contains(pollutant)) {
            var newItem = DropdownMenuItem(
              value: pollutant,
              child: Text(pollutant),
            );
            dropdownItems.add(newItem);
          }
        }
      }//end !Platform.isIOS
      else{
        //iOs
        for (String pollutant in pollutants) {
          if(dominentPollutants.contains(pollutant)) {
            pickerItems.add(Text(pollutant));
          }
        }
      }
    });
  }




@override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Get Another City AQI'),
          backgroundColor: Colors.black,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              int count = 2;
              Navigator.of(context).popUntil((_) => count-- <= 0);
            },
          ),
        ),
      body: SafeArea(
        child: 
        Scrollbar(
          radius: const Radius.circular(5.0),
          thumbVisibility: true,
          thickness: 5.0,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Average AQI for ',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0
                      )
                    ),
              if(Platform.isIOS)...[CupertinoPicker(
          backgroundColor: Colors.lightBlue,
          itemExtent: 32.0,
          onSelectedItemChanged: (selectedIndex) {
            setState(() {
              dominentPol = pickerItems[selectedIndex].toString();
            });
          },
          children: pickerItems,
      ),] else...[
    DropdownButton<String>(
    dropdownColor: Colors.white,
    value: dominentPol,
    items: dropdownItems,
          onChanged: (value) {
      setState(() {
          dominentPol = value;

      });
    },
  ),
  ],
                  ],
                ),
                StackedLineChart(dataToPlot:Pollutant(forecast:forecast,pollutant:dominentPol)),
                const SizedBox(height:30),
                Container(
                  height: 245,
                  margin: const EdgeInsets.only(left: 55.0, right: 10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: getColor((currentAqi??0))
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          children: [
                            const SizedBox(width:60),
                            Text('current ',
                              style: TextStyle(
                                  color: getTextColor(currentAqi??0),
                                  fontWeight: FontWeight.w800,
                                  fontSize: 20
                              ),
                            ),
                            Text('AQI $currentAqi',
                              style: TextStyle(
                                  color: getTextColor(currentAqi??0),
                                  fontWeight: FontWeight.w800,
                                  fontSize: 30
                              ),
                            ),
                          ],
                        ),
                            Text(
                              getMessage(currentAqi??0),
                              style: TextStyle(
                                  color: getTextColor(currentAqi??0),
                                fontWeight: FontWeight.w800,
                                fontSize: 30
                              ),
                            ),
                        const SizedBox(
                          height: 10.0,
                        ),

                        Text('dominant pollutant ${dominentPolCopy=='pm25'?'pm2.5':dominentPolCopy}',
                          style: TextStyle(
                              color: getTextColor(currentAqi??0),
                              fontWeight: FontWeight.w800,
                              fontSize: 20
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Text('$cityName',
                          style: TextStyle(
                              color: getTextColor(currentAqi??0),
                              fontWeight: FontWeight.w800,
                              fontSize: 20
                          ),
                        ),
                        Text('Updated $timeIso',
                          style: TextStyle(
                              color: getTextColor(currentAqi??0),
                              fontWeight: FontWeight.w800,
                              fontSize: 15
                          ),

                        ),


                      ],
                    ),
                  ),
          const SizedBox( height: 10.0),
              ]
            ),
          ),
        ),
      ),

       floatingActionButton:  FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const Infos();
            }));
          },

          backgroundColor: const Color(0xff93c382),
          child: const Icon(Icons.info_outline),
        )

    );
  }
}