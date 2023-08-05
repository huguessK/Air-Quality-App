import 'package:flutter/material.dart';
import 'package:air_quality_app/constants/constants.dart';


class AboutAqi extends StatelessWidget {
  const AboutAqi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Back'),
          backgroundColor: Colors.black,
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
                      child: Text(
                        kWhatIsAqi1,
                        style: kAboutTextStyle.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left:5.0, right:5.0),
                      child: Text(
                        kWhatIsAqi2,
                        style:  kAboutTextStyle.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left:5.0, right:5.0),
                      child: Text(
                        kWhatIsAqi3,
                        style:  kAboutTextStyle.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,

                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left:5.0, right:5.0),
                      child: Text(
                        kWhatIsAqi4,
                        style:  kAboutTextStyle.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic
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