// Akira Nair
// University of Washington Medical Center
// Medical Handoff Checklist
// 06/2020

// import dart and flutter packages
//import 'dart:collection';
////import 'package:speech_recognition/speech_recognition.dart';
import 'package:flutter/material.dart';

//import 'dart:async';
//import 'dart:math';

//import 'package:speech_to_text/speech_recognition_error.dart';
//import 'package:speech_to_text/speech_recognition_result.dart';
//import 'package:speech_to_text/speech_to_text.dart';

// global constants for colors used in the app
const Color appRed = const Color.fromRGBO(214, 60, 80, 1);
const Color appGreen = Colors.green;
const Color inactive = Colors.white38;
const Color active = Colors.white;
const Color appGrey = Colors.black45;

// main method, runs app
void main() {
  runApp(MaterialApp(home: MyApp()));
}

// stateful widget used since state of app can be changed
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
// This widget is the root of your application.

// integer representing the index within the checklist items that is currently selected
  int selection = 0;
// controller for scrolling through the checklist
  final _controller = ScrollController();
// height parameter used for the controller
  final _height = 90.0;

////SpeechRecognition _speechRecognition;
////bool _isAvailable = false;
////bool _isListening = false;

////String resultText = '';
// speech recognition 2
// bool _hasSpeech = false;
// double level = 0.0;
// double minSoundLevel = 50000;
// double maxSoundLevel = -50000;
// String lastWords = "";
// String lastError = "";
// String lastStatus = "";
// String _currentLocaleId = "en_US";
// List<LocaleName> _localeNames = [LocaleName('en_US', 'English')];
// final SpeechToText speech = SpeechToText();

  @override
  void initState() {
    super.initState();
////initSpeechRecognizer();
  }
/*
  void initSpeechRecognizer() {
    print('initspeechrecognizer done');
    _speechRecognition = SpeechRecognition();
    _speechRecognition.setAvailabilityHandler((bool result) {
      setState(() => _isAvailable = result);
    });

    _speechRecognition.setRecognitionStartedHandler(() {
      setState(() {
        _isListening = true;
        print('setrecstart done');
      });
    });

    _speechRecognition.setRecognitionResultHandler((String speech) {
      setState(() {
        resultText = speech;
        if (resultText.length > 10) {
          setState(() {
            resultText = '';
            //_speechRecognition.stop();
            //_speechRecognition.recognitionStartedHandler.call();
            //_speechRecognition.recognitionCompleteHandler.call();
            //initSpeechRecognizer();
            print('setrecresult done');
          });
        }

        if (resultText == 'Complete') {
          checklistSet[checklistIndex][selection].changeStatus();
          changeColor(checklistSet[checklistIndex][selection], false);
          changeSelection(true);
          _animateToIndex(selection - 1);
        }
      });
    });

    _speechRecognition.setRecognitionCompleteHandler(() {
      setState(() {
        _isListening = false;
        print('complete handler');
        initSpeechRecognizer();
      });
    });

    _speechRecognition
        .activate()
        .then((result) => setState(() => _isAvailable = result));
  }

  void startMic() {
    _speechRecognition.listen(locale: 'en_US').then((result) {
      if (result.length > 10) {
        result = '';
        print('the result is longer than 10 char');
      }
      print('$result');
      print(result.length);
    });
  }
  */

// Future<void> initSpeechState() async {
//   bool hasSpeech = await speech.initialize(
//       onError: errorListener, onStatus: statusListener);
//   if (hasSpeech) {
//     _localeNames = await speech.locales();

//     var systemLocale = await speech.systemLocale();
//     _currentLocaleId = systemLocale.localeId;
//   }

//   if (!mounted) return;

//   setState(() {
//     _hasSpeech = hasSpeech;
//   });
// }

//credits to CopsOnRoad for animated scroll feature method
//https://stackoverflow.com/questions/49153087/flutter-scrolling-to-a-widget-in-listview
  _animateToIndex(index) => _controller.animateTo(_height * index,
      duration: Duration(seconds: 1), curve: Curves.fastOutSlowIn);

