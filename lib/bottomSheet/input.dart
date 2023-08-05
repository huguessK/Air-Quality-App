import 'package:flutter/material.dart';
import 'package:air_quality_app/screens/loading.dart';


class Input extends StatelessWidget {
  const Input({super.key});

  @override
  Widget build(BuildContext context) {
    String newTown = 'CityName';
    return Container(
      color: const Color(0xff757575),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text(
              'Enter City Name',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25.0,
                color: Colors.lightBlueAccent,
              ),
            ),
            TextField(
              decoration: const InputDecoration.collapsed(
                  hintText:'Paris'
              ),
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (newText) {
                newTown = newText;
              },
            ),
            ElevatedButton(

              child: const Text(
                'See City Air Quality',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),

              onPressed: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return LoadingScreen(
                      location: newTown
                  );
                }));

              },
            ),
            const Text('Or',
            textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.lightBlueAccent,
                )
            ),

            ElevatedButton(
              child: const Text(
                'See Current City Air Quality',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),

              onPressed: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const LoadingScreen(
                      location: 'CurrentLocation'
                  );
                }));

              },
            ),
          ],
        ),
      ),
    );
  }
}