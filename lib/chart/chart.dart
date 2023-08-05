import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


class LineCurveData {
  LineCurveData({this.date, this.minaqi, this.avgaqi, this.maxaqi});
  final String? date;
  final int? minaqi;
  final int? avgaqi;
  final int? maxaqi;
}

class Pollutant{

  Pollutant({this.forecast, this.pollutant});
  //forecast = all datas (03, N02....Pm2.5)
  final dynamic forecast;
  final dynamic pollutant;


  List<LineCurveData> datasToPlot(){
    final list = <LineCurveData>[];
    dynamic pollutantForecast = forecast['$pollutant'];
    if(pollutantForecast.length>5){
      pollutantForecast = pollutantForecast.sublist(0, 5);
    }
    for (var data in pollutantForecast  ){
      list.add(
          LineCurveData(
              date:data['day'].substring(2),
              minaqi:data['min'],
              avgaqi:data['avg'],
              maxaqi:data['max'])
          );
    }
    return list;
}



}

class GetPollutantMeasured{
  GetPollutantMeasured({this.forecast});
  //forecast = all datas (03, N02....Pm2.5)
  final dynamic forecast;

  List<String> pollutants(){
    return forecast.keys.toList();
  }

  int numberOfPollutants(){
    final pollutantList = pollutants();
    return pollutantList.length;
  }
}



//StackedLineChart(dataToPlot:Pollutant(forecast:forecast,pollutant:'o3'))
class StackedLineChart extends StatelessWidget {
  //dataToPlot is an instance of class Pollutant
  const StackedLineChart({super.key, this.dataToPlot});

  final dynamic dataToPlot;

  //return '03', 'pm2.5'......the pollutant whose curves are to be plotted
  String concernedPollutant(){
    return dataToPlot.pollutant;
  }

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      borderWidth: 1,
        primaryXAxis: CategoryAxis(
            labelRotation: 90,
            labelStyle: const TextStyle(
                color: Colors.white,
                fontFamily: 'Roboto',
                fontSize: 14,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w500
            )
        ),
        primaryYAxis : CategoryAxis(
            labelStyle: const TextStyle(
                color: Colors.white,
                fontFamily: 'Roboto',
                fontSize: 14,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w500
            ),
            title: AxisTitle(
                text:'AQI',
                textStyle: const TextStyle(
                    color: Colors.white,
                  fontWeight: FontWeight.bold
                )
            ),
          plotBands: <PlotBand>[
            PlotBand(
              isVisible: true,
              start: 0,
              end:  50,
              color: Colors.green,
                opacity:0.6,
              text:'GOOD',
              textStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                color: Colors.white
              )
            ),
            PlotBand(
                isVisible: true,
                start: 51,
                end:  100,
                color: Colors.yellow,
                opacity:0.7,
                text:'MODERATE',
                textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.white
                )
            ),
            PlotBand(
                isVisible: true,
                start: 101,
                end:  150,
                color: Colors.orange,
                opacity:0.75,
                text:'Unhealthy for Sensitive Groups',
                textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.black
                )
            ),
            PlotBand(
                isVisible: true,
                start: 151,
                end:  200,
                color: Colors.red,
                opacity:0.8,
                text:'Unhealthy',
                textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.black
                )
            ),
            PlotBand(
                isVisible: true,
                start: 201,
                end:  300,
                color: Colors.purple,
                opacity:0.6,

                text:'Very Unhealthy',
                textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.white
                )
            ),
            PlotBand(
                isVisible: true,
                start: 301,
                end:  50000, //this value will not be reached
                color: const Color(0xff7e0023),
                    opacity:0.6,
                    text:'Hazardous',
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Colors.black
                    )
            ),

          ]
        ),
        series: <ChartSeries>[

          StackedLineSeries<LineCurveData, String>(
            color: Colors.pink,
              animationDuration: 2500,
              animationDelay: 250,
              groupName: 'Group B',
              // Renders the marker
              markerSettings: const MarkerSettings(
                  isVisible: true,
                  shape: DataMarkerType.circle
              ),
              dataSource: dataToPlot.datasToPlot(),
              xValueMapper: (LineCurveData data, _) => data.date,
              yValueMapper: (LineCurveData data, _) => data.avgaqi
          ),


        ]
    );

  }
}