// Checkbox items
  static CheckboxItem item1 = new CheckboxItem(
      'Team Introductions',
      'Each team member introduces themselves by name and their role.',
      false,
      'Complete',
      active);
  static CheckboxItem item2 = new CheckboxItem(
      'Identity',
      'The patient identity is CONFIRMED by the NURSE and ANESTHESIA PROVIDER (or ICU PROVIDER) by reading the patient name and medical record number from the wrist band and comparing to the medical record.',
      false,
      'Confirmed',
      inactive);
  static CheckboxItem item3 = new CheckboxItem(
      'Procedural Course',
      'Procedural course REVIEWED by the PROCEDURALIST including the description of the procedure, any important events and bleeding issues.',
      false,
      'Reviewed',
      inactive);
  static CheckboxItem item4 = new CheckboxItem(
      'Bypass Time',
      'Bypass time SPECIFIED by the PROCEDURALIST unless N/A',
      false,
      'Specified',
      inactive);
  static CheckboxItem item5 = new CheckboxItem(
      'Cross-clamp time',
      'Cross-clamp time SPECIFIED by the PROCEDURALIST unless N/A',
      false,
      'Specified',
      inactive);
  static CheckboxItem item6 = new CheckboxItem(
      'Care pathway',
      'Post operative care pathway and any exceptions SPECIFIED by the PROCEDURALIST unless N/A',
      false,
      'Specified',
      inactive);
  static CheckboxItem item7 = new CheckboxItem(
      'Procedural Lines',
      'Post-operative care of procedural lines including tubes, drains and wires DISCUSSED by the PROCEDURALIST unless N/A',
      false,
      'Discussed',
      inactive);
  static CheckboxItem item8 = new CheckboxItem(
      'Dressing',
      'Post-operative care of wound dressing DISCUSSED by the PROCEDURALIST',
      false,
      'Discussed',
      inactive);
  static CheckboxItem item9 = new CheckboxItem(
      'PostOp meds',
      'Post-operative medications (e.g., immunosuppressants, steroids, and antibiotics) DISCUSSED by the PROCEDURALIST unless N/A.',
      false,
      'Discussed',
      inactive);
  static CheckboxItem item10 = new CheckboxItem(
      'Anticoagulation',
      'Post-operative anticoagulation plan SPECIFIED by the PROCEDURALIST unless N/A.',
      false,
      'Specified',
      inactive);
  static CheckboxItem item11 = new CheckboxItem(
      'Nutrition',
      'Post-operative nutrition plan SPECIFIED by the PROCEDURALIST unless N/A.',
      false,
      'Specified',
      inactive);
  static CheckboxItem item12 = new CheckboxItem(
      'Family update',
      'Post-operative family update DISCUSSED by the PROCEDURALIST indicating if the family was updated and if not, designating a provider that will update the family.',
      false,
      'Discussed',
      inactive);
  static CheckboxItem item13 = new CheckboxItem(
      'Length of Stay',
      'Projected ICU and hospital length of stay DISCUSSED by the PROCEDURALIST.',
      false,
      'Discussed',
      inactive);
  static CheckboxItem item14 = new CheckboxItem(
      'Anesthesia complications',
      'The ANESTHESIA PROVIDER DESCRIBES any anesthesia-related complications during the procedure and their management, discusses any concerns for further complications including pertinent rescue or crisis management plans.',
      false,
      'Described',
      inactive);
  static CheckboxItem item15 = new CheckboxItem(
      'Airway management',
      'The ANESTHESIA PROVIDER describes airway management including type of airway device and any difficulty with airway management.',
      false,
      'Described',
      inactive);
  static CheckboxItem item16 = new CheckboxItem(
      'Lines',
      'The ANESTHESIA PROVIDER specifies access lines including peripheral IV gauge and location, central venous catheter type and location, pulmonary artery catheter and arterial line location.',
      false,
      'Specified',
      inactive);
  static CheckboxItem item17 = new CheckboxItem(
      'Anesthetic drugs',
      'The ANESTHESIA PROVIDER specifies hypnotic drugs, analgesic drugs including any pre-operative analgesic drugs, total amount of each analgesic drug, last dose and time of analgesic drug.',
      false,
      'Specified',
      inactive);
  static CheckboxItem item18 = new CheckboxItem(
      'Neuromuscular Blockade',
      'The ANESTHESIA PROVIDER SPECIFIES if neuromuscular blocking drugs were used and reversed.',
      false,
      'Specified',
      inactive);
  static CheckboxItem item19 = new CheckboxItem(
      'Antibiotics',
      'The ANESTHESIA PROVIDER specifies each antibiotic dose and time of administration.',
      false,
      'Specified',
      inactive);
  static CheckboxItem item20 = new CheckboxItem(
      'Total fluids',
      'The ANESTHESIA PROVIDER specifies total amount of crystalloid and colloid including blood products.',
      false,
      'Specified',
      inactive);
  static CheckboxItem item21 = new CheckboxItem(
      'Urine output',
      'The ANESTHESIA PROVIDER specifies total urine output.',
      false,
      'Specified',
      inactive);
  static CheckboxItem item22 = new CheckboxItem(
      'Estimated blood loss',
      'Estimated blood loss SPECIFIED by the ANESTHESIA PROVIDER.',
      false,
      'Specified',
      inactive);
  static CheckboxItem item23 = new CheckboxItem(
      'Labs',
      'The intraoperative blood sugar and any other critical labs REVIEWED by the ANESTHESIA PROVIDER.',
      false,
      'Reviewed',
      inactive);
  static CheckboxItem item24 = new CheckboxItem(
      'Echocardiography',
      'Pre-procedural and post-procedural transesophageal echocardiography findings REVIEWED by the ANESTHESIA PROVIDER .',
      false,
      'Reviewed',
      inactive);
  static CheckboxItem item25 = new CheckboxItem(
      'Hemodynamics',
      'Significant intraoperative hemodynamic abnormalities DISCUSSED by the ANESTHESIA PROVIDER.',
      false,
      'Discussed',
      inactive);
  static CheckboxItem item26 = new CheckboxItem(
      'Infusions',
      'Drug infusion REVIEWED by the ANESTHESIA PROVIDER by specifying the infusion drug name and rate.',
      false,
      'Reviewed',
      inactive);
  static CheckboxItem item27 = new CheckboxItem(
      'Pacemakes/Defib Settings',
      'Pacemaker/defibrillator settings are SPECIFIED by the ANESTHESIA PROVIDER.',
      false,
      'Specified',
      inactive);
  static CheckboxItem item28 = new CheckboxItem(
      'Ventilator settings',
      'The ANESTHESIA PROVIDER SPECIFIES ventilator settings.',
      false,
      'Specified',
      inactive);
  static CheckboxItem item29 = new CheckboxItem(
      'Fast-tracking',
      'The ANESTHESIA PROVIDER and PROCEDURALIST DISCUSSED patient’s readiness for fast-tracking.',
      false,
      'Discussed',
      inactive);
  static CheckboxItem item30 = new CheckboxItem(
      'Blood availability',
      'The ANESTHESIA PROVIDER CONFIRMS the availability of blood products.',
      false,
      'Confirmed',
      inactive);
  static CheckboxItem item31 = new CheckboxItem(
      'Post-op pain management',
      'The ANESTHESIA PROVIDER describes post-op pain management including any peripheral nerve or neuraxial blocks and local anesthetic/opioid infusions.',
      false,
      'Described',
      inactive);
  static CheckboxItem item32 = new CheckboxItem(
      'Concerns',
      'Any unanswered questions and concerns of anyone on the TEAM DISCUSSED.',
      false,
      'Discussed',
      inactive);

