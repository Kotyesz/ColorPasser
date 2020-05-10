import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

void main() => runApp(SliderExample());

class SliderExample extends StatefulWidget {
  @override
  _SliderExampleState createState() {
    return _SliderExampleState();
  }
}

class _SliderExampleState extends State{
  int _redvalue = 0, _greenValue = 0, _blueValue = 0;
  TextEditingController addressField = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      title: 'Color Picker',
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 32, 32, 32),
            title: Text(
                'Color Picker',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
            ),
          ),
          body: ListView(
            children: <Widget>[
              Center(
                child: Text(
                  "RED",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Slider(
                 value: _redvalue.toDouble(),
                 min: 0.0,
                 max: 255,
                 divisions: 256,
                 activeColor: Colors.red,
                 inactiveColor: Color.fromARGB(255, 100, 0, 0),
                 onChanged: (double newValue) {
                  setState(() {
                   _redvalue = newValue.round();
                  });
                 },
              ),
              Center(
                child: Text(
                  "GREEN",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Slider(
                  value: _greenValue.toDouble(),
                  min: 0.0,
                  max: 255,
                  divisions: 256,
                  activeColor: Colors.green,
                  inactiveColor: Color.fromARGB(255, 0, 100, 0),
                  onChanged: (double newValue) {
                    setState(() {
                      _greenValue = newValue.round();
                    });
                  },
              ),
              Center(
                child: Text(
                  "BLUE",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Slider(
                  value: _blueValue.toDouble(),
                  min: 0.0,
                  max: 255,
                  divisions: 256,
                  activeColor: Colors.blue,
                  inactiveColor: Color.fromARGB(255, 0, 0, 100),
                  onChanged: (double newValue) {
                    setState(() {
                      _blueValue = newValue.round();
                    });
                  },
              ),
              RaisedButton(
                onPressed:() {
                  http.get('http://${addressField.text}:9871/color/:$_redvalue:$_greenValue:$_blueValue:');
                },
                color: Color.fromARGB(255, _redvalue, _greenValue, _blueValue),
                child: Text(
                  "Change!",
                  style: TextStyle(
                    color: Color.fromARGB(255, -_redvalue+255, -_greenValue+255, -_blueValue+255),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 32, 32, 32),
                  borderRadius:  BorderRadius.circular(32),
                ),
                child: TextField(
                  controller: addressField,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(fontSize: 17),
                    hintText: 'Host ip',
                    suffixIcon: Icon(
                        Icons.adjust,
                      color: Color.fromARGB(255, _redvalue, _greenValue, _blueValue),
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(20),
                  ),
                ),
              ),
            ],
          )
      ),
    );
  }
}