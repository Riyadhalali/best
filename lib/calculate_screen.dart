import 'package:best/textinputfield.dart';
import 'package:flutter/material.dart';

class CalculateScreen extends StatefulWidget {
  const CalculateScreen({Key? key}) : super(key: key);

  @override
  _CalculateScreenState createState() => _CalculateScreenState();
}

class _CalculateScreenState extends State<CalculateScreen> {
  int originalVolumeValve20 = 11;
  double constantValve20 = 29.8;

  int originalVolumeValve23 = 17;
  double constantValve23 = 23.8;

  int originalVolumeValve26 = 23;
  double constantValve26 = 22.6;

  int originalVolumeValve29 = 33;
  double constantValve29 = 19.6;
  double result = 0;
  String dropDownMenuValue = '';

  String option_1 = 'valve 20';
  String option_2 = 'valve 23';
  String option_3 = 'valve 26';
  String option_4 = 'valve 29';
  String selectedOption = '';
  List<String> dropDownItems = [
    '-10',
    '-9',
    '-8',
    '-7',
    '-6',
    '-5',
    '-4',
    '-3',
    '-2',
    '-1',
    '0',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10'
  ];

  final _dataController = TextEditingController();
  String? number;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text("Calculate Page"),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: columnElements(),
      ),
    );
  }

  Widget columnElements() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                Flexible(
                  flex: 1,
                  child: Text(
                    "20 mm Edwards",
                    textAlign: TextAlign.center,
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Radio(
                    value: 'valve 20',
                    groupValue: selectedOption,
                    onChanged: (String? value) {
                      setState(() {
                        selectedOption = value!;
                        print(selectedOption);
                      });
                    },
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Text(
                    "23 mm Edwards",
                    textAlign: TextAlign.center,
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Radio(
                    value: "valve 23",
                    groupValue: selectedOption,
                    onChanged: (String? value) {
                      setState(() {
                        selectedOption = value!;
                        print(selectedOption);
                      });
                    },
                  ),
                ),
                //--------------------------------option 3------------------------
                Flexible(
                  flex: 1,
                  child: Text(
                    "26 mm Edwards",
                    textAlign: TextAlign.center,
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Radio(
                    value: 'valve 26',
                    groupValue: selectedOption,
                    onChanged: (String? value) {
                      setState(() {
                        selectedOption = value!;
                        print(selectedOption);
                      });
                    },
                  ),
                ),
                //-------------------------------Option 4 ------------------------
                Flexible(
                  flex: 1,
                  child: Text(
                    "29 mm Edwards",
                    textAlign: TextAlign.center,
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Radio(
                    value: 'valve 29',
                    groupValue: selectedOption,
                    onChanged: (String? value) {
                      setState(() {
                        selectedOption = value!;
                        print(selectedOption);
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                  //-----------------------------------Display Text---------------------
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Text("Value of Extra/Minus Volume used"),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.1,
                    ),
                    DropdownButton(
                      items: dropDownItems.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          dropDownMenuValue = newValue.toString();
                        });
                        print(newValue);
                      },
                    ),
                    Text(dropDownMenuValue),
                  ]),
            ),
            //-----------------

            //----------------------Input Box-------------------------------------
            TextInputField(
              error_msg: "please enter intger number",
              hint_text: "Patient annulus area (mm\u{00B2}) ",
              controller_text: _dataController,
              show_password: false,
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Text("Enter aortic valve annulus area (mm\u{00B2})"),
              ),
            ),
            Center(
              child: ElevatedButton(
                //-> to change the color of the button
                style: ElevatedButton.styleFrom(primary: Colors.blue),
                child: Text("Calculate"),
                onPressed: calculateResults,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text('Your THV is Over/Under sized by: '),
            ]),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: Colors.red, width: 2)),
              child: Text(
                '$number %',
                style: TextStyle(fontSize: 30.0, color: Colors.red),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('- minus: undersized'),
                Text('+ plus: oversized'),
              ],
            )
          ],
        ),
      ),
    );
  }

  //-----------------------------------Calculate Results------------------------
  void calculateResults() {
    if (selectedOption == 'valve 20') {
      setState(() {
        result = ((((originalVolumeValve20 + int.parse(dropDownMenuValue)) * constantValve20) /
                    int.parse(_dataController.text)) *
                100.0) -
            100.0;
        number = result.toStringAsFixed(2);
      });

      print("result is:$result");
    }
    //-> valve 23
    if (selectedOption == 'valve 23') {
      setState(() {
        result = ((((originalVolumeValve23 + int.parse(dropDownMenuValue)) * constantValve23) /
                    int.parse(_dataController.text)) *
                100.0) -
            100.0;
        number = result.toStringAsFixed(2);
      });

      print("result is:$result");
    }
    //-> valve 26
    if (selectedOption == 'valve 26') {
      setState(() {
        result = ((((originalVolumeValve26 + int.parse(dropDownMenuValue)) * constantValve26) /
                    int.parse(_dataController.text)) *
                100.0) -
            100.0;
        number = result.toStringAsFixed(2);
      });

      print("result is:$result");
    }
    //-> valve 29
    if (selectedOption == 'valve 29') {
      setState(() {
        result = ((((originalVolumeValve29 + int.parse(dropDownMenuValue)) * constantValve29) /
                    int.parse(_dataController.text)) *
                100.0) -
            100.0;
        number = result.toStringAsFixed(2);
      });

      print("result is:$result");
    }
  }
//------------------------------------------------------------------------------
}
//TODO: make the ui better
//TODO: flex overflow in the right screen