// new items for PACU checklist
// same idea, make sure variable names can be differentiated from the ICU checklist items

  static CheckboxItem item1a = new CheckboxItem(
      'Team Introductions',
      'Each team member introduces themselves by name and their role.',
      false,
      'Complete',
      active);
  static CheckboxItem item2a = new CheckboxItem(
      'Identity',
      'The patient identity is CONFIRMED by the NURSE and ANESTHESIA PROVIDER (or ICU PROVIDER) by reading the patient name and medical record number from the wrist band and comparing to the medical record.',
      false,
      'Confirmed',
      inactive);
  static CheckboxItem item3a = new CheckboxItem(
      'Complications',
      'The ANESTHESIA PROVIDER describes any complications during the procedure and management, discusses any concerns for further complications including pertinent rescue or crisis management plans.',
      false,
      'Described',
      inactive);
  static CheckboxItem item4a = new CheckboxItem(
      'Allergies',
      'The ANESTHESIA PROVIDER specifies allergies.',
      false,
      'Specified',
      inactive);
  static CheckboxItem item5a = new CheckboxItem(
      'Anesthetic type',
      'The ANESTHESIA PROVIDER specifies the type of anesthetic such as general anesthesia, general plus regional anesthesia, regional anesthesia only or monitored anesthesia care.',
      false,
      'Specified',
      inactive);
  static CheckboxItem item6a = new CheckboxItem(
      'Neuromuscular Blockade',
      'The ANESTHESIA PROVIDER SPECIFIES if neuromuscular blocking drugs were used and reversed. If sugammadex was used in patient on hormonal birth control, discharge instructions should be initiated.',
      false,
      'Specified',
      inactive);
  static CheckboxItem item7a = new CheckboxItem(
      'Airway management',
      'The ANESTHESIA PROVIDER describes airway management including type of airway device and any difficulty with airway management.',
      false,
      'Described',
      inactive);
  static CheckboxItem item8a = new CheckboxItem(
      'Anesthetic Drugs',
      'The ANESTHESIA PROVIDER specifies hypnotic drugs, analgesic drugs including any pre-operative analgesic drugs, total amount of each analgesic drug, last dose and time of analgesic drug.',
      false,
      'Specified',
      inactive);
  static CheckboxItem item9a = new CheckboxItem(
      'PONV management',
      'The ANESTHESIA PROVIDER specifies anti-emetic drugs administered including any pre-operative anti-emetic drugs.',
      false,
      'Specified',
      inactive);
  static CheckboxItem item10a = new CheckboxItem(
      'Antibiotics',
      'The ANESTHESIA PROVIDER specifies each antibiotic dose and time of administration.',
      false,
      'Specified',
      inactive);
  static CheckboxItem item11a = new CheckboxItem(
      'Infusions',
      'The ANESTHESIA PROVIDER specifies drug infusions and rates.',
      false,
      'Specified',
      inactive);
  static CheckboxItem item12a = new CheckboxItem(
      'Lines',
      'The ANESTHESIA PROVIDER specifies access lines including peripheral IV gauge and location, central venous catheter type and location and arterial line location.',
      false,
      'Specified',
      inactive);
  static CheckboxItem item13a = new CheckboxItem(
      'Invasive Monitoring',
      'The ANESTHESIA PROVIDER discusses invasive monitors including invasive arterial blood pressure, central venous pressure, pulmonary artery catheter and/or TEE.',
      false,
      'Specified',
      inactive);
  static CheckboxItem item14a = new CheckboxItem(
      'Glucose management',
      'The ANESTHESIA PROVIDER specifies last glucose measurement and insulin infusion rate if applicable.',
      false,
      'Specified',
      inactive);
  static CheckboxItem item15a = new CheckboxItem(
      'Total fluids',
      'The ANESTHESIA PROVIDER specifies total amount of crystalloid and colloid including blood products. The ANESTHESIA PROVIDER also specifies blood products available.',
      false,
      'Specified',
      inactive);
  static CheckboxItem item16a = new CheckboxItem(
      'Urine output',
      'The ANESTHESIA PROVIDER specifies total urine output.',
      false,
      'Specified',
      inactive);
  static CheckboxItem item17a = new CheckboxItem(
      'Estimated blood loss',
      'Estimated blood loss SPECIFIED by the ANESTHESIA PROVIDER.',
      false,
      'Specified',
      inactive);
  static CheckboxItem item18a = new CheckboxItem(
      'Post-op pain management',
      'The ANESTHESIA PROVIDER describes post-op pain management including any peripheral nerve or neuraxial blocks and local anesthetic/opioid infusions.',
      false,
      'Described',
      inactive);
  static CheckboxItem item19a = new CheckboxItem(
      'Questions',
      'Any unanswered questions or concerns should be discussed by the ANESTHESIA PROVIDER and RECOVERY ROOM NURSE.',
      false,
      'Discussed',
      inactive);
