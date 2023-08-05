import 'package:air_quality_app/services/location.dart';
import 'package:air_quality_app/services/networking.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

const apiKey = 'PutYourApiKeyHere----Get your ApiKey --> http://api.waqi.info/feed';
const aqiURL = 'http://api.waqi.info/feed';


class AqiModel {
  Future<dynamic> getCityAqi(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(
        '$aqiURL/$cityName/?token=$apiKey');

    var aqiData = await networkHelper.getData();
    return aqiData;
  }

  Future<dynamic> getLocationAqi() async {
    Location location = Location();
    String response = await location.getCurrentLocation();
    //check if Location permissions are denied or
    //Location services are disabled or
    //Location permissions are permanently denied, we cannot request permissions


    if(response=='failed'){
      String datas = '{"status": "locationOff"}';
      dynamic returnVal= jsonDecode(datas);
      return Future<dynamic>.value(returnVal);
    }

    NetworkHelper networkHelper = NetworkHelper(
        '$aqiURL/geo:${location.latitude};${location
            .longitude}/?token=$apiKey');

    var aqiData = await networkHelper.getData();
    return aqiData;
  }
}



  String getMessage(int aqi)
  {

    if (aqi <= 50) {
      return 'Good';
    }
    else if (aqi>=51 && aqi <=100) {
      return 'Moderate';
    }
    else if (aqi>=101 && aqi <=150) {
      return 'Unhealthy for Sensitive Groups';
    }
    else if (aqi>=151 && aqi <=200) {
      return 'Unhealthy';
    }
    else if (aqi>=201 && aqi <=300) {
     return 'Very Unhealthy';
    }
    else {
      return 'Hazardous';
    }
}



  Color getColor(int aqi) {
    if (aqi <= 50) {
      return Colors.green;
    }
    else if (aqi >= 51 && aqi <= 100) {
      return Colors.yellow;
    }
    else if (aqi >= 101 && aqi <= 150) {
      return Colors.orange;
    }
    else if (aqi >= 151 && aqi <= 200) {
      return Colors.red;
    }
    else if (aqi >= 201 && aqi <= 300) {
      return Colors.purple;
    }
    else {
      return const Color(0xff7e0023);
    }
  }


  Color getTextColor(int aqi)
    {
      if (aqi>=51 && aqi <=100) {
        return Colors.black;
      }
      else {
        return Colors.white;
      }
  }