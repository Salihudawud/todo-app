import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ourtodo1/home.dart';
import 'package:ourtodo1/utils.dart';

class Create_Todo extends StatelessWidget {
  Create_Todo({Key? key}) : super(key: key);
  final controllerTitle = TextEditingController();
  final controllerdescription = TextEditingController();
  final controllerDate = TextEditingController();
  final controllerTime = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create What You Want Todo'),
      ),
      body: Form(
        key: formkey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'title required';
                  }
                },
                controller: controllerTitle,
                maxLines: 2,
                decoration: const InputDecoration(
                    labelText: 'Title',
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                    hintText: 'Please type your event detail',
                    hintStyle: TextStyle(color: Colors.black),
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.lightBlue))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'description required';
                  }
                },
                maxLines: 1,
                controller: controllerdescription,
                decoration: const InputDecoration(
                    labelText: 'Description',
                    labelStyle: TextStyle(
                      color: Colors.blue,
                    ),
                    hintText: 'Please type your event',
                    hintStyle: TextStyle(color: Colors.black),
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.lightBlue))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Date required';
                        }
                      },
                      controller: controllerDate,
                      maxLines: 2,
                      onTap: () {
                        showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime.now()
                                    .add(const Duration(days: 365)))
                            .then((selectDate) {
                          final DateFormat _dateFormat =
                              DateFormat('dd/MM/yyyy');
                          controllerDate.text = _dateFormat.format(selectDate!);
                        });
                      },
                      decoration: const InputDecoration(
                          labelText: 'Date',
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                          hintText: 'enter date',
                          hintStyle: TextStyle(color: Colors.black),
                          border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.lightBlue))),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Time required';
                        }
                      },
                      controller: controllerTime,
                      maxLines: 2,
                      onTap: () {
                        showTimePicker(
                                context: context, initialTime: TimeOfDay?.now())
                            .then((selectTime) {
                          controllerTime.text = selectTime!.format(context);
                        });
                      },
                      decoration: const InputDecoration(
                          labelText: 'Time',
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                          hintText: 'enter time',
                          hintStyle: TextStyle(color: Colors.black),
                          border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.lightBlue))),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              child: ElevatedButton(
                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      print('Successful');
                      print(controllerDate.text);
                      print(controllerTitle.text);
                      print(controllerTime.text);
                      print(controllerdescription.text);
                    }
                  },
                  child: const Text(
                    'create',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