/*
    To create a new checkbox item, type the following object template:

    static CheckboxItem item# = new CheckboxItem('name', 'description', false, 'complete', inactive);

    replace 'name' with the item's name
    replace 'description' with the item's description
    replace 'complete' with whatever text should be used to show the item's completion
    ensure that the three strings are surrounded by single-quotes

    Finally, append the 'item#' - the name of the variable - to the end of itemArray below

  */

  var itemArray = [
    item1,
    item2,
    item3,
    item4,
    item5,
    item6,
    item7,
    item8,
    item9,
    item10,
    item11,
    item12,
    item13,
    item14,
    item15,
    item16,
    item17,
    item18,
    item19,
    item20,
    item21,
    item22,
    item23,
    item24,
    item25,
    item26,
    item27,
    item28,
    item29,
    item30,
    item31,
    item32
  ];

// use this array for PACU checklist items
  var itemArray2 = [
    item1a,
    item2a,
    item3a,
    item4a,
    item5a,
    item6a,
    item7a,
    item8a,
    item9a,
    item10a,
    item11a,
    item12a,
    item13a,
    item14a,
    item15a,
    item16a,
    item17a,
    item18a,
    item19a
  ];

  List checklistSet = new List<List<CheckboxItem>>();
  List checklistLabels = new List<String>();
  int checklistIndex = 0;
  bool done = false;

  void createSet() {
    if (done) {
    } else {
      checklistSet.add(itemArray);
      checklistSet.add(itemArray2);
      checklistLabels.add('OR -> ICU');
      checklistLabels.add('OR -> PACU');
      done = true;
    }
  }

