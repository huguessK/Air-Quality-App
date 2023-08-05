import 'package:flutter/material.dart';
import 'package:air_quality_app/screens/aqimain.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:air_quality_app/services/airdata.dart';
import 'package:air_quality_app/screens/unknowstation.dart';
import 'package:air_quality_app/permission/permission.dart';

class LoadingScreen extends StatefulWidget {

  const LoadingScreen({super.key,required this.location});
  final String location;

  @override
  State<StatefulWidget> createState() {
    return _LoadingScreenState();
  }
}

class _LoadingScreenState extends State<LoadingScreen> {

  dynamic aqiDatas;
  @override
  void initState() {
    super.initState();
    getAqiDatas();
  }

  void getAqiDatas() async{
    if(widget.location!='CurrentLocation'){
      aqiDatas = await AqiModel().getCityAqi(widget.location);

    }else{
      //get Current location AqiDatas
      aqiDatas = await AqiModel().getLocationAqi();
    }
    if (context.mounted) {
      if(aqiDatas['status']=='error'){
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const UnknownStation();
        }));
      }
      else if (aqiDatas['status']=='ok'){
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return AqiMainScreen(
              datas: aqiDatas
          );
        }));
      }
      else{
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const LocationPermissionRequired();
        }));
      }

    }
  }//end getAqiDatas


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}