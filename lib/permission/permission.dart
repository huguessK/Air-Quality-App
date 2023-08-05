import 'package:flutter/material.dart';


class LocationPermissionRequired extends StatelessWidget {
  const LocationPermissionRequired({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
          child: Message(),
        ),
    );
  }
}

class Message extends StatelessWidget {
  const Message({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
          title: const Text('Location Permission Required'),
          content: const Text('Turn On Location Services to Allow the App to Determine Your Location',
          textAlign: TextAlign.center,),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))
          ),
          actions: <Widget>[

            TextButton(
              onPressed: (){
                int count = 2;
                Navigator.of(context).popUntil((_) => count-- <= 0);
              },
              child: const Text('OK'),
            ),
          ],
        );
  }
}