// Methods

// changes the color of the checkbox
// if init is true, then the box will be set to grey

  Color circleColor(int i) {
    if (i == checklistIndex) {
      return appRed;
    } else {
      return Colors.black;
    }
  }

  void changeColor(CheckboxItem cb, bool init) {
    setState(() {
      if (init) {
        cb.cbcolor = appGrey;
      } else {
        cb.cbcolor = cb.getColor();
      }
    });
  }

//advances the selection by 1
  void changeSelection(bool forward) {
    setState(() {
      if (forward) {
        selection++;
      } else {
        selection--;
      }

      if (selection > checklistSet[checklistIndex].length - 1) {
        selection = 0;
      }
      if (selection < 0) {
        selection = checklistSet[checklistIndex].length - 1;
      }

      print(selection);
      for (int ii = 0; ii < checklistSet[checklistIndex].length; ii++) {
        checklistSet[checklistIndex][ii].active = inactive;
      }
      checklistSet[checklistIndex][selection].active = active;
    });
  }

  void changeChecklist(bool forward) {
    setState(() {
      if (forward) {
        checklistIndex++;
      } else {
        checklistIndex--;
      }
      print(checklistSet.length);
      if (checklistIndex > checklistSet.length - 1) {
        checklistIndex = 0;
      }
      if (checklistIndex < 0) {
        checklistIndex = checklistSet.length - 1;
      }

      print(checklistIndex);
    });
  }

//sets the selection to index s
  void setSelection(int s) {
    setState(() {
      for (int ii = 0; ii < checklistSet[checklistIndex].length; ii++) {
        checklistSet[checklistIndex][ii].active = inactive;
      }
      checklistSet[checklistIndex][s].active = active;
      selection = s;
    });
    _animateToIndex(s - 1);
  }

