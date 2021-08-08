import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'calculate_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.purple),
      home: WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text("TAVRizer11"),
      ),
      body: columnElements(),
    );
  }

  Widget columnElements() {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width * 100,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      "Disclaimer ",
                      style: TextStyle(
                          fontSize: 25.0, fontWeight: FontWeight.bold),
                    ),
                    Text('The TAVRizer App has been developed as a reference, a calculator and a guide only and no representations or guarantees as to the' +
                        'completeness, accuracy or adequacy of any of the information contained in the TAVRizer. The developers do not guarantee the App' +
                        's compatibility with any policies and procedures of hospitals, healthcare systems or clinics. The  TAVRizer is solely a calculator that guides physicians and does not take into account the circumstances of' +
                        'The developers of the TAVRizer App shall not be liable for any claims or losses arising from the use or misuse of the TAVRizer App, its contents, any omissions from its contents, or otherwise. It is solely designed to be a calculator and it’s output is dependent on the user’s input and user’s accuracy of obtaining the raw information. '),
                    Text(
                      'About',
                      style: TextStyle(
                          fontSize: 25.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                        'The TAVRizer App (TAVR Sizer) is an idea by Mohammed Qintar, MD (Strucutral Interventional Cardiologist at Sparrow Hospital / Michigan State University in Lansing, MI). It aims to help TAVR team members calculate; with ease, the over/under sizing percent of the Edwards Sapien valve in relation to an individual patient’s aortic valve annulus; based on the volume (ml) injected into the Edwards Sapien balloon (nominal, plus or minus). The goal of the valve is to make the calculation easy and quick. This should help the team calculate multiple scenarios quickly to arrive to a desirable sizing percentage. '),
                    Text(
                      '*Twitter handle: *@MohammedQintar',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Email: smarterkidzllc@gmail.com',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // Text('Developed By: Riyad Al-Ali & Ahmad Sabbagh',
                    //     style: TextStyle(fontWeight: FontWeight.bold))
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          Center(
            child: ElevatedButton(
              child: Text("Accept"),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => CalculateScreen()));
              },
            ),
          ),
        ],
      ),
    );
  }
}
