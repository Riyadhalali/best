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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculate Page"),
      ),
      body: SingleChildScrollView(child: columnElements()),
    );
  }

  Widget columnElements() {
    return Container(
      width: MediaQuery.of(context).size.width * 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("valve 20"),
                Radio(
                  value: 'valve 20',
                  groupValue: selectedOption,
                  onChanged: (String? value) {
                    setState(() {
                      selectedOption = value!;
                      print(selectedOption);
                    });
                  },
                ),
                Text("valve 23"),
                Radio(
                  value: "valve 23",
                  groupValue: selectedOption,
                  onChanged: (String? value) {
                    setState(() {
                      selectedOption = value!;
                      print(selectedOption);
                    });
                  },
                ),
                //--------------------------------option 3------------------------
                Text("valve 26"),
                Radio(
                  value: 'valve 26',
                  groupValue: selectedOption,
                  onChanged: (String? value) {
                    setState(() {
                      selectedOption = value!;
                      print(selectedOption);
                    });
                  },
                ),
                //-------------------------------Option 4 ------------------------
                Text("valve 29"),
                Radio(
                  value: 'valve 29',
                  groupValue: selectedOption,
                  onChanged: (String? value) {
                    setState(() {
                      selectedOption = value!;
                      print(selectedOption);
                    });
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Row(
                //-----------------------------------Display Text---------------------
                children: [
                  Container(
                    child: Text("Please Select Value"),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.1,
                  ),
                  DropdownButton(
                    items: dropDownItems
                        .map<DropdownMenuItem<String>>((String value) {
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
          //----------------------Input Box-------------------------------------
          TextInputField(
            error_msg: "please enter intger number",
            hint_text: "enter data please ",
            controller_text: _dataController,
            show_password: false,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          Center(
            child: ElevatedButton(
              child: Text("Calculate"),
              onPressed: calculateResults,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          Text('Results is: $result')
        ],
      ),
    );
  }

  //-----------------------------------Calculate Results------------------------
  void calculateResults() {
    if (selectedOption == 'valve 20') {
      setState(() {
        result = ((((originalVolumeValve20 - int.parse(dropDownMenuValue)) *
                        constantValve20) /
                    int.parse(_dataController.text)) *
                100.0) -
            100.0;
        result = result *
            -1; // i added this to correct the negative result that required to be
      });

      print("result is:$result");
    }
    //-> valve 23
    if (selectedOption == 'valve 23') {
      setState(() {
        result = ((((originalVolumeValve23 - int.parse(dropDownMenuValue)) *
                        constantValve23) /
                    int.parse(_dataController.text)) *
                100.0) -
            100.0;
        result = result *
            -1; // i added this to correct the negative result that required to be
      });

      print("result is:$result");
    }
    //-> valve 26
    if (selectedOption == 'valve 26') {
      setState(() {
        result = ((((originalVolumeValve26 - int.parse(dropDownMenuValue)) *
                        constantValve26) /
                    int.parse(_dataController.text)) *
                100.0) -
            100.0;
        result = result *
            -1; // i added this to correct the negative result that required to be
      });

      print("result is:$result");
    }
    //-> valve 29
    if (selectedOption == 'valve 29') {
      setState(() {
        result = ((((originalVolumeValve29 - int.parse(dropDownMenuValue)) *
                        constantValve29) /
                    int.parse(_dataController.text)) *
                100.0) -
            100.0;
        result = result *
            -1; // i added this to correct the negative result that required to be
      });

      print("result is:$result");
    }
  }
//------------------------------------------------------------------------------
}