//displays a pop up message for resetting the checklist
  void resetPopUp(BuildContext context) {
    var alertDialog = AlertDialog(
      title: Text('Reset checklist?'),
      content: Text(
          'All items will be initialized. This action cannot be reversed.'),
      actions: <Widget>[
        FlatButton(
          child: Text('NO'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        FlatButton(
          child: Text('YES'),
          onPressed: () {
            for (int i = 0; i < checklistSet[checklistIndex].length; i++) {
              checklistSet[checklistIndex][i].status = false;
              checklistSet[checklistIndex][i].initColor();
              changeColor(checklistSet[checklistIndex][i], true);
              setSelection(0);
            }
            Navigator.pop(context);
          },
        ),
      ],
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }

//builds the user interface
  @override
  Widget build(BuildContext context) {
    createSet();
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Center(
                  child: MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: Text(
                  'Medical Handoff Checklist',
                  style: TextStyle(color: Colors.black),
                ),
              )),
              backgroundColor: Colors.lightGreen[300],
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    height: 30,
                    width: 60,
                    child: FlatButton(
                      onPressed: () {
                        resetPopUp(context);
                      },
                      child: MediaQuery(
                        data: MediaQuery.of(context)
                            .copyWith(textScaleFactor: 1.0),
                        child: Text(
                          'Reset',
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            body: SafeArea(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: RaisedButton.icon(
                              onPressed: () {
                                changeChecklist(false);
                                selection = 0;
                              },
                              icon: Icon(Icons.chevron_left),
                              label: Text('')),
                        ),
                        Expanded(
                          child: Icon(
                            Icons.brightness_1,
                            color: circleColor(0),
                          ),
                        ),
                        Expanded(
                          child:
                              Icon(Icons.brightness_1, color: circleColor(1)),
                        ),
                        Expanded(
                          child: Icon(Icons.add_circle_outline,
                              color: circleColor(2)),
                        ),
                        Expanded(
                          child: RaisedButton.icon(
                              onPressed: () {
                                changeChecklist(true);
                                selection = 0;
                              },
                              icon: Icon(Icons.chevron_right),
                              label: Text('')),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: MediaQuery(
                      data:
                          MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                      child: Text(
                        checklistLabels[checklistIndex],
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ),
                  Center(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: FloatingActionButton(
                              backgroundColor: Colors.red,
                              onPressed: () {
////startMic();
                              },
                              child: Icon(Icons.mic)),
                        ),
                        Expanded(
                          child: FloatingActionButton(
                            backgroundColor: Colors.purple,
                            onPressed: () {
// if (_isListening) {
//   _speechRecognition.stop().then((result) =>
//       setState(() => _isListening = result));
// }
                            },
                            child: Icon(Icons.stop),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Text(''),
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: checklistSet[checklistIndex].length,
                        controller: _controller,
                        itemBuilder: (context, index) {
//var currentitem = itemArray[index];
                          var currentitem = checklistSet[checklistIndex][index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Container(
                                height: 70,
                                child: FlatButton(
                                  onPressed: () {
//itemArray[index].changeStatus();
//changeColor(itemArray[index], true);
                                    setSelection(index);
                                  },
                                  color: currentitem.cbcolor,
                                  splashColor: Colors.lightGreenAccent[100],
                                  child: MediaQuery(
//Credits to https://github.com/flutter/flutter/issues/25587

                                    data: MediaQuery.of(context)
                                        .copyWith(textScaleFactor: 1.0),
                                    child: Text(currentitem.name,
                                        style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                            color: currentitem.active)),
                                  ),
                                )),
                          );
                        }),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 240,
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              Center(
                                  child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 3),
                                child: MediaQuery(
                                  data: MediaQuery.of(context)
                                      .copyWith(textScaleFactor: 1.0),
                                  child: Text(
                                    checklistSet[checklistIndex][selection]
                                        .name,
                                    style: TextStyle(fontSize: 30),
                                  ),
                                ),
                              )),
                              Container(
                                  height: 100,
                                  child: Padding(
                                    padding: const EdgeInsets.all(7.0),
                                    child: MediaQuery(
                                      data: MediaQuery.of(context)
                                          .copyWith(textScaleFactor: 1.0),
                                      child: Text(checklistSet[checklistIndex]
                                              [selection]
                                          .description),
                                    ),
                                  )),
                              Row(children: <Widget>[
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 3),
                                  child: Container(
                                    width: 220,
                                    child: RaisedButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18.0),
                                          side: BorderSide(
                                              color: Colors.blueGrey)),
                                      color: checklistSet[checklistIndex]
                                              [selection]
                                          .cbcolor,
                                      onPressed: () {
                                        checklistSet[checklistIndex][selection]
                                            .changeStatus();
                                        changeColor(
                                            checklistSet[checklistIndex]
                                                [selection],
                                            false);
                                        changeSelection(true);
                                        _animateToIndex(selection - 1);
                                      },
                                      child: MediaQuery(
                                        data: MediaQuery.of(context)
                                            .copyWith(textScaleFactor: 1.0),
                                        child: Text(
                                          checklistSet[checklistIndex]
                                                  [selection]
                                              .complete,
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 3),
                                    child: RaisedButton.icon(
                                        onPressed: () {
                                          changeColor(
                                              checklistSet[checklistIndex]
                                                  [selection],
                                              false);
                                          changeSelection(true);
                                          if (selection ==
                                              checklistSet[checklistIndex]
                                                      .length -
                                                  1) {
                                          } else {
                                            _animateToIndex(selection - 1);
                                          }
                                        },
                                        icon: Icon(Icons.chevron_right),
                                        label: MediaQuery(
                                            data: MediaQuery.of(context)
                                                .copyWith(textScaleFactor: 1.0),
                                            child: Text('Skip'))),
                                  ),
                                )
                              ])
                            ],
                          ),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(163, 221, 227, 1),
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(199, 250, 255, 1),
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                    ),
                  )
                ],
              ),
            )));
  }
}

