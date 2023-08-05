import 'package:flutter/material.dart';
import 'package:air_quality_app/constants/constants.dart';

class UnknownStation extends StatelessWidget {
  const UnknownStation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Back'),
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
            child: Scrollbar(
              radius: const Radius.circular(5.0),
              thumbVisibility: true,
              thickness: 5.0,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Image(
                      image: AssetImage('images/Home.jpg'),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left:5.0, right:5.0),
                      child: Text('Unknown Station',
                        textAlign: TextAlign.center,
                        style: kAboutTextStyle.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 40.0,
                        ),
                      ),
                    ),

                  ],

                ),
              ),
            )
        )
    );


  }
}