//   void startListening() {
//     lastWords = "";
//     lastError = "";
//     speech.listen(
//         onResult: resultListener,
//         listenFor: Duration(seconds: 5),
//         pauseFor: Duration(seconds: 5),
//         localeId: _currentLocaleId,
//         onSoundLevelChange: soundLevelListener,
//         cancelOnError: true,
//         partialResults: true,
//         onDevice: true,
//         listenMode: ListenMode.confirmation);
//     setState(() {});
//   }

//   void stopListening() {
//     speech.stop();
//     setState(() {
//       level = 0.0;
//     });
//   }

//   void cancelListening() {
//     speech.cancel();
//     setState(() {
//       level = 0.0;
//     });
//   }

//   void resultListener(SpeechRecognitionResult result) {
//     setState(() {
//       lastWords = "${result.recognizedWords} - ${result.finalResult}";
//     });
//   }

//   void soundLevelListener(double level) {
//     minSoundLevel = min(minSoundLevel, level);
//     maxSoundLevel = max(maxSoundLevel, level);
//     // print("sound level $level: $minSoundLevel - $maxSoundLevel ");
//     setState(() {
//       this.level = level;
//     });
//   }

//   void errorListener(SpeechRecognitionError error) {
//     // print("Received error status: $error, listening: ${speech.isListening}");
//     setState(() {
//       lastError = "${error.errorMsg} - ${error.permanent}";
//     });
//   }

//   void statusListener(String status) {
//     // print(
//     // "Received listener status: $status, listening: ${speech.isListening}");
//     setState(() {
//       lastStatus = "$status";
//     });
//   }
// }

// class for an "checklist item" object

class CheckboxItem {
//instance variables or properties

// name of the item, displayed on the checkbox
  String name;

// description of the item, displayed on the info container
  String description;

// boolean representing whether the item has been complete
  bool status;

// color of the checklist box
  Color cbcolor;

// text at bottom left of screen indicating completion of the object
  String complete;

// color for if this tile should be selected as an active
  Color active;

//constructors
  CheckboxItem(
      this.name, this.description, this.status, this.complete, this.active) {
    name = this.name;
    description = this.description;
    status = this.status;
    cbcolor = appGrey;
    complete = this.complete;
    active = this.active;
  }
  CheckboxItem.active(this.name, this.active) {
    name = this.name;
    description = '\ndescription\ndescription\ndescription';
    status = false;
    cbcolor = appGrey;
    complete = 'COMPLETE';
    active = this.active;
  }
  CheckboxItem.name(this.name) {
    name = this.name;
    description = '\ndescription\ndescription\ndescription';
    status = false;
    cbcolor = appGrey;
    complete = 'COMPLETE';
    active = inactive;
  }

//methods
  void changeStatus() {
    status = !status;
  }

  void initColor() {
    cbcolor = appGrey;
  }

  Color getColor() {
    if (status) {
      return appGreen;
    } else {
      return appRed;
    }
  }
}

/* NOTES FROM MEETINGS
- custom checklists
- 3rd party checklists
- uploading and downloading checklists from global server
*/
